#!/bin/bash

# Defina as variáveis do banco de dados
DB_USER="postgres"
DB_NAME="teste"
BACKUP_DIR="/home/arthur"

# Defina o nome do arquivo de backup com a data atual
BACKUP_FILE="$BACKUP_DIR/backup_$(date +"%Y%m%d_%H.%M.%S").sql"

# Executa o comando pg_dump para criar o backup
pg_dump -U $DB_USER -d $DB_NAME > $BACKUP_FILE

