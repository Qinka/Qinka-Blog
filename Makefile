# site url
export SITE_URL
export SITE_HASH
# curl settings
# detail: show details or not
export CURL_DETAIL
CURL_PATH = curl
# update time
NOW_TIME = $(shell date -u "+%Y-%m-%d %H:%M:%S UTC")
# token for site
SITE_TOKEN=$(shell yu ih -t $(SITE_TOKEN_PASS) -h $(SITE_HASH))

# include
include post-embedded.mk