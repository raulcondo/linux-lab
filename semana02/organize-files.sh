#!/bin/bash
set -e  # Salir si hay error
echo "=== Organizador de Archivos ==="
echo ""
# Crear estructura de directorios
echo "[1/4] Creando directorios..."
mkdir -p organized/{documents,images,scripts,config,logs,temp}
echo "Directorios creados"
# Organizar documentos
echo "[2/4] Organizando documentos..."
mv *.txt organized/documents/ 2>/dev/null || true
mv *.md organized/documents/ 2>/dev/null || true
mv *.doc organized/documents/ 2>/dev/null || true
echo "Documentos organizados"
