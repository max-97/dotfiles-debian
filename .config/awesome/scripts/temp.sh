#!/usr/bin/env bash

get () {
    path="/sys/class/hwmon/hwmon2/temp3_input"

    local max_temp=100
    local temp=$(cat $path)

    jq -n $temp/1000
}

_ () {
  ${@}
  exit 0
}

if [[ $1 == "get" ]]; then
  _ get
fi
