#!/bin/sh
echo -ne '\033c\033]0;PajtiProject\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/PajtiProject.x86_64" "$@"
