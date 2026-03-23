# Semana 06: Bash Scripting - Condicionales

## Descripcion

backup-check.sh valida el estado de un directorio de backups.
Verifica existencia, contenido, antiguedad y tamano, y emite un diagnostico con niveles OK / WARNING / ERROR.

## Uso

```bash
./backup-check.sh                 # Usa /backup por defecto
./backup-check.sh /mnt/respaldo   # Directorio personalizado
./backup-check.sh ~/backup-prueba # Directorio de prueba
./backup-check.sh --version       # Versión del script
./backup-check.sh --help          # Ayuda
```

## Estructura

```
semana06/
|-- README.md
|-- backup-check.sh
|-- commands-used.md
`-- logs/
    `-- backup-check-YYYYMMDD.log
```

## Verificaciones que realiza

1. Existencia y permisos del directorio de backups
2. Presencia de archivos .tar.gz y que no estan vacios
3. Antiguedad: alerta si el ultimo backup supera las 24 horas
4. Tamano: alerta si el directorio esta fuera del rango esperado

## Salida de ejemplo

```
[2026-03-15 14:32:01] [INFO ] === backup-check.sh v1.0.0 - Inicio ===
[2026-03-15 14:32:01] [INFO ] Directorio objetivo: /backup
[2026-03-15 14:32:01] [INFO ] Verificando directorio: /backup
[2026-03-15 14:32:01] [OK ] Directorio accesible: /backup
[2026-03-15 14:32:01] [INFO ] Buscando archivos de backup...
[2026-03-15 14:32:01] [OK ] Se encontraron 3 archivo(s) de backup.
[2026-03-15 14:32:01] [OK ] Último backup: backup_2026-03-15.tar.gz
[2026-03-15 14:32:01] [INFO ] Verificando antigüedad...
[2026-03-15 14:32:01] [OK ] 1 backup(s) recientes (últimas 24h).
[2026-03-15 14:32:01] [INFO ] Verificando tamaño...
[2026-03-15 14:32:01] [OK ] Tamaño dentro del rango: 1842 MB
[2026-03-15 14:32:01] [INFO ] === Verificación completada ===
[2026-03-15 14:32:01] [OK ] RESULTADO: todos los checks pasaron.
```

## Conceptos aprendidos

- El comando test y la sintaxis [ ] y [[ ]]
- if / elif / else con operadores numéricos, de cadena y de archivo
- Operadores lógicos &&, || y !
- La estructura case / esac
- Funciones con parámetros, return y local
- Logging estructurado con tee -a
- Medicion de espacio con du -sm
- Busqueda por antiguedad con find -mtime
