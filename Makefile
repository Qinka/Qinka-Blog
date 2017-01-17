#
# Makefile
#
############################################################
##
##	Glob Updating
##
##	Created by glob-update
##	Copyright (C) 2016
##
############################################################
#

# CURL #
## Path of CURL
CURL_PATH=curl
## show details or not
CURL_DETAIL= ' -i ' 

# SHELL #
## The shell we used
SHELL=bash
## The echo or some things like that
ECHO=echo

# SITE #
## URL of site
SITE_URL=https://pre.blog.qinka.pw
## Password
PSK=921924
## The path of glob-ih
IH_PATH=glob-ih
## The delay between server and glob-ih
IH_DELAY=-70
## Get the time of now via glob-ih
IH_NOW=glob-timecheck
## Check the delay
TIMECHECK_PATH=glob-timecheck

# time check #
check-delay:
	@$(ECHO)
	@$(ECHO) check time
	@$(ECHO) $(CURL_PATH) ' -X GET ' $(SITE_URL)/@/~servertime | $(SHELL) | $(TIMECHECK_PATH)
	@$(ECHO)


# clean #
clean-tmp:
	@$(ECHO) Clean .ignore/tmp.*
	@rm -f .ignore/tmp.*
	@$(ECHO) DONE


overloadedlabels: post/haskell/overloadedlabels.md post/haskell/overloadedlabels.sum.md
	@pandoc -o .ignore/overloadedlabels.html post/haskell/overloadedlabels.md
	@pandoc -o .ignore/overloadedlabels.sum.html post/haskell/overloadedlabels.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2017-01-01 05:26:03.55291 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "summary=@.ignore/overloadedlabels.sum.html" ' \ 
		' -F "html=post/haskell/overloadedlabels.md" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=highlight" ' \
		' -F "tag=blog" ' \
		' -F "tag=haskell" ' \
		' -F "tag=haskell language extensions" ' \
		$(SITE_URL)/b/haskell/extension/overloadedlabels ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
overloadedlabels.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X DELETE -F "type=post" ' \
		$(SITE_URL)/b/haskell/extension/overloadedlabels ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

