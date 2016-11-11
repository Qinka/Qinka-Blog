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

# SITE STYLE #
## THEME of site # (via css)
SITE_THEME=default
## Code style  # (via css)
SITE_CODE_STYLE=zenburn



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


/b/haskell/extension/overloadedlabels: post/haskell/overloadedlabels.md post/haskell/overloadedlabels.sum.md
	@pandoc -o .ignore/tmp.e4aada246d01c82b17d89abe708830ad.html post/haskell/overloadedlabels.md
	@pandoc -o .ignore/tmp.e4aada246d01c82b17d89abe708830ad.sum.html post/haskell/overloadedlabels.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-11-11 15:12:59.5164345 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Haskell OverloadedLables Extension" ' \
		' -F "summary=@.ignore/tmp.e4aada246d01c82b17d89abe708830ad.sum.html" ' \
		' -F "html=@.ignore/tmp.e4aada246d01c82b17d89abe708830ad.html" ' \
		' -F "tag=highlight" ' \
		' -F "tag=blog" ' \
		' -F "tag=haskell" ' \
		' -F "tag=haskell language extensions" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
