#!/bin/sh
available=$(checkupdates | wc -l)
if (( available > 0)) then
    echo "󰏔 ${available}"
else
    echo ""
fi
