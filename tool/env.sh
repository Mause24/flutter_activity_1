#!/bin/bash
# tool/env.sh

ENV=$1
ACTION=$2

ENV_FILE=".env.$ENV"

if [ ! -f $ENV_FILE ]; then
  echo "❌ Archivo $ENV_FILE no encontrado!"
  exit 1
fi

# Cargar variables del archivo .env (ignora líneas vacías y comentarios)
export $(grep -v '^#' $ENV_FILE | xargs)

# Ejecutar flutter run con los --dart-define
CMD="flutter ${ACTION:-run} \
  --dart-define=API_URL=$API_URL \
  --dart-define=FEATURE_X=$FEATURE_X"

echo "▶️ Ejecutando: $CMD"
$CMD
