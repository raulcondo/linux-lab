# Comandos Utilizados - Semana 3

## Procesamiento de Texto

### grep

```bash
grep -c "| ERROR |" sistema.log # Contar coincidencias
grep -E "\| (ERROR|FATAL) \|" log # Expresión extendida
```

**Para qué sirve:** Filtrar líneas por patrón.

### cut

```bash
cut -d'|' -f2 sample.log # Campo 2 con separador |
cut -d'|' -f4 sample.log # Campo 4 (mensaje)
```

**Para qué sirve:** Extraer columnas de texto estructurado.

### sort

```bash
sort archivo.txt # Orden alfabético
sort -rn archivo.txt # Reverso numérico
sort -k2 tabla.txt # Por columna 2
```

**Para qué sirve:** Ordenar líneas (necesario antes de uniq).

### uniq

```bash
sort file | uniq -c # Contar frecuencias
sort file | uniq -d # Solo duplicados
```

**Para qué sirve:** Eliminar o contar líneas duplicadas.

### wc

```bash
wc -l archivo.txt # Contar líneas
grep "ERROR" log | wc -l # Contar errores
```

**Para qué sirve:** Contar líneas, palabras o bytes.

### tr

```bash
tr -d ' ' # Eliminar espacios
tr 'a-z' 'A-Z' # Cambiar a mayúsculas
```

**Para qué sirve:** Transformar o eliminar caracteres.

### awk

```bash
awk '{print $2}' archivo # Imprimir col 2
awk '{sum+=$1} END{print sum}' # Sumar columna
awk -F'|' '{print $2}' # Separador |
```

**Para qué sirve:** Procesar y calcular sobre columnas.

## Redirección y Pipes

```bash
comando > archivo.txt # Guardar salida
comando >> archivo.txt # Agregar a archivo
comando 2>/dev/null # Suprimir errores
cmd1 | cmd2 | cmd3 # Encadenar comandos
```

## Pipeline Completo del Analizador

```bash
cut -d'|' -f2 sample.log | \
tr -d ' ' | \
sort | \
uniq -c | \
sort -rn | \
head -10
```

**Lectura:** Extrae IPs quita espacios ordena cuenta frecuencias ordena por frecuencia top 10.
