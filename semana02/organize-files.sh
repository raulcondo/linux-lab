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
# Organizar imagenes
echo "[3/4] Organizando imagenes..."
mv *.jpg organized/images/ 2>/dev/null || true
mv *.png organized/images/ 2>/dev/null || true
mv *.gif organized/images/ 2>/dev/null || true
echo "Imagenes organizadas"
# Organizar scripts
echo "Organizando scripts..."
mv *.sh organized/scripts/ 2>/dev/null || true
mv *.py organized/scripts/ 2>/dev/null || true
echo "scripts organizados"
# Organizar configuraciones
echo "Organizando configuraciones..."
mv *.conf organized/config/ 2>/dev/null || true
mv *.json organized/config/ 2>/dev/null || true
mv *.xml organized/config/ 2>/dev/null || true
echo "configuraciones organizadas"
# Organizar logs
echo "Organizando logs..."
mv *.log organized/logs/ 2>/dev/null || true
echo "Logs organizados"
