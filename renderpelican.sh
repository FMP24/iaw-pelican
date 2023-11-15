#!/bin/bash

# Variables
BASE_DIR="/home/fran/venv/pelican"
PELICAN_DIR="$BASE_DIR/web"
OUTPUT_DIR="$BASE_DIR/output"


# Error handling

# No correr como root
if [ $(id -u) -e 0 ]
  then echo "¡¡No corras este script con permisos de root!!"
  exit
fi

# Error de uso
if [ "$#" -ne 2 && "$#" -ne 1 ]; then
        echo "Uso: $0 <Nombre rama> [Origen (Por defecto: origin)] "
        IFS="$saved_ifs"
        exit 1
fi

# Origen default -> origin
if [ "$#" -eq 1 ]; then
	$2="origin"
fi

#Script
pelican -s "$PELICAN_DIR"/pelicanconf.py
echo "Generando página web..."
pelican "$PELICAN_DIR"/content > /dev/null
cp -r "$PELICAN_DIR"/output/* "$OUTPUT_DIR"


echo "Actualizando repositorio principal"
cd "$PELICAN_DIR"
git add .
git commit -a -m "Actualización automática del sitio"
git push origin "$BRANCH"

echo "Actualizando repositorio de salida"
cd "$OUTPUT_DIR"
git add .
git commit -a -m "Actualización automática del sitio"
git push "$2" "$1"

exit 0
