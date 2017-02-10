my-delirium.euterpea.music.res: post/euterpea/music/My-delirium-qinka.mp3 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-02-10 14:56:35.553821 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=My Delirium" ' \
		' -F "binary=@post/euterpea/music/My-delirium-qinka.mp3" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=post/euterpea/music/My-delirium-qinka.mp3" ' \
		' -F "tag=music" ' \
		 $(SITE_URL)/res/music/my-delirium-qinka.mp3  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

my-delirium.euterpea.music.res.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/res/music/my-delirium-qinka.mp3  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


my-delirium.euterpea.post: post/euterpea/my-delirium.tex  post/euterpea/my-delirium.sum.md
	@pandoc -o .ignore/my-delirium.html post/euterpea/my-delirium.tex
	@pandoc -o .ignore/my-delirium.sum.html post/euterpea/my-delirium.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-10 14:53:42.254049 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=My Delirium - Euterpea" ' \
		' -F "html=@.ignore/my-delirium.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/my-delirium.sum.html" ' \
		' -F "whose=post/euterpea/my-delirium.tex" ' \
		' -F "tag=blog" ' \
		 $(SITE_URL)/b/euterpea/my-delirium  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

my-delirium.euterpea.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/euterpea/my-delirium  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


