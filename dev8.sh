#!/bin/bash
set -u

URL="https://raw.githubusercontent.com/nrjdalal/zrn/master"

new=${URL}/utils.sh

TBS=$(mktemp)
curl -fsSL $new

# source $TBS

# echo "${Magenta}hello world!${Off}"
