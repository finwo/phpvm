#!/usr/bin/env bash

# Hard-crash everything
set -e

# Download preprocessor
[ -f "bashpp" ] || {
  curl -Ls https://raw.githubusercontent.com/iwonbigbro/bashpp/master/bin/bashpp > bashpp
  chmod +x bashpp
}

# Remove old patches
rm -rf inc/patches

# Include all patches
mkdir inc/patches
find patches | while read filename; do
  if [ -d $filename ]; then
    continue
  fi
  mkdir -p inc/$(dirname $filename)
  echo "#include <$filename>" >> inc/patches/all
  version=$(basename $(dirname $filename))
  minor=$(echo "${version}" | tr '.' ' ' | awk '{print $2}')
  major=$(echo "${version}" | tr '.' ' ' | awk '{print $1}')
  CONTENTS="$(cat $filename | base64 --wrap 0)"
  echo "if [ \"\${major}\" -eq \"${major}\" ] && [ \"\${minor}\" -eq \"${minor}\" ]; then" >> inc/$filename
  echo "PATCHES+=(\"$CONTENTS\")"                                                          >> inc/$filename
  echo "fi"                                                                                >> inc/$filename
done

./bashpp -I inc -o dist/phpvm src/phpvm 
chmod +x dist/phpvm
