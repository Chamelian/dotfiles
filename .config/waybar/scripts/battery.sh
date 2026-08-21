#!/bin/sh
charge=$(apcaccess -p BCHARGE)
charge="${charge::-10}"
if (( charge >= 75 )) then
    echo -e " ${charge}%\n\nFull"
elif (( charge < 75 )) && (( charge >= 50 )) then
    echo -e " ${charge}%\n\ntriquarter"
elif (( charge < 50 )) && (( charge >= 25 )) then
    echo -e " ${charge}%\n\nhalf"
elif (( charge < 25 )) && (( charge >= 10 )) then
    echo -e " ${charge}%\n\nquarter"
else
    echo -e " ${charge}%\n\ncritical"
fi