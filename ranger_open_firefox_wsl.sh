#!/bin/bash
# set -exuo pipefail
#
# This script is helpful for when I run ranger from WSL and want to open PDF files
# in my host Windows Firefox when clicking enter. Also works for marking several files
# and clicking enter.
# @date 2023-08-06

final_args=''
for arg in "$@"; do
    clean_arg=$(echo $arg | sed -E 's/\/mnt\/c/C:/g' | sed -E 's/\//\\/g')
    final_args="$final_args \"$clean_arg\""
done
# firefox.exe has to be in the Windows PATH for this to work
eval firefox.exe "$final_args"
