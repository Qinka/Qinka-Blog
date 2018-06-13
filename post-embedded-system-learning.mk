509.embedded.post: post/embedded-system-learning/509.md  post/embedded-system-learning/509.sum.md
	@pandoc -o .ignore/509.html post/embedded-system-learning/509.md
	@pandoc -o .ignore/509.sum.html post/embedded-system-learning/509.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-02-19 09:44:20.82885 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Obj509" ' \
		' -F "html=@.ignore/509.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/509.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=code" ' \
		' -F "tag=blog" ' \
		' -F "tag=highlight" ' \
		' -F "tag=embedded system learning" ' \
		 $(SITE_URL)/b/embedded-sys/obj509  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

509.embedded.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/embedded-sys/obj509  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


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
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/embedded-sys/learning/beaglebone-black/get-start  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


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
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/embedded-sys/learning/cross-tools-build  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)



big-little.3519.embedded.post: post/embedded-system-learning/3519-BIG.LITTLE.md post/embedded-system-learning/3519-BIG.LITTLE.sum.md
	@pandoc -t html -o post/embedded-system-learning/3519-BIG.LITTLE.sum.md.htmlout post/embedded-system-learning/3519-BIG.LITTLE.sum.md
	@pandoc -t html -o post/embedded-system-learning/3519-BIG.LITTLE.md.htmlout post/embedded-system-learning/3519-BIG.LITTLE.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-05-25 09:25:45.672619 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded-system-learning/3519-BIG.LITTLE.md.htmlout" \
		-F "summary=@post/embedded-system-learning/3519-BIG.LITTLE.sum.md.htmlout" \
		-F "title=Linux 大小核 独占" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=hi3519" \
		-F "tag=3519" \
		-F "tag=big.LITTLE" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/3519/big.LITTLE/cpu_affinity
big-little.3519.embedded.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/3519/big.LITTLE/cpu_affinity
