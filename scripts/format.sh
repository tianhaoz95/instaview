#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"
echo "Project root is $PROJ_ROOT"

echo "Navigating to project root @ $PROJ_ROOT ..."
cd $PROJ_ROOT

echo "Formatting gitpod config files ..."

prettier --write ".gitpod.yml"

echo "Formatting firebase config files ..."

prettier --write "firebase.json"

echo "Formatting markdown files ..."

prettier --write \
  "README.md" \
  "CODE_OF_CONDUCT.md" \
  "app/**/*.md" \
  "docs/docs/**/*.md"

echo "Formatting TypeScript files ..."

prettier --write \
  "functions/src/**/*.ts"

echo "Formatting flutter code ..."
cd app
flutter format .
cd ..