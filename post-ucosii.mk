
transplant.ucosii.post: post/ucosii/transplant.md post/ucosii/transplant-sum.md
	@pandoc -t html -o post/ucosii/transplant-sum.md.htmlout post/ucosii/transplant-sum.md
	@pandoc -t html -o post/ucosii/transplant.md.htmlout post/ucosii/transplant.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-12-05 12:00:52.923056 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/ucosii/transplant.md.htmlout" \
		-F "summary=@post/ucosii/transplant-sum.md.htmlout" \
		-F "title=Transplant uC/OS II to STM32F103ZET6 with GNU Toolchains" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=ucosii" \
		-F "tag=stm32" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/b/ucosii/transplant
transplant.ucosii.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/b/ucosii/transplant