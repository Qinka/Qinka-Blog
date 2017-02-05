overloadedlabels: post/haskell/overloadedlabels.md  post/haskell/overloadedlabels.sum.md
	@pandoc -o .ignore/overloadedlabels.html post/haskell/overloadedlabels.md
	@pandoc -o .ignore/overloadedlabels.sum.html post/haskell/overloadedlabels.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-01-01 05:26:03.55291 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=OverloadedLables" ' \
		' -F "html=@.ignore/overloadedlabels.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/overloadedlabels.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=highlight" ' \
		' -F "tag=blog" ' \
		' -F "tag=haskell" ' \
		' -F "tag=haskell language extensions" ' \
		 $(SITE_URL)/b/haskell/extension/overloadedlabels  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

overloadedlabels.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/haskell/extension/overloadedlabels  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


