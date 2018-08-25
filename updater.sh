#!/bin/bash


version=1.4


url='https://docs.google.com/spreadsheets/d/e/2PACX-1vQgHK50Zy0GzQ8R67DlD9oEWA_XHNuoqbJeWfxf48gI61UobiNxCcQUQGBB1zuS2KGpBtlx67vf7k_2/pub?gid=0&single=true&output=csv'
content=`curl -s $url`
newVersion=`echo $content | tr ',' '\n' | sed -n '1 p'`
DownloadShare=`echo $content | tr ',' '\n' | sed -n '2 p'`
id=`echo $DownloadShare | tr '/' '\n' | tail -n 2 | sed -n '1 p'`
DownloadLink="https://drive.google.com/uc?id=$id&export=download"
echo "newVersion : $newVersion"
echo "DownloadShare : $DownloadShare"
echo "id : $id"
echo "DownloadLink : $DownloadLink"

#read -p "Press enter to continue"

if [[ `echo $version'<'$newVersion | bc -l` == 1 ]]; then
    echo "We found a new version : $newVersion"
    echo "Downloading file ..."
    wget -o /dev/null -O ~/file.txt $DownloadLink
else
    echo "You are up to date"
fi











