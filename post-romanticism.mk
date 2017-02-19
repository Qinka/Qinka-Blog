barriers.post: post/romanticism/barriers.tex 
	@pandoc -o .ignore/barriers.html post/romanticism/barriers.tex
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-03 13:13:25.132789 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Barriers" ' \
		' -F "html=@.ignore/barriers.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=blog" ' \
		 $(SITE_URL)/b/romanticism/barriers  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

barriers.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/romanticism/barriers  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


readme.post: post/romanticism/README.tex  post/romanticism/README.sum.md
	@pandoc -o .ignore/README.html post/romanticism/README.tex
	@pandoc -o .ignore/README.sum.html post/romanticism/README.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-19 03:13:25.361674 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=ReadMe" ' \
		' -F "html=@.ignore/README.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/README.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=blog" ' \
		' -F "tag=open source" ' \
		' -F "tag=romanticism" ' \
		 $(SITE_URL)/b/romanticism/readme  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

readme.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/romanticism/readme  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


