#!/usr/bin/env bash
echo $(find . -not -path "*git*" -and -not -name "bootstrap.sh" -and -not -type "d" -exec basename {} \;)

