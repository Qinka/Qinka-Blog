uncharted.4.gaming.post: post/gaming/Uncharted-IV.md  post/gaming/Uncharted-IV.sum.md
	@pandoc -o .ignore/Uncharted-IV.html post/gaming/Uncharted-IV.md
	@pandoc -o .ignore/Uncharted-IV.sum.html post/gaming/Uncharted-IV.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2016-10-03 12:15:39.188669 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Uncharted IV" ' \
		' -F "html=@.ignore/Uncharted-IV.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/Uncharted-IV.sum.html" ' \
		' -F "whose=post/gaming/Uncharted-IV.md" ' \
		' -F "tag=game" ' \
		' -F "tag=blog" ' \
		 $(SITE_URL)/b/Uncharted-IV  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

uncharted.4.gaming.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/Uncharted-IV  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


