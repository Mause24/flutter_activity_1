#!/bin/bash
# .tool/pre-commit.sh

echo "🔍 Ejecutando pre-commit hooks..."

# 1. Formatear el código
echo "▶️ Formateando código..."
dart format --set-exit-if-changed .

if [ $? -ne 0 ]; then
  echo "❌ El código no está formateado. Se corrigió automáticamente."
  exit 1
fi

# 2. Análisis estático
echo "▶️ Analizando proyecto..."
flutter analyze

if [ $? -ne 0 ]; then
  echo "❌ Errores encontrados en el análisis. Corrige antes de commitear."
  exit 1
fi

# 3. Tests (opcional, descomenta si quieres que corran SIEMPRE antes de commit)
# echo "▶️ Corriendo tests..."
# flutter test
# if [ $? -ne 0 ]; then
#   echo "❌ Tests fallaron. Corrige antes de commitear."
#   exit 1
# fi

echo "✅ Pre-commit hooks completados correctamente."
exit 0
