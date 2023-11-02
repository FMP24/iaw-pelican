Title: Pelican
Date: 2023-11-02 19:08
Category: Tutorials

## Introducción
Pelican es un generador de páginas web escrito en python. Utilizado principalmente para entradas de blog estáticas.

##Configuración
Configurar pelican es muy sencillo, Tu archivo de configuración por defecto es pelicanconf.py, que se ha generado con el comando **pelican-quickstart** , un script que ejecutas al inicio y te genera una configuración inicial que tu puedes modificar cambiando variables en el fichero anteriormente mencionado.

### Algunas de las variables mas importantes: 
- __SITENAME__: Cambia la etiqueta html "<title\>
- __PATH__: directorio de los ficheros markdown a convertir a html con el comando "pelican"
- __THEME__: Variable que indica la ruta del directorio de los temas css
- __TIMEZONE__: Huso horario de la página
- __DEFAULT\_LANG__: cambiar el idioma por defecto en el que se generan las páginas

## Como desarrollar una página en pelican
1. Creas los archivos .md a tu gusto y los pones en la carpeta /content/
2. Añades la ruta al tema css. Recomiendo utilizar este [repositorio de github](https://github.com/getpelican/pelican-themes)
3. ejecutas el comando "pelican <ruta de los archivos md>" que normalmente sera content.
```pelican content```
4. Abres el servidor al localhost para previsualizar con el siguiente comando:
```pelican --listen```
5. Sube tu producto finalizado a un repositorio de github. No hace falta subir los archivos generados en la carpeta `output` 
6. Consigue un dominio
7. Subelo a tu desplegador favorito!
