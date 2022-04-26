#!/bin/sh

slurp_file() {
    _filename=$1
    { grep -Pzq '.*\n\z' "$_filename" && 
        POSIX_FRIENDLY_FILE=true; } ||
        POSIX_FRIENDLY_FILE=false
    file=$(cat "$_filename")
}

print_file() {
    { [ $POSIX_FRIENDLY_FILE = true ] &&
        echo "$file\n\c"; } ||
        echo "$file\c"
}

printf "example with file1:
'''"
slurp_file file1
print_file
echo "'''"

printf "example with file2:
'''"
slurp_file file2
print_file
echo "'''"

printf "example with file3:
'''"
slurp_file file3
print_file
echo "'''"
