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
		 $(SITE_URL)/b/romanticism/barriers  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


