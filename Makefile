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
CURL_PATH=curl
## whether curl show the details
CURL_DETAIL=' -i ' # space is needed

# SHELL #
## The shell we used
SHELL=bash
## The echo or some thing like that
ECHO=echo

# SITE #
## URL of site
SITE_URL=https://blog.prerls.qinka.pw

## Password of Admin
PSK=921 924 # This just an example
## The path of glob-ih
IH_PATH=glob-ih
## THe time delay between server and glob-ih
IH_DELAY=0 # For normal, you need run `make check-delay URL=***`, and then set this one.
## Get the time of now with glob-ih
IH_NOW=$$($(IH_PATH) -t)
## Check time delay
TIMECHECK_PATH=glob-timecheck
## put a new post
NEWPOST_PATH=$(which glob-newpost)


##########

# all #
all:
	@$(ECHO) -e The updater of Qinka\'s Blog


# clean #
clean-tmp:
	@$(ECHO) Clean ./ignore/tmp.*
	@rm -f .ignore/tmp.*
	@$(ECHO) DONE

# time check #
check-delay:
	@$(ECHO)
	@$(ECHO) check time
	@$(ECHO) $(CURL_PATH) ' -X GET ' $(SITE_URL)/@/~servertime | $(SHELL) | $(TIMECHECK_PATH)
	@$(ECHO)


/b/Uncharted-IV: post/gaming/Uncharted-IV.md
	@pandoc -o .ignore/tmp.7f9e0a9c3e4ae4e19164ff11283e2f30.html post/gaming/Uncharted-IV.md
	@pandoc -o .ignore/tmp.7f9e0a9c3e4ae4e19164ff11283e2f30.summary.html post/gaming/Uncharted-IV.summary.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-10-14 13:12:16.879061 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Uncharted-IV" ' \
		' -F "summary=@.ignore/tmp.7f9e0a9c3e4ae4e19164ff11283e2f30.summary.html" ' \
		' -F "html=@.ignore/tmp.7f9e0a9c3e4ae4e19164ff11283e2f30.html" ' \
		' -F "tag=game" ' \
		' -F "tag=blog" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
