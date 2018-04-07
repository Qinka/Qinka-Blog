
1.apr.2018.wbop.post: post/weekly-briefing-of-papers/2018/apr-1.tex post/weekly-briefing-of-papers/2018/apr-1-sum.md
	@pandoc -t html -o post/weekly-briefing-of-papers/2018/apr-1-sum.md.htmlout post/weekly-briefing-of-papers/2018/apr-1-sum.md
	@pandoc --mathjax -t html -o post/weekly-briefing-of-papers/2018/apr-1.tex.htmlout post/weekly-briefing-of-papers/2018/apr-1.tex
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-04-07 10:38:59.410072 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/weekly-briefing-of-papers/2018/apr-1.tex.htmlout" \
		-F "summary=@post/weekly-briefing-of-papers/2018/apr-1-sum.md.htmlout" \
		-F "title=Weekly Briefing of Papers - (Apr. 6, 2018)" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=paper" \
		-F "tag=report" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/wbop/2018/apr/1
1.apr.2018.wbop.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/wbop/2018/apr/1
