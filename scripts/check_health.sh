#!/bin/bash

# --- Configuración ---
# Este directorio sera donde se registrarán los resultados de la verificación de salud.
LOG_FILE="/c/MisBackups/logs_mantenimiento/check_health.log" 

# Rutas a los ejecutables de XAMPP y MySQL
XAMPP_CONTROL_EXE="/c/xampp/xampp-control.exe" # Ruta al ejecutable de inicio de XAMPP Control Panel
MYSQL_CMD="/c/xampp/mysql/bin/mysql"           # Ruta al cliente MySQL para verificar conexión

# --- Crear directorio de logs de mantenimiento si no existe ---
LOGS_MAINTENANCE_DIR=$(dirname "$LOG_FILE")
mkdir -p "$LOGS_MAINTENANCE_DIR"

# --- Iniciar el registro ---
echo "--- Verificación de Salud del Sistema - $(date) ---" >> "$LOG_FILE"

# --- Verificar servicio Apache (Puerto 80) ---
echo "Verificando Apache (puerto 80)..." >> "$LOG_FILE"
netstat -ano | findstr ":80" | findstr "LISTENING" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "  [OK] Apache: Puerto 80 está escuchando." >> "$LOG_FILE"
else
    echo "  [ERROR] Apache: Puerto 80 NO está escuchando. Intentando iniciar..." >> "$LOG_FILE"

    # Se intenta iniciar Apache usando XAMPP_CONTROL_EXE
    "$XAMPP_CONTROL_EXE" startapache >> "$LOG_FILE" 2>&1
    sleep 5     
    netstat -ano | findstr ":80" | findstr "LISTENING" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "  [OK] Apache: Iniciado exitosamente." >> "$LOG_FILE"
    else
        echo "  [CRÍTICO] Apache: No se pudo iniciar el servicio." >> "$LOG_FILE"
    fi
fi

# --- Verificar servicio MySQL/MariaDB ---
echo "Verificando MySQL/MariaDB..." >> "$LOG_FILE"
"$MYSQL_CMD" -u root -e "SELECT 1;" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "  [OK] MySQL/MariaDB: Conexión exitosa." >> "$LOG_FILE"
else
    echo "  [ERROR] MySQL/MariaDB: No se pudo conectar. Intentando iniciar..." >> "$LOG_FILE"
    # Intentar iniciar MySQL usando XAMPP_CONTROL_EXE
    "$XAMPP_CONTROL_EXE" startmysql >> "$LOG_FILE" 2>&1
    sleep 5 # Esperar un momento
    "$MYSQL_CMD" -u root -e "SELECT 1;" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "  [OK] MySQL/MariaDB: Iniciado exitosamente." >> "$LOG_FILE"
    else
        echo "  [CRÍTICO] MySQL/MariaDB: No se pudo iniciar el servicio." >> "$LOG_FILE"
    fi
fi

# --- Verificar Espacio en Disco (en la unidad C:) ---
echo "Verificando Espacio en Disco (C:)..." >> "$LOG_FILE"

USAGE_PERCENT=$(df -h /c/ | tail -n 1 | awk '{print $5}' | sed 's/%//g')
THRESHOLD=80 # Umbral de alerta: 80% de uso
if [ "$USAGE_PERCENT" -ge "$THRESHOLD" ]; then
    echo "  [ALERTA] Espacio en Disco (C:): Usado al $USAGE_PERCENT%. ¡Considerar liberar espacio!" >> "$LOG_FILE"
else
    echo "  [OK] Espacio en Disco (C:): Usado al $USAGE_PERCENT%." >> "$LOG_FILE"
fi

echo "--- Fin de la Verificación de Salud - $(date) ---" >> "$LOG_FILE"
echo "" >> "$LOG_FILE" #
