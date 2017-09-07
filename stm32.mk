
stm32.env.setup.post: post/stm32/enviroments/setting.md post/stm32/enviroments/setting-sum.md
	@pandoc -t html -o post/stm32/enviroments/setting-sum.md.htmlout post/stm32/enviroments/setting-sum.md
	@pandoc -t html -o post/stm32/enviroments/setting.md.htmlout post/stm32/enviroments/setting.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-09-04 16:00:10.8431427 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/stm32/enviroments/setting.md.htmlout" \
		-F "summary=@post/stm32/enviroments/setting-sum.md.htmlout" \
		-F "title=Install STM32 Development Environment" \
		-F "whose=Qinka" \
		-F "tag=stm32" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=arm-gcc" \
		-F "tag=code" \
		-F "tag=highlight" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/b/stm32/env/setup
stm32.env.setup.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/b/stm32/env/setup

stm32.get.started.post: post/stm32/get-started.md post/stm32/get-started-sum.md
	@pandoc -t html -o post/stm32/get-started-sum.md.htmlout post/stm32/get-started-sum.md
	@pandoc -t html -o post/stm32/get-started.md.htmlout post/stm32/get-started.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-09-05 03:06:10.37847628 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/stm32/get-started.md.htmlout" \
		-F "summary=@post/stm32/get-started-sum.md.htmlout" \
		-F "title=STM32F103 Get Started" \
		-F "whose=Qinka" \
		-F "tag=post" \
		-F "tag=blog" \
		-F "tag=code" \
		-F "tag=highlight" \
		-F "tag=stm32" \
		-F "tag=stm32f103" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/b/stm32/get-started
stm32.get.started.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/b/stm32/get-started
stm32.note.1.post: post/stm32/note1.md post/stm32/note1-sum.md
	@pandoc -t html -o post/stm32/note1-sum.md.htmlout post/stm32/note1-sum.md
	@pandoc -t html -o post/stm32/note1.md.htmlout post/stm32/note1.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-09-07 12:09:18.645531 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/stm32/note1.md.htmlout" \
		-F "summary=@post/stm32/note1-sum.md.htmlout" \
		-F "title=Note 1 -- GPIO and Interrupt" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=stm32" \
		-F "tag=stm32f103zet" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/b/stm32/note/1
stm32.note.1.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/b/stm32/note/1