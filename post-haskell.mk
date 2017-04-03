bottleneck.1.post: post/haskell/bottleneck.1.md  post/haskell/bottleneck.1.sum.md
	@pandoc -o .ignore/bottleneck.1.html post/haskell/bottleneck.1.md
	@pandoc -o .ignore/bottleneck.1.sum.html post/haskell/bottleneck.1.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-28 14:54:13.728015 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Bottleneck 1" ' \
		' -F "html=@.ignore/bottleneck.1.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/bottleneck.1.sum.html" ' \
		' -F "whose=QInkqa" ' \
		' -F "tag=blog" ' \
		' -F "tag=highlight" ' \
		' -F "tag=code" ' \
		' -F "tag=haskell" ' \
		 $(SITE_URL)/b/haskell/bottleneck/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

bottleneck.1.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/haskell/bottleneck/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


crash.your.ghc.1.post: post/haskell/crash.your.ghc.1.md  post/haskell/crash.your.ghc.1.sum.md
	@pandoc -o .ignore/crash.your.ghc.1.html post/haskell/crash.your.ghc.1.md
	@pandoc -o .ignore/crash.your.ghc.1.sum.html post/haskell/crash.your.ghc.1.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-03-01 01:00:23.178984 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Crash your GHC 1" ' \
		' -F "html=@.ignore/crash.your.ghc.1.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/crash.your.ghc.1.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=blog" ' \
		' -F "tag=code" ' \
		' -F "tag=highlight" ' \
		 $(SITE_URL)/b/haskell/crash-your-ghc/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

crash.your.ghc.1.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/haskell/crash-your-ghc/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


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


memoization-in-haskell.post: post/haskell/memoization_in_haskell.md  post/haskell/memoization_in_haskell.sum.md
	@pandoc -o .ignore/memoization_in_haskell.html post/haskell/memoization_in_haskell.md
	@pandoc -o .ignore/memoization_in_haskell.sum.html post/haskell/memoization_in_haskell.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-03-23 14:26:10.1791938 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Memoization in Haskell" ' \
		' -F "html=@.ignore/memoization_in_haskell.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/memoization_in_haskell.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=code" ' \
		' -F "tag=highlight" ' \
		' -F "tag=post" ' \
		' -F "tag=blog" ' \
		' -F "tag=haskell" ' \
		 $(SITE_URL)/b/haskell/memoization  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

memoization-in-haskell.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/haskell/memoization  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


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


