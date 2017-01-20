#
# Makefile
#
############################################################
##
##	Glob Updating
##
##	Created by glob-update
##	Copyright (C) 2016-2017
##
############################################################
#

# CURL #
## Path of CURL
CURL_PATH=curl
## show details or not
CURL_DETAIL=' -i ' 

# SHELL #
## The shell we used
SHELL=bash
## The echo or some things like that
ECHO=echo

# SITE #
## URL of site
SITE_URL=https://pre.blog.qinka.pw
## Password
PSK=921 924
## The path of glob-ih
IH_PATH=glob-ih
## The delay between server and glob-ih
IH_DELAY=-80
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


py-draw-lib: post/draw-figure/py-draw-lib.tex post/draw-figure/py-draw-lib.sum.tex
	@pandoc -o .ignore/py-draw-lib.html post/draw-figure/py-draw-lib.tex
	@pandoc -o .ignore/py-draw-lib.sum.html post/draw-figure/py-draw-lib.sum.tex
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2017-01-20 00:14:46.091797 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Python Draw Libraries" ' \
		' -F "summary=@.ignore/py-draw-lib.sum.html" ' \
		' -F "html=@.ignore/py-draw-lib.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=code" ' \
		' -F "tag=blog" ' \
		' -F "tag=python" ' \
		' -F "tag=draw" ' \
		' -F "tag=libraries" '\
		$(SITE_URL)/b/py/draw/libraries ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)


py-draw-lib.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X DELETE -F "type=post" ' \
		$(SITE_URL)/b/py/draw/libraries ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

