#!/bin/bash

# NOTA: primero es necesario subir a mano binhex 

# constantes constantes
TMPFILE='/tmp/binhex'
HEXBIN='./hexbin'
BINHEX='/tmp/binhex'

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

# codificamos a b64 y descargamos
wget -q -O $TMPFILE "$url?cmd=$BINHEX < $fi" || \
        echo 'error: fallo de conexion!'

# decodificamos a binario
$HEXBIN < $TMPFILE >  $fo

# borramos temporales
rm $TMPFILE

