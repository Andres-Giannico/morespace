#!/bin/bash
# Script para subir More Space a GitHub con GitHub CLI
# Ejecutar en la terminal: ./subir-github.sh

set -e
cd "$(dirname "$0")"

# 1. Comprobar que gh está instalado
if ! command -v gh &>/dev/null; then
  echo "Instalando GitHub CLI..."
  brew install gh
fi

# 2. Comprobar que estás logueado
if ! gh auth status &>/dev/null; then
  echo "Necesitas iniciar sesión en GitHub."
  echo "Se abrirá el navegador o podrás pegar un token."
  gh auth login
fi

# 3. Commit si hay cambios sin commitear (o aún no hay ningún commit)
# (core.hooksPath=/dev/null evita el error "trailer" con algunos entornos Git)
if [[ -n $(git status -s) ]] || ! git rev-parse --verify HEAD &>/dev/null; then
  echo "Haciendo commit de los archivos..."
  git add -A
  git -c core.hooksPath=/dev/null commit -m "Initial commit" || git commit -m "Initial commit"
fi

# 4. Crear repo en GitHub y subir (repo público, nombre: morespace)
echo "Creando repositorio 'morespace' en GitHub y subiendo código..."
gh repo create morespace --public --source=. --remote=origin --push

echo ""
echo "Listo. Repo creado y código subido."
echo "URL: https://github.com/$(gh api user -q .login)/morespace"
