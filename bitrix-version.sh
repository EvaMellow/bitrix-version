#!/bin/bash

if [[ -z $1 ]]; then
    echo "No URL given. Usage: ./bitrix-version.sh https://example.org" && exit 1
fi

if curl -LI +short "$1/bitrix/js/ui/vue/vue2/dev/src/bitrixvue.js" 2> /dev/null | grep 200 > /dev/null; then
    echo ">=2021" && exit
fi

files=(
    "parambag/bundle.config" #0
    "md5/bundle.config" #1
    "gridtile/gridtile.min" #2
    "recorder/encoder" #3
    "pin/pin" #4
    "usertype" #5
    "core/core_webrtc" #6
    "core/core_admin_interface" #7
    "jquery/jquery-1.7" #8
    "rating_like" #9
    "utils" #10
)

for i in "${!files[@]}"; do
    if curl -LI +short "$1/bitrix/js/main/${files[$i]}.js" 2> /dev/null | rg 200 > /dev/null; then
        echo "$((2020-$i))" && exit
    fi
done

echo "No version year found"
