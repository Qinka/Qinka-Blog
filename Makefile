# site url
SITE_URL = localhost:3000
# curl settings
# detail: show details or not
CURL_DETAIL = 
CURL_PATH = curl
# update time
NOW_TIME = $(shell date -u "+%Y-%m-%d %H:%M:%S UTC")
# token for site
SITE_TOKEN = `cat /dev/null`

include post-ucosii.mk
