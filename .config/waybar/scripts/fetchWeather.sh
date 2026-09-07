#!/bin/sh
secrets=$(cat "$HOME/.config/waybar/scripts/weatherSecrets")
lat=$(echo "${secrets}" | jq -r ".lat")
long=$(echo "${secrets}" | jq -r ".long")
apiKey=$(echo "${secrets}" | jq -r ".apiKey")
apiData=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&units=imperial&lang=en&appid=${apiKey}")

while getopts ":i :d :t :h :f :w" arg; do
    case "${arg}" in
        i)
            icon=$(echo "${apiData}" | jq -r ".weather.[0].icon")
            curl -s "https://openweathermap.org/payload/api/media/file/${icon}.png" > "$HOME/.config/waybar/scripts/icons/${icon}.png"
            echo "$HOME/.config/waybar/scripts/icons/${icon}.png"
            ;;
        d)
            desc=$(echo "${apiData}" | jq -r ".weather.[0].description")
            echo "${desc}"
            ;;
        t)
            temp=$(echo "${apiData}" | jq -r ".main.temp")
            if [[ $temp > 90 ]]; then
                echo -e "${temp}\n\ncritical"
            elif [[ $temp > 80 ]]; then
                echo -e "${temp}\n\nhot"
            elif [[ $temp > 70 ]]; then
                echo -e "${temp}\n\nwarm"
            elif [[ $temp > 60 ]]; then
                echo -e "${temp}\n\nmid"
            elif [[ $temp > 50 ]]; then
                echo -e "${temp}\n\ncool"
            elif [[ $temp > 40 ]]; then
                echo -e "${temp}\n\ncold"
            else
                echo -e "${temp}\n\nfreezing"
            fi
            ;;
        h)
            humidity=$(echo "${apiData}" | jq -r ".main.humidity")
            if [[ $humidity > 90 ]]; then
                echo -e "${humidity}\n\ncritical"
            elif [[ $humidity > 70 ]]; then
                echo -e "${humidity}\n\nhigh"
            elif [[ $humidity > 50 ]]; then
                echo -e "${humidity}\n\nnormal"
            elif [[ $humidity > 25 ]]; then
                echo -e "${humidity}\n\ndry"
            else
                echo -e "${humidity}\n\ndesert"
            fi
            ;;
        f)
            feelsLike=$(echo "${apiData}" | jq -r ".main.feels_like")
            echo "${feelsLike}"
            ;;
        w)
            wind=$(echo "${apiData}" | jq -r ".wind.speed")
            echo "${wind}"
            ;;
        *)
            echo "ERROR"
            exit 1
            ;;
    esac
done
