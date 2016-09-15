#
# Makefile
#
######################################################################################
##
##	Qinka's Blog
##
##	The Makefile of Glob of my own blog
## 	blog.qinka.pw  (Powered by Glob)
##
##  Copyright (C) 2016
##
## This file is the one to upload
##
######################################################################################
#

# CURL #
## Path of curl
CURL_PATH=$(which curl)
## whether curl show the details
CURL_DETAIL=' -i ' # space is needed

# SHELL #
## The shell we used
SHELL=bash
## The echo or some thing like that
ECHO=echo

# SITE #
## URL of site
SITE_URL=http://localhost:3000
## Password of Admin
PSK=921 924 # This just an example
## The path of glob-ih
IH_PATH=$(which glob-ih)
## THe time delay between server and glob-ih
IH_DELAY=0 # For normal, you need run `make check-delay URL=***`, and then set this one.
## Get the time of now with glob-ih
IH_NOW=$$($(IH_PAHT) -t -f$(IH_DELAY))
## Check time delay
TIMECHECK_PATH=$(which glob-timecheck)
## put a new post
NEWPOST_PATH=$(which glob-newpost)

# SITE STYLE #
## THEME of site # (via css)
SITE_THEME=default
## Code style  # (via css)
SITE_CODE_STYLE=zenburn



##########

# all #
all:
	echo 让我先想一想要干啥

# time check #
check-time:
	@$(ECHO)
	@$(ECHO) check time
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X POST -H "HOW:get" '\
		 $(SITE_URL)/q/servertime | $(SHELL) | $(TIMECHECK_PATH)
	@$(ECHO)

# change site theme #
change-site-theme:
#	Get old one
	OLD_THEME=$($(CURL_PATH) -X POST -H "HOW:get" $(SITE_URL)/q/site-theme)
	@$(ECHO) The old theme is $(OLD_THEME)
	@$(ECHO) The new theme is $(SITE_THEME)
	if [ "$(OLD_THEME)"="$(SITE_THEME)" ]; then
	    @$(ECHO) The new one is eq2 old one. DO NOTHING
	else

	    @$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X POST -H "HOW:put" -F "var='$(SITE_THEME)'" ' $(SITE_URL)/q/site-theme | $(SHELL)
	fi
