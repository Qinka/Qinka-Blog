
what-i-think.exquisite.post: post/exquisite/what-i-think.md post/exquisite/what-i-think-sum.md
	@pandoc -t html -o post/exquisite/what-i-think-sum.md.htmlout post/exquisite/what-i-think-sum.md
	@pandoc -t html -o post/exquisite/what-i-think.md.htmlout post/exquisite/what-i-think.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-02-06 14:58:25.5822745 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/exquisite/what-i-think.md.htmlout" \
		-F "summary=@post/exquisite/what-i-think-sum.md.htmlout" \
		-F "title=我所思考的" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=Hacker" \
		-F "tag=hacker culture" \
		-F "tag=黑客" \
		-F "tag=黑客文化" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/exquisite/what-i-think
what-i-think.exquisite.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/exquisite/what-i-think
