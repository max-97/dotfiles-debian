#!/usr/bin/env bash

SINK=$(pactl list short sinks | sed -e 's,^\\([0-9][0-9]*\\)[^0-9].*,\\1,' | head -n 1 | awk '{print $1}');

get () {
    pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '{print $2}' | tr -d ' %'
}

mute () {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
}

if [[ $1 == "get" ]]; then
    get
fi

if [[ $1 == "mute" ]]; then
    mute
fi
