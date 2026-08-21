#!/bin/sh
player_status=$(playerctl -p vlc status)
urldecode () { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
if [ "$player_status" = "Playing" ]; then
    title=$(urldecode $(basename $(playerctl -p vlc metadata xesam:url)))
    echo "${title:0:-4}" # :30:-18}" # - $(playerctl -p vlc metadata title)"
elif [ "$player_status" = "Paused" ]; then
    title=$(urldecode $(basename $(playerctl -p vlc metadata xesam:url)))
    echo " ${title:0:-4}" # :30:-18}" # - $(playerctl -p vlc metadata title)"
fi
