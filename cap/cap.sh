#!/bin/sh

cap() { cat > /tmp/capture.out; }
cap_copy() { tee /tmp/capture.out; }
ret() { cat /tmp/capture.out; }
to_var() { var=$("$@"); }
copy_to_var() { var=$("$@"); echo "$var"; }

echo Testing cap... | cap
echo Doing stuff...
ret | grep cap

echo

echo Testing cap_copy... | cap_copy
echo Doing stuff...
ret | grep cap

echo

to_var echo Testing to_var...
echo Doing stuff...
echo "$var"

echo

copy_to_var echo Testing copy_to_var...
echo Doing stuff...
echo "$var"
