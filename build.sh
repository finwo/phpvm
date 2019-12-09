#!/usr/bin/env bash

# Hard-crash everything
set -ex

# Download preprocessor
[ -f "bashpp" ] || {
  curl -Ls https://raw.githubusercontent.com/iwonbigbro/bashpp/master/bin/bashpp > bashpp
  chmod +x bashpp
}

./bashpp -I inc -o dist/phpvm src/phpvm 
chmod +x dist/phpvm
