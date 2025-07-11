#!/bin/bash

# --- Configuración ---
LOGS_DIR="/c/xampp/apache/logs" 
DIAS_A_MANTENER=7

# --- Cambiar al directorio de logs ---
cd "$LOGS_DIR" || { echo "ERROR: No se pudo acceder al directorio de logs: $LOGS_DIR. Verifique la ruta." >> /tmp/limpiar_logs_error.log; exit 1; }

# --- Comprimir logs antiguos y eliminar los muy viejos ---
echo "--- Iniciando limpieza y rotación de logs en $(date) ---"

# Rotar y comprimir access.log
if [ -f "access.log" ]; then
    mv access.log "access_$(date +"%Y%m%d_%H%M%S").log"
    touch access.log # Crea un nuevo archivo access.log vacío
    echo "Rotado access.log"
fi

# Rotar y comprimir error.log
if [ -f "error.log" ]; then
    mv error.log "error_$(date +"%Y%m%d_%H%M%S").log"
    touch error.log # Crea un nuevo archivo error.log vacío
    echo "Rotado error.log"
fi

# Se bucan archivos (.log y .gz) que no sean los actuales (access.log, error.log) y que tengan más de DIAS_A_MANTENER de antigüedad
find . -type f \( -name "access_*.log" -o -name "error_*.log" \) -mtime +"$DIAS_A_MANTENER" -delete
echo "Logs más antiguos de $DIAS_A_MANTENER días eliminados."

echo "--- Limpieza de logs completada en $(date) ---"
echo "" 
