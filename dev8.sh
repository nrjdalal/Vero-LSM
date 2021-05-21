#!/bin/bash
set -u

URL="https://raw.githubusercontent.com/nrjdalal/zrn/master"

TBS=$(mktemp)
curl -fsSL $URL/utils.sh

# source $TBS

# echo "${Magenta}hello world!${Off}"
