#!/bin/bash

## To update all kinds of file
## Three args are needed.
## 1. main file or var
## 2. summury file
## 3. infofiles

if [ $# != 3 ]; then
	echo More or less params are needed.
	exit 1
fi

# infofile
INFO_PATH=$3
# read from infofile #
# get update type
MAIN_FILE=$1
UPDATE_TYPE=$(cat $INFO_PATH | jq .type -r)
SUM_TEXT=$(cat $INFO_PATH | jq .summary -r)
echo
if [ "$SUM_TEXT" = "null" ]; then
	SUM_TYPE=file
	SUM_FILE=$2
else
	SUM_TYPE=text
fi

UPDATE_PATH=$(cat $INFO_PATH | jq .path -r)
if [ "$SUM_FILE" = "/dev/null" ]; then
    echo -e $UPDATE_PATH: $MAIN_FILE
else
    echo -e $UPDATE_PATH: $MAIN_FILE $SUM_FILE
fi
TMP_FILE_NAME=$(echo $UPDATE_PATH | md5 | awk '{print $1}' )

if ( [ "$UPDATE_TYPE" = "post" ] || [ "$UPDATE_TYPE" = "frame" ] ) && [ "${MAIN_FILE/*./}" != "html" ]; then
    READ_FILE=.ignore/tmp.$TMP_FILE_NAME.html
    echo -e "\t"@pandoc -o $READ_FILE $MAIN_FILE
else
    READ_FILE=$MAIN_FILE
fi

if [ "$SUM_FILE" != "/dev/null" ] && [ "$SUM_TYPE" != "text" ] && [ "${SUM_FILE##*.}" != "html"  ] ; then
    READ_SUM_FILE=.ignore/tmp.$TMP_FILE_NAME.sum.html
    echo -e "\t"@pandoc -o $READ_SUM_FILE  $SUM_FILE
else
    READ_SUM_FILE=$SUM_FILE
fi
echo -e "\t"@\$\(ECHO\) \$\(CURL_PATH\) \$\(CURL_DETAIL\) \' -X PUT -F \"type\=$UPDATE_TYPE\" \' \\
echo -e "\t\t"\' -F \"create-time\=$(glob-ih -t)\" \' \\
echo -e "\t\t"\' -F \"update-time\=\$\(IH_NOW\)\" \' \\
TITLE=$(cat $INFO_PATH | jq .title -r)
echo -e "\t\t"\' -F \"title\=$TITLE\" \' \\
if [ "$SUM_TYPE" = "text" ]; then
	echo -e "\t\t"\' -F \"summar=$SUM_TEXT\" \' \\
elif [ "$SUM_FILE" != "/dev/null" ]; then
	echo -e "\t\t"\' -F \"summary=@$READ_SUM_FILE\" \' \\
fi

if [ "$UPDATE_TYPE" = "post" ] || [ "$UPDATE_TYPE" = "frame" ]; then
    echo -e "\t\t"\' -F \"html\=@$READ_FILE\" \' \\
elif [ "$UPDATE_TYPE" = "text" ]; then
    echo -e "\t\t"\' -F \"text\=@$MAIN_FILE\" \' \\
elif [ "$UPDATE_TYPE" = "binary" ];then
    echo -e "\t\t"\' -F \"binary\=@$MAIN_FILE\" \' \\
elif [ "$UPDATE_TYPE" = "static" ]; then
    echo -e "\t\t"\' -F \"url\=$MAIN_FILE\" \' \\
fi
    
WHOSE=$(cat $INFO_PATH | jq .whose -r)
if [ "$WHOSE" != "null" ]; then
	echo -e "\t\t"\' -F \"whose\=$WHOSE\" \' \\
fi
MIME=$(cat $INFO_PATH | jq .mime -r)
if [ "$MIME" != "null" ]; then
	echo -e "\t\t"\' -F \"mime\=$MIME\" \' \\
fi
item=0
while true
do
	THIS=$(cat $INFO_PATH | jq -c ".tags[$item]" -r)
	if [ "$THIS" = "null" ]; then
		break;
	else
		echo -e "\t\t"\' -F \"tag\=$THIS\" \' \\
	fi
	item=$item+1
done

echo -e "\t\t"\$\(SITE_URL\)\$@ \' \' \| \$\(IH_PATH\) -m -f\$\(IH_DELAY\) -v \$\(PSK\) \| \$\(SHELL\)

