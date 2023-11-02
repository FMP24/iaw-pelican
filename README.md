# iaw-pelican

**Crear entorno virtual con las dependencias**
```apt-get install python3-venv

python3 -m venv <nombre_entorno>

source <nombre_entorno>/bin/activate```

**Dentro del entorno:**
```pip install pelican[markdown]```

**Despues, Crear una carpeta dentro del entorno y meter el repositorio dentro.**
```mkdir <nombre_carpeta>```

**Correr en local:**
```cd <nombre_carpeta>

pelican content

pelican --listen```
