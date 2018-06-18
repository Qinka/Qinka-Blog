
1.apr.2018.wbop.dl.post: post/deep-learning/weekly-briefing-of-papers/2018/apr-1.tex post/deep-learning/weekly-briefing-of-papers/2018/apr-1-sum.md
	@pandoc -t html -o post/deep-learning/weekly-briefing-of-papers/2018/apr-1-sum.md.htmlout post/deep-learning/weekly-briefing-of-papers/2018/apr-1-sum.md
	@pandoc -t html -o post/deep-learning/weekly-briefing-of-papers/2018/apr-1.tex.htmlout post/deep-learning/weekly-briefing-of-papers/2018/apr-1.tex --bibliography random-bib/3d-deep-learning.bib --mathjax
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-04-07 10:38:59.410072 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/deep-learning/weekly-briefing-of-papers/2018/apr-1.tex.htmlout" \
		-F "summary=@post/deep-learning/weekly-briefing-of-papers/2018/apr-1-sum.md.htmlout" \
		-F "title=Weekly Briefing of Papers - (Apr. 6, 2018)" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=paper" \
		-F "tag=report" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/wbop/2018/apr/1
1.apr.2018.wbop.dl.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/wbop/2018/apr/1
2.apr.2018.wbop.dl.post: post/deep-learning/weekly-briefing-of-papers/2018/apr-2.tex post/deep-learning/weekly-briefing-of-papers/2018/apr-2-sum.md
	@pandoc -t html -o post/deep-learning/weekly-briefing-of-papers/2018/apr-2-sum.md.htmlout post/deep-learning/weekly-briefing-of-papers/2018/apr-2-sum.md
	@pandoc -t html -o post/deep-learning/weekly-briefing-of-papers/2018/apr-2.tex.htmlout post/deep-learning/weekly-briefing-of-papers/2018/apr-2.tex --bibliography random-bib/3d-deep-learning.bib --mathjax
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-04-07 10:38:59.410072 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/deep-learning/weekly-briefing-of-papers/2018/apr-2.tex.htmlout" \
		-F "summary=@post/deep-learning/weekly-briefing-of-papers/2018/apr-2-sum.md.htmlout" \
		-F "title=Weekly Briefing of Papers - (Apr. 15, 2018)" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=paper" \
		-F "tag=report" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/wbop/2018/apr/2
2.apr.2018.wbop.dl.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/wbop/2018/apr/2