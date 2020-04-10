#!/bin/bash

TEMP_PATH="/tmp/proj/credential"
CREDENTIAL_REPO_URL="github.com/tianhaoz95/instaview-credentials.git"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"
TEMP_ROOT="$(dirname "$TEMP_PATH")"
echo "Project root is $PROJ_ROOT"


if [ -z "${GITHUB_TOKEN}" ]
then
  echo "GITHUB_TOKEN not found, cannot download credentials."
  exit 1
else
  rm -rf ${TEMP_PATH}
  mkdir -p ${TEMP_ROOT}
  git clone https://${GITHUB_TOKEN}@${CREDENTIAL_REPO_URL} ${TEMP_PATH}
fi

rm -f $PROJ_ROOT/app/android/app/google-services.json
cp ${TEMP_PATH}/google-services.json $PROJ_ROOT/app/android/app/google-services.json

rm -f $PROJ_ROOT/app/ios/Runner/GoogleService-Info.plist
cp ${TEMP_PATH}/GoogleService-Info.plist $PROJ_ROOT/app/ios/Runner/GoogleService-Info.plist

rm -f $PROJ_ROOT/app/macos/Runner/GoogleService-Info.plist
cp ${TEMP_PATH}/GoogleService-Info.plist $PROJ_ROOT/app/macos/Runner/GoogleService-Info.plist

echo "Finished copying google services credentials."