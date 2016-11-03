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

/b/unameplus/begin-of-begin: post/UnamePlus/begin-of-begin.md post/UnamePlus/begin-of-begin.sum.md
	@pandoc -o .ignore/tmp.267e28dad3c2b5b5738e4ac25ed7aa1a.html post/UnamePlus/begin-of-begin.md
	@pandoc -o .ignore/tmp.267e28dad3c2b5b5738e4ac25ed7aa1a.sum.html post/UnamePlus/begin-of-begin.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-11-01 14:01:15.433868 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=UnamePlus 计划" ' \
		' -F "summary=@.ignore/tmp.267e28dad3c2b5b5738e4ac25ed7aa1a.sum.html" ' \
		' -F "html=@.ignore/tmp.267e28dad3c2b5b5738e4ac25ed7aa1a.html" ' \
		' -F "tag=blog" ' \
		' -F "tag=compile" ' \
		' -F "tag=uname" ' \
		' -F "tag=unameplus" ' \
		' -F "tag=draw" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/b/unameplus/uname-report/html: post/UnamePlus/uname_report.tex post/UnamePlus/uname_report.sum.md
	@pandoc -o .ignore/tmp.1b338bbf0ba5b3fc6c3a3a87c8ab49db.html --mathml post/UnamePlus/uname_report.tex
	@pandoc -o .ignore/tmp.1b338bbf0ba5b3fc6c3a3a87c8ab49db.sum.html post/UnamePlus/uname_report.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-11-01 15:14:59.238048 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Uname Language Report" ' \
		' -F "summary=@.ignore/tmp.1b338bbf0ba5b3fc6c3a3a87c8ab49db.sum.html" ' \
		' -F "html=@.ignore/tmp.1b338bbf0ba5b3fc6c3a3a87c8ab49db.html" ' \
		' -F "tag=blog" ' \
		' -F "tag=compile" ' \
		' -F "tag=uanme" ' \
		' -F "tag=language report" ' \
		' -F "tag=html" ' \
		' -F "tag=draw" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/img/gtk-hello-world-1.png: post/UnamePlus/img/gtk-hello-world-1.png
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=binary" ' \
		' -F "create-time=2016-11-03 12:47:39.228606 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Gtk Hello world Figure 1" ' \
		' -F "binary=@post/UnamePlus/img/gtk-hello-world-1.png" ' \
		' -F "tag=img" ' \
		' -F "tag=image" ' \
		' -F "tag=gtk" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/img/gtk-hello-world-2.png: post/UnamePlus/img/gtk-hello-world-2.png
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=binary" ' \
		' -F "create-time=2016-11-03 12:48:26.744377 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Gtk Hello world Figure 2" ' \
		' -F "binary=@post/UnamePlus/img/gtk-hello-world-2.png" ' \
		' -F "tag=img" ' \
		' -F "tag=image" ' \
		' -F "tag=gtk" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)

/b/unameplus/with-haskell-gi/1: post/UnamePlus/with-haskell-gi-1.md post/UnamePlus/with-haskell-gi-1.sum.md
	@pandoc -o .ignore/tmp.807ccbc6f1416c7bcaa068a8d9bf8751.html post/UnamePlus/with-haskell-gi-1.md
	@pandoc -o .ignore/tmp.807ccbc6f1416c7bcaa068a8d9bf8751.sum.html post/UnamePlus/with-haskell-gi-1.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-11-03 13:09:13.141761 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Haskell 与 GTK 之一" ' \
		' -F "summary=@.ignore/tmp.807ccbc6f1416c7bcaa068a8d9bf8751.sum.html" ' \
		' -F "html=@.ignore/tmp.807ccbc6f1416c7bcaa068a8d9bf8751.html" ' \
		' -F "tag=blog" ' \
		' -F "tag=gtk" ' \
		' -F "tag=haskell-gi" ' \
		' -F "tag=draw" ' \
		' -F "tag=uname" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
