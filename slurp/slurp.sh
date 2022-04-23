#!/bin/sh

slurp_file_to_str() {
    file=$1
    { grep -Pzq '.*\n\z' "$file" && 
        touch /tmp/POSIX_FRIENDLY_FILE; } ||
        rm /tmp/POSIX_FRIENDLY_FILE 2> /dev/null
    str=$(cat "$file")
}

print_str() {
    [ -f /tmp/POSIX_FRIENDLY_FILE ] &&
        echo "$str\n\c" ||
        echo "$str\c"
}

printf "example with file1:
'''"
slurp_file_to_str file1
print_str
echo "'''"

printf "example with file2:
'''"
slurp_file_to_str file2
print_str
echo "'''"

printf "example with file3:
'''"
slurp_file_to_str file3
print_str
echo "'''"
