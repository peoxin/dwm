#!/usr/bin/env bash

killall trayer

if [ $? != 0 ]; then
    trayer --edge bottom --distance 10 --align right --widthtype request --transparent true --padding 3
fi
