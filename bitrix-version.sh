#!/bin/bash
if [ -n "$1" ]; then
echo "Possible versions:"
curl -LI +short $1.'/bitrix/js/ui/vue/vue2/dev/src/bitrixvue.js' 2> /dev/null | rg 200 > /dev/null && echo ">= 2021" && exit;
curl -LI +short $1.'/bitrix/js/main/parambag/bundle.config.js' 2> /dev/null | rg 200 > /dev/null && echo 2020 && exit;
curl -LI +short $1.'/bitrix/js/main/md5/bundle.config.js' 2> /dev/null | rg 200 > /dev/null && echo 2019 && exit;
curl -LI +short $1.'/bitrix/js/main/gridtile/gridtile.min.js' 2> /dev/null | rg 200 > /dev/null && echo 2018 && exit;
curl -LI +short $1.'/bitrix/js/main/recorder/encoder.js' 2> /dev/null | rg 200 > /dev/null && echo 2017 && exit;
curl -LI +short $1.'/bitrix/js/main/pin/pin.js' 2> /dev/null | rg 200 > /dev/null && echo 2016 && exit;
curl -LI +short $1.'/bitrix/js/main/usertype.js' 2> /dev/null | rg 200 > /dev/null && echo 2015 && exit;
curl -LI +short $1.'/bitrix/js/main/core/core_webrtc.js' 2> /dev/null | rg 200 > /dev/null && echo 2014 && exit;
curl -LI +short $1.'/bitrix/js/main/core/core_admin_interface.js' 2> /dev/null | rg 200 > /dev/null && echo 2013 && exit;
curl -LI +short $1.'/bitrix/js/main/jquery/jquery-1.7.js' 2> /dev/null | rg 200 > /dev/null && echo 2012 && exit;
curl -LI +short $1.'/bitrix/js/main/rating_like.js' 2> /dev/null | rg 200 > /dev/null && echo 2011 && exit;
curl -LI +short $1.'/bitrix/js/main/utils.js' 2> /dev/null | rg 200 > /dev/null && echo 2010 && exit;
else
        echo "No URL supplied!"
        echo "Usage: bitrix-version.sh https://target.com"
fi
