#!/bin/bash

# backup-check.sh - Validador de backups
# Uso: ./backup-check.sh [directorio_backup]
#
# Verifica existencia, antigüedad y tamaño de backups.
# Genera un log con el resultado de cada verificación.

# === Constantes configurables ===
readonly VERSION="1.0.0"
readonly DIR_BACKUP="${1:-/backup}"
readonly DIR_LOGS="$(dirname "$0")/logs"
readonly LOGFILE="$DIR_LOGS/backup-check-$(date +%Y%m%d).log"
readonly MAX_HORAS_SIN_BACKUP=24
readonly MIN_TAMANIO_MB=10
readonly MAX_TAMANIO_MB=50000

# === Variables de estado global ===
estado_global="OK"

# === Función de uso ===
uso() {
    echo "Uso: $0 [directorio_backup]"
    echo ""
    echo "  directorio_backup  Directorio a verificar"
    echo "                      (por defecto: /backup)"
    echo ""
    echo "Opciones:"
    echo "  --version  Versión del script"
    echo "  --help     Esta ayuda"
    echo ""
    echo "Ejemplos:"
    echo "  $0"
    echo "  $0 /mnt/respaldo"
    echo "  $0 ~/backup-prueba"
    exit 2
}

# === Función de logging ===
# Uso: log NIVEL "mensaje"
log() {
    local nivel="$1"
    local mensaje="$2"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    printf "[%s] [%-7s] %s\n" "$timestamp" "$nivel" "$mensaje" \
    | tee -a "$LOGFILE"

    # Actualizar estado global
    if [ "$nivel" = "ERROR" ] && [ "$estado_global" != "ERROR" ]; then
        estado_global="ERROR"
    elif [ "$nivel" = "WARNING" ] && [ "$estado_global" = "OK" ]; then
        estado_global="WARNING"
    fi
}

# === Verificación 1: existencia del directorio ===
verificar_directorio() {

log "INFO" "Verificando directorio: $DIR_BACKUP"

if [ ! -e "$DIR_BACKUP" ]; then
    log "ERROR" "El directorio '$DIR_BACKUP' no existe."
    return 1
fi

if [ ! -d "$DIR_BACKUP" ]; then
    log "ERROR" "'$DIR_BACKUP' existe pero no es un directorio."
    return 1
fi

if [ ! -r "$DIR_BACKUP" ]; then
    log "ERROR" "Sin permiso de lectura en '$DIR_BACKUP'."
    return 1
fi

log "OK" "Directorio accesible: $DIR_BACKUP"
return 0
}
# === Verificación 2: existencia de archivos de backup ===
verificar_archivos () {

log "INFO" "Buscando archivos de backup (*.tar.gz)..."

local total
total=$(find "$DIR_BACKUP" -maxdepth 1 -type f \
-name "*.tar.gz" | wc -l)

if [ "$total" -eq 0 ]; then
    log "ERROR" "No se encontraron archivos .tar.gz en $DIR_BACKUP"
    return 1
fi

log "OK" "Se encontraron $total archivo(s) de backup."

# Verificar que el más reciente no está vacío
local ultimo
ultimo=$(find "$DIR_BACKUP" -maxdepth 1 -type f \
-name "*.tar.gz" | sort | tail -1)

if [ ! -s "$ultimo" ]; then
    log "WARNING" "El archivo más reciente está vacío: $ultimo"
    return 0
fi

log "OK" "Último backup: $(basename "$ultimo")"
return 0
}

# === Verificación 3: antigüedad del último backup ===
verificar_antiguedad () {

    log "INFO" "Verificando antigüedad del backup más reciente ..."

    local dias_limite=$(( MAX_HORAS_SIN_BACKUP / 24 ))
    [ "$dias_limite" -eq 0 ] && dias_limite=1

    local recientes

    recientes=$(find "$DIR_BACKUP" -maxdepth 1 -type f -name "*.tar.gz" -mtime -"$dias_limite" | wc -l)

    if [ "$recientes" -eq 0 ]; then
        log "WARNING" "No se encontraron backups recientes (últimas ${MAX_HORAS_SIN_BACKUP} horas)."
        estado_global="WARNING"
        return 0
    fi

    log "OK" "$recientes backup(s) recientes (últimas ${MAX_HORAS_SIN_BACKUP} horas)."
    return 0
}
# === Procesar argumentos especiales ===
case "${1:-}" in
    --version) echo "backup-check.sh v$VERSION"; exit 0 ;;
    --help|-h) uso ;;
esac
mkdir -p "$DIR_LOGS"
# === Inicio del reporte ===
log "INFO" "=== backup-check.sh v$VERSION - Inicio ==="
log "INFO" "Directorio objetivo: $DIR_BACKUP"

# Ejecutar verificaciones
# Si el directorio no existe, no tiene sentido continuar
if ! verificar_directorio; then
log "ERROR" "Verificación abortada: directorio inaccesible."
exit 1
fi

verificar_archivos
verificar_antiguedad
