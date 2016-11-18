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
CURL_DETAIL= ' -i -k '

# SHELL #
## The shell we used
SHELL=bash
## The echo or some things like that
$ECHO=echo

# SITE #
## URL of site
SITE_URL=https://blog.prerls.qinka.pw
## Password
PSK=921 924
## The path of glob-ih
IH_PATH=glob-ih
## The delay between server and glob-ih
IH_DELAY-90
## Get the time of now via glob-ih
IH_NOW=$$($(IH_PATH) -t)
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


embedded-system-learning-cross-compile-tools-build: post/embedded-system-learning/cross-compile-tools-build.md post/embedded-system-learning/cross-compile-tools-build.sum.md
	@pandoc -o .ignore/embedded-system-learning-cross-compile-tools-build.html post/embedded-system-learning/cross-compile-tools-build.md
	@pandoc -o .ignore/embedded-system-learning-cross-compile-tools-build.sum.html post/embedded-system-learning/cross-compile-tools-build.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-11-17 14:02:08.133082 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "summary=@.ignore/embedded-system-learning-cross-compile-tools-build.sum.html" ' \ 
		' -F "html=post/embedded-system-learning/cross-compile-tools-build.md" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=blog" ' \
		' -F "tag=highlight" ' \
		' -F "tag=embedded-system" ' \
		' -F "tag=learning" ' \
		' -F "tag=codes" ' \
		' -F "tag=macOS" ' \
		' -F "tag=arm-linux" ' \
		' -F "tag=cross-compiler" ' \
		$(SITE_URL)/b/embedded-sys/learning/cross-tools-build ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
embedded-system-learning-cross-compile-tools-build.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X DELETE -F "type=post" ' \
		$(SITE_URL)/b/embedded-sys/learning/cross-tools-build ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

