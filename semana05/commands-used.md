# Comandos Usados - Semana 5

## Información del sistema
- `uname -s` Nombre del kernel
- `uname -r` Versión del kernel
- `uname -m` Arquitectura del procesador
- `hostname` Nombre del equipo
- `uptime -p` Tiempo encendido en formato legible
- `date` Fecha y hora del sistema

## CPU y memoria
- `nproc` Número de núcleos disponibles
- `free -h` Uso de RAM en formato humano
- `uptime | awk` Extraer carga de CPU del uptime

## Disco
- `df -h` Uso de disco en formato legible
- `df -h | grep -v` Excluir sistemas virtuales (tmpfs, udev)

## Procesos
- `ps aux` Todos los procesos (formato BSD)
- `ps aux --sort=-%cpu` Ordenar por CPU descendente
- `ps -u $USER` Procesos del usuario actual
- `ps --no-headers` Omitir encabezado (útil con wc -l)

## Variables usadas
- `$USER` Usuario actual del sistema
- `$#` Número de argumentos del script
- `$1` Primer argumento
- `$(comando)` Sustitución de comandos
- `${var:-default}` Valor por defecto si var esta vacia
