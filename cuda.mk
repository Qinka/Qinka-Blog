
img.lc.learn.cuda.res: post/cuda/computing-model.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-02-12 08:14:31.168136 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@post/cuda/computing-model.png" \
		-F "summary=" \
		-F "title=img.lc.learn.cuda.res" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/cuda/learn/computing-model.png
img.lc.learn.cuda.res.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/cuda/learn/computing-model.png
lc.learn.cuda.post: post/cuda/linear-combination.md post/cuda/linear-combination-sum.md
	@pandoc -t html -o post/cuda/linear-combination-sum.md.htmlout post/cuda/linear-combination-sum.md
	@pandoc -t html -o post/cuda/linear-combination.md.htmlout post/cuda/linear-combination.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-02-12 07:30:33.920291 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/cuda/linear-combination.md.htmlout" \
		-F "summary=@post/cuda/linear-combination-sum.md.htmlout" \
		-F "title=Linear Combination with CUDA" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=cuda" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/cuda/learn/linear-combination
lc.learn.cuda.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/cuda/learn/linear-combination
