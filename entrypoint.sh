#!/bin/sh -l

# lftp $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e "set ftp:ssl-force $INPUT_FORCESSL; set ssl:verify-certificate false; mirror --reverse --continue --dereference --verbose=3 -P -x ^\.git/$ $INPUT_LOCALDIR $INPUT_REMOTEDIR; quit"

lftp -e "
  set net:timeout 5;
  set net:max-retries 3;
  set net:reconnect-interval-multiplier 1;
  set net:reconnect-interval-base 5;
  set ftp:ssl-force $INPUT_FORCESSL; 
  set sftp:auto-confirm yes;
  set ssl:verify-certificate $INPUT_FORCESSL; 
  open $INPUT_HOST
  user $INPUT_USER $INPUT_PASSWORD
  mirror -v -P 5 -R $INPUT_LOCALDIR $INPUT_REMOTEDIR;
  quit
"
