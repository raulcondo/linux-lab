# Mapa del Sistema de Archivos Linux

Linux emplea una estructura jerárquica para gestionar toda la información del sistema. Esto implica que todo se encuentra dentro de un extenso árbol
de carpetas que comienza desde un punto principal conocido como raíz. Cada directorio tiene una función específica que contribuye a mantener el sistema 
en orden.

---

## /

- **Propósito:** Es el directorio principal del sistema.  
- **Contenido / Uso:** Desde aquí se organizan todas las demás carpetas del sistema.  

---

## /home

- **Propósito:** Almacenar los archivos personales de los usuarios.  
- **Contenido / Uso:** Documentos, descargas y configuraciones propias de cada usuario.  

---

## /etc

- **Propósito:** Guardar configuraciones del sistema.  
- **Contenido / Uso:** Archivos de configuración de servicios, red y usuarios.  

---

## /var

- **Propósito:** Almacenar información que cambia constantemente mientras el sistema está en funcionamiento.  
- **Contenido / Uso:** Registros de actividad, archivos de aplicaciones y datos temporales generados por programas.  

---

## /bin

- **Propósito:** Contener programas básicos del sistema.  
- **Uso:** Herramientas esenciales necesarias para ejecutar comandos fundamentales.  

---

## /usr

- **Propósito:** Contener la mayoría de los programas y herramientas instaladas para los usuarios.  
- **Contenido / Uso:** Incluye bibliotecas y recursos necesarios para que el software funcione adecuadamente.  

---

## /tmp

- **Propósito:** Almacenar archivos temporales creados por el sistema o por programas en ejecución.  
- **Uso:** Estos archivos normalmente se eliminan automáticamente después de reiniciar el equipo.  

---

## /boot

- **Propósito:** Guardar los archivos necesarios para arrancar el sistema operativo.  
- **Contenido / Uso:** Elementos esenciales que permiten que Linux inicie correctamente.  

---

## /dev

- **Propósito:** Representar los dispositivos del sistema como archivos.  
- **Ejemplos:** Discos duros, memorias USB, teclados y otros componentes de hardware.  

---

## /proc

- **Propósito:** Mostrar información generada por el sistema.  
- **Uso:** Contiene datos sobre los procesos en ejecución y el estado del hardware.  
- **Nota:** No almacena archivos reales.
