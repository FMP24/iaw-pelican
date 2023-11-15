#!/bin/bash

# Variables
BASE_DIR="/home/fran/venv/pelican"
PELICAN_DIR="$BASE_DIR/web"
OUTPUT_DIR="$BASE_DIR/output"
ORIGIN="$2"
BRANCH="$1"

# Error handling

# No correr como root
if [ $(id -u) -eq 0 ]; then
        echo "¡¡No corras este script con permisos de root!!"
        exit 1
fi

# Error de uso
if [ "$#" -ne 2 ] && [ "$#" -ne 1 ]; then
        echo "Uso: $0 <Nombre rama> [Origen (Por defecto: origin)] "
        exit 1
fi

# Origen default -> origin
[ "$#" -eq 1 ] && ORIGIN="origin"

#Script
pelican -s "$PELICAN_DIR"/pelicanconf.py
echo "Generando página web..."
pelican "$PELICAN_DIR"/content > /dev/null
cp -r "$PELICAN_DIR"/output/* "$OUTPUT_DIR"

echo "Actualizando repositorio principal"
cd "$PELICAN_DIR"
git add . > /dev/null
git commit -a -m "Actualización automática del sitio" > /dev/null
git push origin "$BRANCH" > /dev/null 2>&1

echo "Actualizando repositorio de salida"
cd "$OUTPUT_DIR"
git add . > /dev/null
git commit -a -m "Actualización automática del sitio" > /dev/null
git push "$ORIGIN" "$BRANCH" > /dev/null 2>&1

exit 0
