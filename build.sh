#!/usr/bin/env bash

set -e

# Download preprocessor
[ -f "bashpp" ] || {
  curl -Ls https://raw.githubusercontent.com/iwonbigbro/bashpp/master/bin/bashpp > bashpp
  chmod +x bashpp
}

# <<<<<<< Updated upstream
./bashpp -I inc -o dist/phpvm src/phpvm
# =======
# # Include all patches
# rm -rf inc/patches
# mkdir inc/patches
# find patches | sort | while read filename; do
#   if [ -d $filename ]; then
#     continue
#   fi
#   mkdir -p inc/$(dirname $filename)
#   echo "#include <$filename>" >> inc/patches/all
#   version=$(basename $(dirname $filename))
#   minor=$(echo "${version}" | tr '.' ' ' | awk '{print $2}')
#   major=$(echo "${version}" | tr '.' ' ' | awk '{print $1}')
#   CONTENTS="$(cat $filename | base64 --wrap 0)"
#   echo "if [ \"\${major}\" -eq \"${major}\" ] && [ \"\${minor}\" -eq \"${minor}\" ]; then" >> inc/$filename
#   echo "PATCHES+=(\"$CONTENTS\")"                                                          >> inc/$filename
#   echo "fi"                                                                                >> inc/$filename
# done

# # Build extension handlers
# rm -rf inc/ext
# mkdir -p inc/ext/all
# echo "ALLEXTS=()" > inc/ext/all/list
# touch inc/ext/all/deps
# touch inc/ext/all/install
# find src/ext -mindepth 1 -maxdepth 1 -type d | sort | while read extdir; do

#   # Ext inclusion
#   extname=$(basename "${extdir}")
#   mkdir -p "inc/ext/${extname}"
#   echo "ALLEXTS+=(\"${extname}\")" >> inc/ext/all/list

#   # Flags
#   if [ -f "src/ext/${extname}/flags" ]; then
#     echo "if contains \"\${EXTS[@]}\" \"${extname}\"; then"              >> "inc/ext/${extname}/flags"
#     echo "  CONFOPTS=\"\${CONFOPTS} $(cat "src/ext/${extname}/flags")\"" >> "inc/ext/${extname}/flags"
#     echo "fi"                                                            >> "inc/ext/${extname}/flags"
#   fi

#   # Libs
#   if [ -f "src/ext/${extname}/libs" ]; then
#     echo "if contains \"\${EXTS[@]}\" \"${extname}\"; then" >> "inc/ext/${extname}/deps"
#     cat "src/ext/${extname}/libs" | while read libname; do
#       echo "  LIBS+=(\"${libname}\")" >> "inc/ext/${extname}/deps"
#     done
#     echo "fi" >> "inc/ext/${extname}/deps"
#   fi

#   if [ -f "inc/ext/${extname}/deps" ]; then
#     echo "#include \"../${extname}/deps\"" >> inc/ext/all/deps
#   fi
#   if [ -f "inc/ext/${extname}/flags" ]; then
#     echo "#include \"../${extname}/flags\"" >> inc/ext/all/flags
#   fi

# done

# ./bashpp -I inc -o dist/phpvm src/phpvm 
# >>>>>>> Stashed changes
chmod +x dist/phpvm
