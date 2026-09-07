#!/bin/sh
secrets=$(cat "$HOME/.config/waybar/scripts/weatherSecrets")
lat=$(echo "${secrets}" | jq -r ".lat")
long=$(echo "${secrets}" | jq -r ".long")
apiKey=$(echo "${secrets}" | jq -r ".apiKey")
apiData=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&units=imperial&lang=en&appid=${apiKey}")

icon=$(echo "${apiData}" | jq -r ".weather.[0].icon")
curl -s "https://openweathermap.org/payload/api/media/file/${icon}.png" > "$HOME/.cache/waybar/icons/${icon}.png"
echo $apiData > "$HOME/.cache/waybar/weatherData.json"
