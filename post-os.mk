build.linux.kernel.4.8.4.os-l.post: post/os-learning/build-kernel-4.8.4.md  post/os-learning/build-kernel-4.8.4.sum.md
	@pandoc -o .ignore/build-kernel-4.8.4.html post/os-learning/build-kernel-4.8.4.md
	@pandoc -o .ignore/build-kernel-4.8.4.sum.html post/os-learning/build-kernel-4.8.4.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-03 12:46:02.065918 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Linux-4.8.4 内核编译并安装至 Ubuntu 16.04" ' \
		' -F "html=@.ignore/build-kernel-4.8.4.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/build-kernel-4.8.4.sum.html" ' \
		' -F "tag=blog" ' \
		' -F "tag=linux" ' \
		' -F "tag=linux kernel" ' \
		' -F "tag=linux kernel 4.8.4" ' \
		' -F "tag=kernel compile" ' \
		' -F "tag=ubuntu" ' \
		' -F "tag=ubuntu 16.04" ' \
		' -F "tag=highlight" ' \
		 $(SITE_URL)/b/os-learning/build-4.8.4  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

build.linux.kernel.4.8.4.os-l.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		 $(SITE_URL)/b/os-learning/build-4.8.4  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


