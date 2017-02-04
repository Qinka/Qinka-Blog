blog.post: blog.html 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-02 11:25:57.110292 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Blog" ' \
		' -F "html=@blog.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/blog  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

blog.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		 $(SITE_URL)/blog  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


blog.script: script/blog.js 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=text" ' \
		' -F "create-time=2017-02-02 11:28:40.499681 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=blog.script" ' \
		' -F "text=@script/blog.js" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=script" ' \
		 $(SITE_URL)/script/blog  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

blog.script.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=text" ' \
		 $(SITE_URL)/script/blog  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


bottom.frame: frame-bottom.html 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=frame" ' \
		' -F "create-time=2017-02-02 08:38:03.15666 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=bottom.frame" ' \
		' -F "html=@frame-bottom.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=frame" ' \
		 $(SITE_URL)/~@123bottom  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

bottom.frame.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=frame" ' \
		 $(SITE_URL)/~@123bottom  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


code.style.sheet: style-sheet/code.glob.css 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=text" ' \
		' -F "create-time=2017-02-02 11:38:48.287817 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=code.style.sheet" ' \
		' -F "text=@style-sheet/code.glob.css" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=style-sheet" ' \
		 $(SITE_URL)/highlight/default  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

code.style.sheet.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=text" ' \
		 $(SITE_URL)/highlight/default  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


fork.me.img: fork.me.png 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-02-02 09:54:56.413817 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=fork.me" ' \
		' -F "binary=@fork.me.png" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=frame" ' \
		 $(SITE_URL)/img/fork.me.png  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

fork.me.img.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		 $(SITE_URL)/img/fork.me.png  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


frame.js.text: script/frame.js 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=text" ' \
		' -F "create-time=2017-02-02 11:16:32.596 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=frame.js" ' \
		' -F "text=@script/frame.js" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=script" ' \
		 $(SITE_URL)/script/frame.js  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

frame.js.text.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=text" ' \
		 $(SITE_URL)/script/frame.js  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


glob.icon.binary: glob.ico 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-02-02 07:31:38.849205 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=favicon" ' \
		' -F "binary=@glob.ico" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=icon" ' \
		 $(SITE_URL)/favicon.ico  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

glob.icon.binary.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		 $(SITE_URL)/favicon.ico  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


hack.theme: style-sheet/hack.css 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=text" ' \
		' -F "create-time=2017-02-02 11:21:24.733283 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=theme.hack" ' \
		' -F "text=@style-sheet/hack.css" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=theme" ' \
		 $(SITE_URL)/theme/hack  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

hack.theme.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=text" ' \
		 $(SITE_URL)/theme/hack  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


index.post: index.md 
	@pandoc -o .ignore/index.html index.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-02 05:25:04.181165 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Home" ' \
		' -F "html=@.ignore/index.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

index.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		 $(SITE_URL)/  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


nav.frame: frame-nav.html 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=frame" ' \
		' -F "create-time=2017-02-02 08:41:39.658135 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=nav.frame" ' \
		' -F "html=@frame-nav.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=frame" ' \
		 $(SITE_URL)/~@123nav  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

nav.frame.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=frame" ' \
		 $(SITE_URL)/~@123nav  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


top.frame: frame-top.html 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=frame" ' \
		' -F "create-time=2017-02-02 08:31:04.495661 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=top.frame" ' \
		' -F "html=@frame-top.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "tag=frame" ' \
		 $(SITE_URL)/~@123top  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

top.frame.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=frame" ' \
		 $(SITE_URL)/~@123top  |  $(IH_PATH) -m  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


qrcode.js: script/qrcode.min.js 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=text" ' \
		' -F "create-time=2017-02-04 01:02:19.788994 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=QRCode in js" ' \
		' -F "text=@script/qrcode.min.js" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=script/qrcode.min.js" ' \
		' -F "tag=script" ' \
		 $(SITE_URL)/script/qrcode.js  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

qrcode.js.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=text" ' \
		 $(SITE_URL)/script/qrcode.js  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


