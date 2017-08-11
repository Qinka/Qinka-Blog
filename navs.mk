
navs:
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.query/.nav
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "order=2" \
		-F "url=/blog" \
		-F "label=Blog" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.query/.nav
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "order=1" \
		-F "url=/" \
		-F "label=Home" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.query/.nav
