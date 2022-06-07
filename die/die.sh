#!/bin/sh

die() { echo "$@" >&2; exit 1; }

# user=

[ -n "${user+_}" ] || die '$user not defined'

echo user is defined
