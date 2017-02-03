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
SITE_URL=localhost:3001
## Private key file
PRIVATE_KEY=../.ssh/tmp
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
## MD5 cmd
MD5=md5 -q 
# TIME CHECK #
check-delay:
	@$(ECHO) 
	@$(ECHO) check time
	@$(ECHO) $(CURL_PATH) -X GET  $(SITE_URL)/@/~servertime  | $(SHELL) | $(TIMECHECK_PATH)@$(ECHO) 

# clean #
clean-tmp:
	@$(ECHO) Clean .ignore/tmp.*
	@rm -rf .ignore/tmp.*
	@$(ECHO) DONE

# Change Site Theme #
change-site-theme:
	OLD_THEME=$($(CURL_PATH) -X GET $(SITE_URL)/@/~site-theme)
	@if [ "$OLD_THEME" = "{\"error\":\"not found\"}" ]; then OLD_THEME="";fi;
	@$(ECHO) The old theme is $(OLD_THEME)
	@$(ECHO) The new theme is $(SITE_THEME)
	@if [ "$(OLD_THEME)" = "$(SITE_THEME)" ]; then $(ECHO) The new one is eq2 old one. DO NOTHING; \ 	else $(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "var='$(SITE_THEME) '" -F "type=query" -F "create-time=2017-02-03 07:12:06.284198 UTC" -F "update-time='$(IH_NOW)'" -F "title=query" ' \$(SITE_URL)/@/~site-theme ' '  | $(IH_PATH) -m -f$(IH_DELAY) -p$(PRIVATE_KEY) -d$(SITE_DETAL) -v  | $(SHELL) ; fi



include post-embedded-system-learning.mk
