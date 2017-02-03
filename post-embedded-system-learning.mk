embedded-system-learning-beaglebone-black-get-start: post/embedded-system-learning/BeagleBone-Black-get-start.md  post/embedded-system-learning/BeagleBone-Black-get-start.sum.md
	@pandoc -o .ignore/BeagleBone-Black-get-start.html post/embedded-system-learning/BeagleBone-Black-get-start.md
	@pandoc -o .ignore/BeagleBone-Black-get-start.sum.html post/embedded-system-learning/BeagleBone-Black-get-start.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2016-11-18 12:54:39.6263097 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Get Start with BeagleBone Black" ' \
		' -F "html=@.ignore/BeagleBone-Black-get-start.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/BeagleBone-Black-get-start.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=blog" ' \
		' -F "tag=highlight" ' \
		' -F "tag=code" ' \
		' -F "tag=embedded-systemlearning" ' \
		 $(SITE_URL)/b/embedded-sys/learning/beaglebone-black/get-start  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

embedded-system-learning-beaglebone-black-get-start.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		 $(SITE_URL)/b/embedded-sys/learning/beaglebone-black/get-start  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


embedded-system-learning-cross-compile-tools-build: post/embedded-system-learning/cross-compile-tools-build.md  post/embedded-system-learning/cross-compile-tools-build.sum.md
	@pandoc -o .ignore/cross-compile-tools-build.html post/embedded-system-learning/cross-compile-tools-build.md
	@pandoc -o .ignore/cross-compile-tools-build.sum.html post/embedded-system-learning/cross-compile-tools-build.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2016-11-17 14:02:08.133082 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Cross Compile Tools Build" ' \
		' -F "html=@.ignore/cross-compile-tools-build.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/cross-compile-tools-build.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=blog" ' \
		' -F "tag=highlight" ' \
		' -F "tag=embedded-system" ' \
		' -F "tag=learning" ' \
		' -F "tag=codes" ' \
		' -F "tag=macOS" ' \
		' -F "tag=arm-linux" ' \
		' -F "tag=cross-compiler" ' \
		 $(SITE_URL)/b/embedded-sys/learning/cross-tools-build  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

embedded-system-learning-cross-compile-tools-build.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		 $(SITE_URL)/b/embedded-sys/learning/cross-tools-build  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


