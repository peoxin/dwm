#!/usr/bin/env bash

uname -r | awk -F "-" '{print $1}'
