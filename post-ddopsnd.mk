getstart.1.ddopsnd.post: post/ddopsnd/get-start.1.md  post/ddopsnd/get-start.1.sum.md
	@pandoc -o .ignore/get-start.1.html post/ddopsnd/get-start.1.md
	@pandoc -o .ignore/get-start.1.sum.html post/ddopsnd/get-start.1.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-18 12:50:04.974444 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Ddopsnd: Get Start 1" ' \
		' -F "html=@.ignore/get-start.1.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/get-start.1.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=blog" ' \
		' -F "tag=code" ' \
		' -F "tag=highlight" ' \
		 $(SITE_URL)/b/ddopsnd/getstart/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

getstart.1.ddopsnd.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/ddopsnd/getstart/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


