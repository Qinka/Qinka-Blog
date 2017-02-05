intermediate.code.post: post/UnamePlus/intermediate-code.md  post/UnamePlus/intermediate-code.sum.md
	@pandoc -o .ignore/intermediate-code.html post/UnamePlus/intermediate-code.md
	@pandoc -o .ignore/intermediate-code.sum.html post/UnamePlus/intermediate-code.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-03 14:32:43.43728 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Intermediate Code" ' \
		' -F "html=@.ignore/intermediate-code.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/intermediate-code.sum.html" ' \
		' -F "tag=blog" ' \
		' -F "tag=highlight" ' \
		 $(SITE_URL)/b/uname/intermediate-code  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

intermediate.code.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/uname/intermediate-code  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


with.haskell.gi.1.post: post/UnamePlus/with-haskell-gi-1.md  post/UnamePlus/with-haskell-gi-1.sum.md
	@pandoc -o .ignore/with-haskell-gi-1.html post/UnamePlus/with-haskell-gi-1.md
	@pandoc -o .ignore/with-haskell-gi-1.sum.html post/UnamePlus/with-haskell-gi-1.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-03 14:31:53.958122 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=With Haskell-GI 1" ' \
		' -F "html=@.ignore/with-haskell-gi-1.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/with-haskell-gi-1.sum.html" ' \
		' -F "tag=blog" ' \
		' -F "tag=highlight" ' \
		 $(SITE_URL)/b/uname/with-haskell-gi/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

with.haskell.gi.1.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/uname/with-haskell-gi/1  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


gtk.hw.1.img: post/UnamePlus/img/gtk-hello-world-1.png 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-02-03 14:36:30.06291 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Gtk Hello World Figure-1" ' \
		' -F "binary=@post/UnamePlus/img/gtk-hello-world-1.png" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=img" ' \
		 $(SITE_URL)/img/gtk-hello-world-1.png  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

gtk.hw.1.img.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/gtk-hello-world-1.png  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


gtk.hw.2.img: post/UnamePlus/img/gtk-hello-world-2.png 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-02-03 14:36:52.56604 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Gtk Hello World Figure-2" ' \
		' -F "binary=@post/UnamePlus/img/gtk-hello-world-2.png" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=img" ' \
		 $(SITE_URL)/img/gtk-hello-world-2.png  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

gtk.hw.2.img.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/gtk-hello-world-2.png  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


