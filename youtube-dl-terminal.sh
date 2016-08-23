#!/bin/bash
# Simple terminal script for youtube-dl usage
# Created by Yevgeniy Goncharov, http://sys-adm.in

# ---------------------------------------------------------- VARIABLES #

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPTPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

read -p "Paste YouTube video link URL: " url

if [[ -z $url ]]; then
  echo "Please paste YouTube link!"
  exit
fi

youtube-dl -F $url

read -p "Select video quality: " quality

download() {
  until youtube-dl -cit -f $quality $url; do sleep 3; done
}

read -p "You can change download folder. Change (y/n) " answer

if [[ $answer =~ [yY](es)* ]]; then

    read -p "Folder path: " fpach
    if [[ -d $fpach ]]; then
      cd $fpach
      download
      cd - > /dev/null
    else
      echo "Folder does not exist, please try another. Exit."
    fi
  else
    echo "Video save to script folder..."
    download
fi
