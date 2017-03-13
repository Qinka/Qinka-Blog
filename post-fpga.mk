get.start.fpga.post: post/fpga/get-started.md  post/fpga/get-started.sum.md
	@pandoc -o .ignore/get-started.html post/fpga/get-started.md
	@pandoc -o .ignore/get-started.sum.html post/fpga/get-started.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-03-06 15:09:27.0651784 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Getting Started with Nexys3" ' \
		' -F "html=@.ignore/get-started.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/get-started.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=blog" ' \
		' -F "tag=code" ' \
		' -F "tag=highlight" ' \
		 $(SITE_URL)/b/fpga/get-start  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

get.start.fpga.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/fpga/get-start  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


