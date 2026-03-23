# Comandos Usados - Semana 6

## Condicionales
- `[ -d dir ]` Verificar que existe y es un directorio
- `[ -f archivo ]` Verificar que existe y es un archivo regular
- `[ -r ruta ]` Verificar permiso de lectura
- `[ -s archivo ]` Verificar que el archivo no estaá vacio
- `[ -e ruta ]` Verificar que existe (cualquier tipo)
- `[ -z "$var" ]` Verificar que la cadena esta vacia
- `[ -n "$var" ]` Verificar que la cadena no esta vacia
- `[ $a -eq $b ]` Comparar números: igual
- `[ $a -lt $b ]` Comparar números: menor que
- `[ $a -gt $b ]` Comparar números: mayor que

## Estructura de control
- `if/elif/else/fi` Estructura condicional
- `case/esac` Comparacion contra multiples patrones
- `return 0|1` Codigo de salida de una funcion
- `local var` Variable local a una funcion

## Logging y salida
- `tee -a archivo` Escribir en pantalla y agregar al archivo
- `printf "[%s]..."` Formato estructurado de log

## Tamaño y tiempo de archivos
- `du -sm dir` Tamano del directorio en MB (solo total)
- `du -sh dir` Tamano en formato legible
- `find -mtime -1` Archivos modificados en las ultimas 24h
- `find -mtime +7` Archivos modificados hace mas de 7 dias
- `find -maxdepth 1` No descender a subdirectorios
- `find ... | sort | tail -1` Obtener el archivo mas reciente

## Combinaciones lógicas
- `&&` AND: ambas condiciones deben ser verdaderas
- `||` OR: al menos una condicion verdadera
- `!` NOT: niega la condicion
