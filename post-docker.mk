using-gpu-on-docker: post/docker/using-gpu.md  post/docker/using-gpu.sum.md
	@pandoc -o .ignore/using-gpu.html post/docker/using-gpu.md
	@pandoc -o .ignore/using-gpu.sum.html post/docker/using-gpu.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-07-17 01:14:16.459868 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Using GPU on Docker" ' \
		' -F "html=@.ignore/using-gpu.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/using-gpu.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=Docker" ' \
		' -F "tag=GPU" ' \
		' -F "tag=nvidia" ' \
		' -F "tag=blog" ' \
		 $(SITE_URL)/b/docker/using-gpu  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

using-gpu-on-docker.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/docker/using-gpu  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


