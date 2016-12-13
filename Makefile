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
SITE_URL=https://blog.qinka.pw

## Password of Admin
PSK=`cat .ignore/psk` # This just an example
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

# change site theme #
change-site-theme:
#	Get old one
	OLD_THEME=$($(CURL_PATH) -X GET $(SITE_URL)/@/~site-theme)
	@if [ "$OLD_THEME" = "{\"error\":\"not found\"}" ]; then OLD_THEME="";fi;
	@$(ECHO) The old theme is $(OLD_THEME)
	@$(ECHO) The new theme is $(SITE_THEME)
	@if [ "$(OLD_THEME)" = "$(SITE_THEME)" ]; then $(ECHO) The new one is eq2 old one. DO NOTHING;\
		else $(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT  -F "var='$(SITE_THEME) '" -F "type=query" -F "create-time=2016-01-01 00:00:00 UTC" -F "update-time='$(IH_NOW)'" -F "title=query" ' \
		$(SITE_URL)/@/~site-theme ' '  | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL) ; fi

# change code style #
change-code-style:
#	Get old one
	OLD_STYLE=$($(CURL_PATH) -X POST -H "HOW:get" $(SITE_URL)/q/code-style
	@$(EHCO) The old style is $(OLD_STYLE)
	@$(ECHO0 The new style is $(CODE_STYLE)
	@if [ "$(OLD_STYLE)" = "$(CODE_STYLE)" ]; then
		@$(ECHO) The new one is eq2 old one. DO NOTHING
	else
		@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X POST -H "HOW:getput" -F"var='$(CODE_STYPE)'" ' $(SITE_URL)/q/code-style | $(SHELL)
	fi


# navs #

navs:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X DELETE ' \
		$(SITE_URL)/@/@nav ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "label=HOME" ' \
		' -F "url=/" -F "order=1" ' \
		$(SITE_URL)/@/@nav ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "label=BLOG" ' \
		' -F "url=/blog" -F "order=2" ' \
		$(SITE_URL)/@/@nav ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "label=LIVE" ' \
		' -F "url=/live" -F "order=3" ' \
		$(SITE_URL)/@/@nav ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)


# Add others here #

/index.html: index.md
	@pandoc -o .ignore/tmp.a55822426a5330c04625a41d264c190b.html index.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-09-18 08:22:22.598657 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Home" ' \
		' -F "html=@.ignore/tmp.a55822426a5330c04625a41d264c190b.html" ' \
		$(SITE_URL)/ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/~@123nav: frame-nav.html
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=frame" ' \
		' -F "create-time=2016-09-18 08:22:26.717836 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "html=@frame-nav.html" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/~@123bottom: frame-bottom.html
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=frame" ' \
		' -F "create-time=2016-09-18 08:22:38.971246 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "html=@frame-bottom.html" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/~@123top: frame-top.html
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=frame" ' \
		' -F "create-time=2016-09-18 08:24:23.590348 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "html=@frame-top.html" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)



/script/frame.js: scrpit/frame.js
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=text" ' \
		' -F "create-time=2016-09-18 13:13:08.704687 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "text=@scrpit/frame.js" ' \
		' -F "mime=application/x-javascript" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/script/qzone.share: scrpit/qzone.share.js
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=text" ' \
		' -F "create-time=2016-09-18 13:13:22.813836 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "text=@scrpit/qzone.share.js" ' \
		' -F "mime=application/x-javascript" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/img/fork.me.png: fork.me.png
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=binary" ' \
		' -F "create-time=2016-09-19 15:02:19.277747 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "binary=@fork.me.png" ' \
		' -F "mime=image/x-png" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/theme/default: style-sheet/default.css
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=text" ' \
		' -F "create-time=2016-09-20 03:39:30.036851 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "text=@style-sheet/default.css" ' \
		' -F "mime=text/css" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/theme/usual: style-sheet/usual.css
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=text" ' \
		' -F "create-time=2016-09-20 10:59:48.160734 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "text=@style-sheet/usual.css" ' \
		' -F "mime=text/css" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/blog: blog.html
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-09-21 03:18:32.691317 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Blog" ' \
		' -F "html=@blog.html" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/script/blog: scrpit/blog.js
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=text" ' \
		' -F "create-time=2016-09-21 03:21:32.105387 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=null" ' \
		' -F "text=@scrpit/blog.js" ' \
		' -F "mime=application/x-javascript" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/live: live.md
	@pandoc -o .ignore/tmp.2de393058ba40f4c50d359c2975a1222.html live.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-09-21 13:46:48.78231 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=直播写代码" ' \
		' -F "html=@.ignore/tmp.2de393058ba40f4c50d359c2975a1222.html" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)


/b/Uncharted-IV: post/Uncharted-IV.md
	@pandoc -o .ignore/tmp.7f9e0a9c3e4ae4e19164ff11283e2f30.html post/Uncharted-IV.md
	@pandoc -o .ignore/tmp.7f9e0a9c3e4ae4e19164ff11283e2f30.summary.html post/Uncharted-IV.summary.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-10-14 13:12:16.879061 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Uncharted-IV" ' \
		' -F "summary=@.ignore/tmp.7f9e0a9c3e4ae4e19164ff11283e2f30.summary.html" ' \
		' -F "html=@.ignore/tmp.7f9e0a9c3e4ae4e19164ff11283e2f30.html" ' \
		' -F "tag=game" ' \
		' -F "tag=blog" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
