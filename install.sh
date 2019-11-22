#!/bin/sh

set -e

if [ -z $PREFIX ]; then
  export PREFIX=$(pwd)
fi

# Parse args
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --prefix)
      shift
      PREFIX="$1"
      ;;
  esac
  shift
done

curl -L https://finwo.github.io/phpvm/phpvm > "${PREFIX}/bin/phpvm"
