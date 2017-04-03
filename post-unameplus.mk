begin.of.begin.post: post/UnamePlus/begin-of-begin.md  post/UnamePlus/begin-of-begin.sum.md
	@pandoc -o .ignore/begin-of-begin.html post/UnamePlus/begin-of-begin.md
	@pandoc -o .ignore/begin-of-begin.sum.html post/UnamePlus/begin-of-begin.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-03 14:33:14.075133 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Begin of Begin" ' \
		' -F "html=@.ignore/begin-of-begin.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/begin-of-begin.sum.html" ' \
		' -F "tag=blog" ' \
		 $(SITE_URL)/b/uname/begin-of-begin  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

begin.of.begin.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/uname/begin-of-begin  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


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


intermediate.code.parser.post: post/UnamePlus/intermediate-code-parser.md  post/UnamePlus/intermediate-code-parser.sum.md
	@pandoc -o .ignore/intermediate-code-parser.html post/UnamePlus/intermediate-code-parser.md
	@pandoc -o .ignore/intermediate-code-parser.sum.html post/UnamePlus/intermediate-code-parser.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-03 14:32:21.549032 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Intermediate Code Parser" ' \
		' -F "html=@.ignore/intermediate-code-parser.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/intermediate-code-parser.sum.html" ' \
		' -F "tag=blog" ' \
		 $(SITE_URL)/b/uname/intermediate-code-parser  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

intermediate.code.parser.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/uname/intermediate-code-parser  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


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


uname.edsl.post: post/UnamePlus/uname-edsl.md  post/UnamePlus/uname-edsl.sum.md
	@pandoc -o .ignore/uname-edsl.html post/UnamePlus/uname-edsl.md
	@pandoc -o .ignore/uname-edsl.sum.html post/UnamePlus/uname-edsl.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-07 12:32:59.963646 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=An EDSL for Uname" ' \
		' -F "html=@.ignore/uname-edsl.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/uname-edsl.sum.html" ' \
		' -F "whose=post/UnamePlus/uname-edsl.md" ' \
		' -F "tag=blog" ' \
		' -F "tag=code" ' \
		 $(SITE_URL)/b/uname/edsl  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

uname.edsl.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/uname/edsl  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


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


