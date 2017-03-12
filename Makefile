#
# Makefile #
############################################################
## 
##	Glob Updating
## 
##	Created by glob-update
##	Copyright (C) 2016-2017
## 
############################################################
#
# cURL #
## Path of cURL
CURL_PATH=curl
## show details(flag, if don't want => spaces)
CURL_DELTAIL=' -i '
# SHELL #
## The shell will be used
SHELL=bash
## The echo or some things like that
ECHO=echo
# SITE #
## URL of site
SITE_URL=qinka-test-core.daoapp.io
## The path of glob-ih
IH_PATH=glob-ih
## The delay between server and glob-ih
IH_DELAY=0
## Get the time of now via glob-ih or date
IH_NOW=$$($(IH_PATH) -t)
## Check the delay
TIMECHECK_PATH=glob-timecheck
## Delta of site's check
SITE_DELTA=6
## Site Theme
SITE_THEME=hack
CODE_THEME=default
# TIME CHECK #
check-delay:
	@$(ECHO) 
	@$(ECHO) check time
	@$(ECHO) $(CURL_PATH) -X GET  $(SITE_URL)/@/~servertime  | $(SHELL) | $(TIMECHECK_PATH)
	@$(ECHO) 

# clean #
clean-tmp:
	@$(ECHO) Clean .ignore/tmp.*
	@rm -rf .ignore/tmp.*
	@$(ECHO) DONE

# Change Site Theme #
change-site-theme:
	OLD=$($(CURL_PATH) -X GET $(SITE_URL)/@/~site-theme)
	@if [ "$(OLD)" = "{\"error\":\"not found\"}" ]; then OLD="";fi;
	@$(ECHO) The old theme is $(OLD_THEME)
	@$(ECHO) The new theme is $(SITE_STYLE)
	@if [ "$(OLD)" = "$(SITE_STYLE)" ]; then $(ECHO) The new one is eq2 old one. DO NOTHING; \
		else $(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  -F \"sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`\" -F \"var=$(SITE_STYLE)\" -F \"type=query\" -F \"create-time=2017-03-12 06:50:38.716417 UTC\" -F \"update-time=$(IH_NOW)\" -F \"title=query\"  \
		$(SITE_URL)/@/~site-theme ' '  | $(IH_PATH) -m -f$(IH_DELAY) -p$(PRIVATE_KEY) -d$(SITE_DELTA) -v  | $(SHELL) ; fi

# Change Site Code Highlight #
change-code-highlight:
	OLD=$($(CURL_PATH) -X GET $(SITE_URL)/@/~highlight)
	@if [ "$(OLD)" = "{\"error\":\"not found\"}" ]; then OLD="";fi;
	@$(ECHO) The old theme is $(OLD_THEME)
	@$(ECHO) The new theme is $(CODE_STYLE)
	@if [ "$(OLD)" = "$(CODE_STYLE)" ]; then $(ECHO) The new one is eq2 old one. DO NOTHING; \
		else $(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  -F \"sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`\" -F \"var=$(CODE_STYLE)\" -F \"type=query\" -F \"create-time=2017-03-12 06:50:38.716417 UTC\" -F \"update-time=$(IH_NOW)\" -F \"title=query\"  \
		$(SITE_URL)/@/~highlight ' '  | $(IH_PATH) -m -f$(IH_DELAY) -p$(PRIVATE_KEY) -d$(SITE_DELTA) -v  | $(SHELL) ; fi


include .platform/platform.mk
include post-draw-figure.mk
