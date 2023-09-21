# Linux-Host-Discovery
El siguiente script se emplea para llevar a cabo un escaneo de los hosts activos en mi segmento de red, con el propósito de obtener un panorama detallado del entorno en el que estamos operando.  
El código será capaz de detectar los hosts disponibles y además identificar si el host es de sistema operativo Linux o Windows en base a su TTL.

# Forma de ejecución
```
1- chmod +x host_discovery.sh
2- ./host_discovery.sh -i 127.0.0.

Si tu IP es 10.10.0.130 debes ejecutar el script de la siguiente manera. ./host_discovery.sh -i 10.10.0.
```

# Diccionario de comandos
```
-i = ip
-h = help
```
