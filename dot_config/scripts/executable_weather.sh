#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#
#USAGE: weather.sh <locationcode>
#
#(c) Michael Seiler 2007

METRIC=0 #Should be 0 or 1; 0 for F, 1 for C

if [ -z $1 ]; then
    echo
    echo "USAGE: weather.sh <locationcode>"
    echo
    exit 0;
fi

#curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'

out=`curl --connect-timeout 30 -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'if (/Currently/) 
{chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'`

#echo $out

cond=`echo $out | cut -d':' -f 1`
temp=`echo $out | cut -d':' -f 2`

case "$cond" in

'Fog')
    echo -e "Foggy\c"
;;
'Snow')
    echo -e "Snowy\c"
;;
'Cloudy')
    echo -e "Cloudy\c"
;;
'Sunny')
   echo -e "Sunny\c"
;;
'T-Storms')
   echo -e "Stormy\c"
;;
*)
   echo -e  $cond'\c'
esac

echo " " $temp
