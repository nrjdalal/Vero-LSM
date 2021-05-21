#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/utils.sh >/tmp/utils.sh

source /tmp/utils.sh

rm utils.sh

echo "${Magenta}hello world!${Off}"
