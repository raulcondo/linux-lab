# Semana 03: Procesamiento de Texto y Pipes

## Objetivo

Desarrollar un analizador de logs usando únicamente herramientas de procesamiento de texto UNIX: grep, cut, sort, uniq, wc, tr y awk.

---

## Archivos del Proyecto

| Archivo | Descripción |
|--------|-------------|
| `generate-sample-log.sh` | Genera 500 entradas de log de prueba |
| `log-analyzer.sh` | Analizador principal |
| `report.md` | Reporte generado en Markdown |
| `commands-used.md` | Documentación de comandos y pipelines |

> `sample.log` y `analysis-report.txt` no se versionan (.gitignore)

---

## Uso

### 1. Generar log de prueba

```bash
./generate-sample-log.sh
```

### 2. Analizar el log

```bash
# Usar log de prueba
./log-analyzer.sh

# Usar otro archivo de log
./log-analyzer.sh /var/log/syslog
```

### 3. Ver el reporte

```bash
cat report.md
```

---

## Secciones del Análisis

1. **Top 10 IPs** con más actividad
2. **Distribución por severidad** (FATAL, ERROR, WARNING, INFO)
3. **Línea de tiempo** de eventos por hora
4. **Top 5 mensajes** de error más frecuentes
5. **Reporte Markdown** generado automáticamente

---

## Pipeline Principal

```bash
# Extraer IPs, ordenar y contar frecuencias
cut -d'|' -f2 sample.log | tr -d ' ' | \
sort | uniq -c | sort -rn | head -10
```

---

## Comandos Aprendidos

- `grep` — Buscar patrones en texto
- `cut` — Extraer columnas
- `sort` — Ordenar líneas
- `uniq -c` — Contar frecuencias
- `wc -l` — Contar líneas
- `tr` — Transformar caracteres
- `sed` — Editar flujo de texto 
- `awk` — Procesar columnas
- `|` — Encadenar comandos
- `>`, `>>`, `2>/dev/null` — Redirección

---

## Checklist

- [x] Script generador funcional
- [x] Analizador con 5 secciones
- [x] Reporte en Markdown generado
- [x] Comandos documentados 
- [x] Desarrollo incremental con 8+ commits
