#!/bin/sh

set -e

if [ -z $VERSION ]; then
  export VERSION=master
fi

if [ -z $PREFIX ]; then
  export PREFIX="${HOME}"
fi

# Parse args
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --prefix)
      shift
      PREFIX="$1"
      ;;
    --version)
      shift
      VERSION="$1"
      ;;
  esac
  shift
done

mkdir -p "${PREFIX}/bin"
curl -sL "https://raw.githubusercontent.com/finwo/phpvm/${VERSION}/dist/phpvm" | tee -a "${PREFIX}/bin/phpvm" >/dev/null
chmod +x "${PREFIX}/bin/phpvm"
