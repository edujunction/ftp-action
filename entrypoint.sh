#!/bin/sh -l

# lftp $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e "set ftp:ssl-force $INPUT_FORCESSL; set ssl:verify-certificate false; mirror --reverse --continue --dereference --verbose=3 -P -x ^\.git/$ $INPUT_LOCALDIR $INPUT_REMOTEDIR; quit"

# switch directory instead of using ncftp "local_dir" parameter
# this way, the local_dir is not created too.
cd "$INPUT_LOCALDIR" || exit 2;
ncftpput -R -z -m -u "$INPUT_USER" -p "$INPUT_PASSWORD" "$INPUT_HOST" "$INPUT_REMOTEDIR" "."
