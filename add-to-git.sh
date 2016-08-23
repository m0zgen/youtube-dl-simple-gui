#!/bin/bash
# Upload this lib to git
# Created by Yevgeniy Goncharov, http://sys-adm.in

if [[ -z youtube-dl-simple-gui ]]; then
  echo "Please add commit comment!"
else
  git add .
  git commit -m "youtube-dl-simple-gui"
  git push origin master
fi
