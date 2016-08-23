#!/bin/bash
# Simple terminal script for youtube-dl usage
# Created by Yevgeniy Goncharov, http://sys-adm.in
#

read -p "Paste YouTube video link URL: " url

if [[ -z $url ]]; then
  echo "Please paste YouTube link!"
  exit
fi

youtube-dl -F $url

read -p "Select video quality: " quality

until youtube-dl -cit -f $quality $url; do sleep 5; done

# youtube-dl -cit -f $quality -o "/path/to/folder/%(title)s.%(ext)s" $url
