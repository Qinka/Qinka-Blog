#
# Makefile
#
#############################################################################
## 
##                Qinka's Blog
##                
##                The Makefile of my own blog's
##                For blog.prerls.qinka.pw in post-os-dev branch
##
##    Copyright (C) 2016
##
#############################################################################
#
#
#

# CURL #
CURL_PATH=curl
CURL_DETAIL=' -i '

SHELL=bash
ECHO=echo

SITE_URL=https://blog.prerls.qinka.pw
PSK=921 924
IH_PATH=glob-ih
IH_DELAY=0
IH_NOW=$$($(IH_PATH) -t)
TIMECHECK_PATH=glob-timecheck

# CLEAN #
clean:
	@rm -rf .ignore
	@mkdir .ignore
	@$(ECHO) DONE

# TIME CHECK #
check-delay:
	@$(ECHO) $(CURL_PATH) ' -X GET ' $(SITE_URL)/@/~servertime | $(SHELL) | $(TIMECHECK_PATH)
	



/b/os-learning/build-4.8.4: post/os-learning/build-kernel-4.8.4.md post/os-learning/build-kernel-4.8.4.summary.md
	@pandoc -o .ignore/tmp.08f10a7aedc4b573892a2223576e84f0 *-.html post/os-learning/build-kernel-4.8.4.md
	@pandoc -o .ignore/tmp.08f10a7aedc4b573892a2223576e84f0 *-.sum.html post/os-learning/build-kernel-4.8.4.summary.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "type=post" ' \
		' -F "create-time=2016-10-31 09:38:10.2874145 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Linux 4.8.4 内核编译并安装到 Ubuntu 16.04 上" ' \
		' -F "summary"=@.ignore/tmp.08f10a7aedc4b573892a2223576e84f0 *-.sum.html" ' \
		' -F "html=@.ignore/tmp.08f10a7aedc4b573892a2223576e84f0 *-.html" ' \
		' -F "tag=blog" ' \
		' -F "tag=os" ' \
		' -F "tag=operating system" ' \
		' -F "tag=os-learning" ' \
		' -F "tag=operating system learning" ' \
		' -F "tag=linux" ' \
		' -F "tag=linux kernel" ' \
		' -F "tag=linux kernel 4.8.4" ' \
		' -F "tag=kernel compile" ' \
		' -F "tag=ubuntu" ' \
		' -F "tag=ubuntu 16.04" ' \
		$(SITE_URL)$@ ' ' | $(IH_PATH) -m -f$(IH_DELAY) -v $(PSK) | $(SHELL)
