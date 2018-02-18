
bottleneck.1.post: post/haskell/bottleneck.1.md post/haskell/bottleneck.1.sum.md
	@pandoc -t html -o post/haskell/bottleneck.1.sum.md.htmlout post/haskell/bottleneck.1.sum.md
	@pandoc -t html -o post/haskell/bottleneck.1.md.htmlout post/haskell/bottleneck.1.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-02-28 14:54:13.728015 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/haskell/bottleneck.1.md.htmlout" \
		-F "summary=@post/haskell/bottleneck.1.sum.md.htmlout" \
		-F "title=Bottleneck 1" \
		-F "whose=QInkqa" \
		-F "tag=blog" \
		-F "tag=highlight" \
		-F "tag=code" \
		-F "tag=haskell" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/bottleneck/1
bottleneck.1.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/bottleneck/1
crash.your.ghc.1.post: post/haskell/crash.your.ghc.1.md post/haskell/crash.your.ghc.1.sum.md
	@pandoc -t html -o post/haskell/crash.your.ghc.1.sum.md.htmlout post/haskell/crash.your.ghc.1.sum.md
	@pandoc -t html -o post/haskell/crash.your.ghc.1.md.htmlout post/haskell/crash.your.ghc.1.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-03-01 01:00:23.178984 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/haskell/crash.your.ghc.1.md.htmlout" \
		-F "summary=@post/haskell/crash.your.ghc.1.sum.md.htmlout" \
		-F "title=Crash your GHC 1" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=code" \
		-F "tag=highlight" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/crash-your-ghc/1
crash.your.ghc.1.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/crash-your-ghc/1
debug.in.ghci.1.post: post/haskell/debug.in.ghci.1.md post/haskell/debug.in.ghci.1.sum.md
	@pandoc -t html -o post/haskell/debug.in.ghci.1.sum.md.htmlout post/haskell/debug.in.ghci.1.sum.md
	@pandoc -t html -o post/haskell/debug.in.ghci.1.md.htmlout post/haskell/debug.in.ghci.1.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-02-27 13:23:25.343155 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/haskell/debug.in.ghci.1.md.htmlout" \
		-F "summary=@post/haskell/debug.in.ghci.1.sum.md.htmlout" \
		-F "title=Debug with GHCi 1" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=highlight" \
		-F "tag=code" \
		-F "tag=haskell" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/debug-with-ghci/1
debug.in.ghci.1.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/debug-with-ghci/1
memoization-in-haskell.1.img: img/haskell/mem_right_one.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2017-09-18 10:39:42.989391 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/haskell/mem_right_one.png" \
		-F "summary= " \
		-F "title=Memoization in Haskell figure 1" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-F "tag=img" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/haskell/mem_right_one.png
memoization-in-haskell.1.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/haskell/mem_right_one.png
memoization-in-haskell.2.img: img/haskell/mem_error_one.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2017-09-18 10:40:00.702901 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/haskell/mem_error_one.png" \
		-F "summary= " \
		-F "title=Memoization in Haskell figure 1" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-F "tag=img" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/haskell/mem_error_one.png
memoization-in-haskell.2.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/haskell/mem_error_one.png
memoization-in-haskell.3.img: img/haskell/mem_error_two.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2017-09-18 10:39:50.438584 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/haskell/mem_error_two.png" \
		-F "summary= " \
		-F "title=Memoization in Haskell figure 1" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-F "tag=img" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/haskell/mem_error_two.png
memoization-in-haskell.3.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/haskell/mem_error_two.png
memoization-in-haskell.post: post/haskell/memoization_in_haskell.md post/haskell/memoization_in_haskell.sum.md
	@pandoc -t html -o post/haskell/memoization_in_haskell.sum.md.htmlout post/haskell/memoization_in_haskell.sum.md
	@pandoc -t html -o post/haskell/memoization_in_haskell.md.htmlout post/haskell/memoization_in_haskell.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-03-23 14:26:10.1791938 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/haskell/memoization_in_haskell.md.htmlout" \
		-F "summary=@post/haskell/memoization_in_haskell.sum.md.htmlout" \
		-F "title=Memoization in Haskell" \
		-F "whose=Qinka" \
		-F "tag=code" \
		-F "tag=highlight" \
		-F "tag=post" \
		-F "tag=blog" \
		-F "tag=haskell" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/memoization
memoization-in-haskell.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/memoization
overloadedlabels: post/haskell/overloadedlabels.md post/haskell/overloadedlabels.sum.md
	@pandoc -t html -o post/haskell/overloadedlabels.sum.md.htmlout post/haskell/overloadedlabels.sum.md
	@pandoc -t html -o post/haskell/overloadedlabels.md.htmlout post/haskell/overloadedlabels.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-01-01 05:26:03.55291 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/haskell/overloadedlabels.md.htmlout" \
		-F "summary=@post/haskell/overloadedlabels.sum.md.htmlout" \
		-F "title=OverloadedLables" \
		-F "whose=Qinka" \
		-F "tag=highlight" \
		-F "tag=blog" \
		-F "tag=haskell" \
		-F "tag=haskell language extensions" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/extension/overloadedlabels
overloadedlabels.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/extension/overloadedlabels
repa-cuda.haskell.post: post/haskell/RepaWithCUDA.md post/haskell/RepaWithCUDA-sum.md
	@pandoc -t html -o post/haskell/RepaWithCUDA-sum.md.htmlout post/haskell/RepaWithCUDA-sum.md
	@pandoc -t html -o post/haskell/RepaWithCUDA.md.htmlout post/haskell/RepaWithCUDA.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-02-19 02:48:13.985401 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/haskell/RepaWithCUDA.md.htmlout" \
		-F "summary=@post/haskell/RepaWithCUDA-sum.md.htmlout" \
		-F "title=Repa Foreign Array On CUDA(GPU)" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=haskell" \
		-F "tag=cuda" \
		-F "tag=repa" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/repa-cuda
repa-cuda.haskell.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/haskell/repa-cuda