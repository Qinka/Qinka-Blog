
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
