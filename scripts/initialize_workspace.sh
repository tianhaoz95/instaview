#!/bin/bash

npm install -g prettier
npm install -g yarn
npm install -g firebase-tools

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"
echo "Project root is $PROJ_ROOT"

cd $PROJ_ROOT/functions
npm install
cd $PROJ_ROOT

cd $PROJ_ROOT/docs
yarn
cd $PROJ_ROOT

cd $PROJ_ROOT/app
flutter channel dev
flutter config --enable-web
flutter pub get
cd $PROJ_ROOT