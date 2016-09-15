#!/bin/bash

#.script/change-site-theme.sh
########################
# change the theme of site

if [ -z "$1" | $# -eq 0 ]; then
    SITE_THEME=default
else
    SITE_THEME=$1
fi


