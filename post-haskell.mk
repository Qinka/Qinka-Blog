debug.in.ghci.1.post: post/haskell/debug.in.ghci.1.md  post/haskell/debug.in.ghci.1.sum.md
	@pandoc -o .ignore/debug.in.ghci.1.html post/haskell/debug.in.ghci.1.md
	@pandoc -o .ignore/debug.in.ghci.1.sum.html post/haskell/debug.in.ghci.1.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-27 13:23:25.343155 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Debug with GHCi 1" ' \
		' -F "html=@.ignore/debug.in.ghci.1.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/debug.in.ghci.1.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=blog" ' \
		' -F "tag=highlight" ' \
		' -F "tag=code" ' \
		' -F "tag=haskell" ' \
		 $(SITE_URL)/b/haskell/debug-with-ghci/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

debug.in.ghci.1.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/haskell/debug-with-ghci/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


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


