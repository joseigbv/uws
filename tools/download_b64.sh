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
tmpfile='/tmp/.uwsd'

# codificamos a b64 y descargamos
wget -q -O $tmpfile "$url?cmd=uuencode -m $fi $fo" || \
        echo 'error: fallo de conexion!'

# decodificamos a binario
uudecode $tmpfile

# borramos temporales
rm $tmpfile

