#!/bin/bash

# --- Configuración ---
DB_USER="root"          
DB_NAME="webdesarrollojava" 
BACKUP_DIR="/c/MisBackups/${DB_NAME}" 
MYSQLDUMP_PATH="/c/xampp/mysql/bin/mysqldump" 

# --- Se crea directorio de backups si no existe ---
mkdir -p "$BACKUP_DIR"

# --- Generar nombre de archivo con fecha y hora ---
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_${DB_NAME}_${FECHA}.sql"

# --- Realizar el backup ---
"$MYSQLDUMP_PATH" -u "$DB_USER" "$DB_NAME" > "$BACKUP_FILE"

# --- Verificar si el backup fue exitoso ---
if [ $? -eq 0 ]; then
    echo "Backup de la base de datos '$DB_NAME' creado exitosamente: $BACKUP_FILE"
else
    echo "ERROR: Falló la creación del backup de la base de datos '$DB_NAME'."
fi
