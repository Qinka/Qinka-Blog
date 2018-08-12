
0.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/0.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.32759 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/0.bmp" \
		-F "summary=" \
		-F "title=0.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/0
0.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/0
07UMT674.131473182860000000.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/07UMT674.131473182860000000.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.504083 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/07UMT674.131473182860000000.bmp" \
		-F "summary=" \
		-F "title=07UMT674.131473182860000000.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/07UMT674.131473182860000000
07UMT674.131473182860000000.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/07UMT674.131473182860000000
1.apr.2018.wbop.dl.post: post/deep-learning/weekly-briefing-of-papers/2018/apr-1.tex post/deep-learning/weekly-briefing-of-papers/2018/apr-1-sum.md
	@pandoc -t html -o post/deep-learning/weekly-briefing-of-papers/2018/apr-1-sum.md.htmlout post/deep-learning/weekly-briefing-of-papers/2018/apr-1-sum.md
	@pandoc -t html -o post/deep-learning/weekly-briefing-of-papers/2018/apr-1.tex.htmlout post/deep-learning/weekly-briefing-of-papers/2018/apr-1.tex  --bibliography random-bib/3d-deep-learning.bib --mathjax
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
1.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/1.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.347074 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/1.bmp" \
		-F "summary=" \
		-F "title=1.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/1
1.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/1
2.apr.2018.wbop.dl.post: post/deep-learning/weekly-briefing-of-papers/2018/apr-2.tex post/deep-learning/weekly-briefing-of-papers/2018/apr-2-sum.md
	@pandoc -t html -o post/deep-learning/weekly-briefing-of-papers/2018/apr-2-sum.md.htmlout post/deep-learning/weekly-briefing-of-papers/2018/apr-2-sum.md
	@pandoc -t html -o post/deep-learning/weekly-briefing-of-papers/2018/apr-2.tex.htmlout post/deep-learning/weekly-briefing-of-papers/2018/apr-2.tex  --bibliography random-bib/3d-deep-learning.bib --mathjax
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
2.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/2.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.363927 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/2.bmp" \
		-F "summary=" \
		-F "title=2.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/2
2.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/2
2d-anaglyph-3d.dl.img: img/deep-learning/2d-anaglyph-3d.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.573073 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/2d-anaglyph-3d.png" \
		-F "summary=" \
		-F "title=2d-anaglyph-3d.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/2d-anaglyph-3d
2d-anaglyph-3d.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/2d-anaglyph-3d
3.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/3.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.381712 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/3.bmp" \
		-F "summary=" \
		-F "title=3.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/3
3.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/3
3D-INN.dl.img: img/deep-learning/3D-INN.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.59665 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/3D-INN.png" \
		-F "summary=" \
		-F "title=3D-INN.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/3D-INN
3D-INN.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/3D-INN
3d-r2n2.dl.img: img/deep-learning/3d-r2n2.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.621039 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/3d-r2n2.png" \
		-F "summary=" \
		-F "title=3d-r2n2.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/3d-r2n2
3d-r2n2.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/3d-r2n2
3dshapenet.dl.img: img/deep-learning/3dshapenet.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.644585 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/3dshapenet.png" \
		-F "summary=" \
		-F "title=3dshapenet.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/3dshapenet
3dshapenet.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/3dshapenet
4.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/4.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.398221 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/4.bmp" \
		-F "summary=" \
		-F "title=4.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/4
4.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/4
5.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/5.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.414981 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/5.bmp" \
		-F "summary=" \
		-F "title=5.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/5
5.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/5
6.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/6.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.430696 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/6.bmp" \
		-F "summary=" \
		-F "title=6.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/6
6.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/6
64BDL132.131473222390000000.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/64BDL132.131473222390000000.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.528139 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/64BDL132.131473222390000000.bmp" \
		-F "summary=" \
		-F "title=64BDL132.131473222390000000.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/64BDL132.131473222390000000
64BDL132.131473222390000000.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/64BDL132.131473222390000000
65MZH676.131473222810000000.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/65MZH676.131473222810000000.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.546448 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/65MZH676.131473222810000000.bmp" \
		-F "summary=" \
		-F "title=65MZH676.131473222810000000.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/65MZH676.131473222810000000
65MZH676.131473222810000000.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/65MZH676.131473222810000000
66SJD585.131473174110000000.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/66SJD585.131473174110000000.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.564274 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/66SJD585.131473174110000000.bmp" \
		-F "summary=" \
		-F "title=66SJD585.131473174110000000.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/66SJD585.131473174110000000
66SJD585.131473174110000000.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/66SJD585.131473174110000000
7.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/7.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.453082 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/7.bmp" \
		-F "summary=" \
		-F "title=7.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/7
7.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/7
8.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/8.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.471039 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/8.bmp" \
		-F "summary=" \
		-F "title=8.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/8
8.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/8
9.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/9.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.489943 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/9.bmp" \
		-F "summary=" \
		-F "title=9.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/9
9.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/9
A.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/A.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.507291 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/A.bmp" \
		-F "summary=" \
		-F "title=A.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/A
A.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/A
B.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/B.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.525369 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/B.bmp" \
		-F "summary=" \
		-F "title=B.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/B
B.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/B
bed_0572.dl.img: img/deep-learning/bed_0572.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.664487 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/bed_0572.png" \
		-F "summary=" \
		-F "title=bed_0572.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/bed_0572
bed_0572.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/bed_0572
C.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/C.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.543041 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/C.bmp" \
		-F "summary=" \
		-F "title=C.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/C
C.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/C
D.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/D.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.559663 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/D.bmp" \
		-F "summary=" \
		-F "title=D.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/D
D.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/D
DeepStereo-1.dl.img: img/deep-learning/DeepStereo-1.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.685366 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/DeepStereo-1.png" \
		-F "summary=" \
		-F "title=DeepStereo-1.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/DeepStereo-1
DeepStereo-1.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/DeepStereo-1
DeepStereo-2.dl.img: img/deep-learning/DeepStereo-2.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.705218 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/DeepStereo-2.png" \
		-F "summary=" \
		-F "title=DeepStereo-2.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/DeepStereo-2
DeepStereo-2.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/DeepStereo-2
DeepStereo.dl.img: img/deep-learning/DeepStereo.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.726998 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/DeepStereo.png" \
		-F "summary=" \
		-F "title=DeepStereo.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/DeepStereo
DeepStereo.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/DeepStereo
dp.rp.snapshot: post/deep-learning/reimagined-pancake/snapshot.md
	@pandoc -t html -o post/deep-learning/reimagined-pancake/snapshot.md.htmlout post/deep-learning/reimagined-pancake/snapshot.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-08-14 13:50:49.111557 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/deep-learning/reimagined-pancake/snapshot.md.htmlout" \
		-F "summary=" \
		-F "title=Reimagined Pancake Snapshot" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=machine learning" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/reimagined-pancake
dp.rp.snapshot.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/reimagined-pancake
E.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/E.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.578728 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/E.bmp" \
		-F "summary=" \
		-F "title=E.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/E
E.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/E
F.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/F.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.596303 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/F.bmp" \
		-F "summary=" \
		-F "title=F.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/F
F.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/F
G.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/G.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.61425 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/G.bmp" \
		-F "summary=" \
		-F "title=G.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/G
G.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/G
generate-3-d-object.dl.img: img/deep-learning/generate-3-d-object.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.74565 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/generate-3-d-object.png" \
		-F "summary=" \
		-F "title=generate-3-d-object.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/generate-3-d-object
generate-3-d-object.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/generate-3-d-object
GirdharFRG16.dl.img: img/deep-learning/GirdharFRG16.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.76505 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/GirdharFRG16.png" \
		-F "summary=" \
		-F "title=GirdharFRG16.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/GirdharFRG16
GirdharFRG16.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/GirdharFRG16
gta5plate.dl.post: post/deep-learning/gtav-plate-recognition/generate-plate.md post/deep-learning/gtav-plate-recognition/generate-plate.sum.md
	@pandoc -t html -o post/deep-learning/gtav-plate-recognition/generate-plate.sum.md.htmlout post/deep-learning/gtav-plate-recognition/generate-plate.sum.md
	@pandoc -t html -o post/deep-learning/gtav-plate-recognition/generate-plate.md.htmlout post/deep-learning/gtav-plate-recognition/generate-plate.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-06-18 08:04:54.134051 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/deep-learning/gtav-plate-recognition/generate-plate.md.htmlout" \
		-F "summary=@post/deep-learning/gtav-plate-recognition/generate-plate.sum.md.htmlout" \
		-F "title=GTA Online Vehicle Plate Recognition -- Generating Plate as Training Data" \
		-F "whose=Qinka" \
		-F "tag=post" \
		-F "tag=blog" \
		-F "tag=deep-learning" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/gtav-plate-recognition/generate-plate
gta5plate.dl.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/gtav-plate-recognition/generate-plate
H.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/H.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.632741 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/H.bmp" \
		-F "summary=" \
		-F "title=H.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/H
H.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/H
I.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/I.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.651704 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/I.bmp" \
		-F "summary=" \
		-F "title=I.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/I
I.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/I
J.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/J.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.670527 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/J.bmp" \
		-F "summary=" \
		-F "title=J.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/J
J.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/J
K.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/K.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.689457 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/K.bmp" \
		-F "summary=" \
		-F "title=K.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/K
K.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/K
L.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/L.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.706737 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/L.bmp" \
		-F "summary=" \
		-F "title=L.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/L
L.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/L
M.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/M.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.72494 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/M.bmp" \
		-F "summary=" \
		-F "title=M.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/M
M.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/M
me.dl.post: post/deep-learning/ModelEvaluation.tex post/deep-learning/ModelEvalution-sum.tex
	@pandoc -t html -o post/deep-learning/ModelEvalution-sum.tex.htmlout post/deep-learning/ModelEvalution-sum.tex
	@pandoc -t html -o post/deep-learning/ModelEvaluation.tex.htmlout post/deep-learning/ModelEvaluation.tex  --bibliography random-bib/3d-deep-learning.bib --mathjax
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-06-18 07:25:35.806384 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/deep-learning/ModelEvaluation.tex.htmlout" \
		-F "summary=@post/deep-learning/ModelEvalution-sum.tex.htmlout" \
		-F "title=Machine Learning Model Evaluation" \
		-F "whose=Qinka" \
		-F "tag=post" \
		-F "tag=blog" \
		-F "tag=deep-learning" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/model-evaluation
me.dl.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/model-evaluation
modelnet-hoff-demo.dl.img: img/deep-learning/modelnet-hoff-demo.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.783514 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/modelnet-hoff-demo.png" \
		-F "summary=" \
		-F "title=modelnet-hoff-demo.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/modelnet-hoff-demo
modelnet-hoff-demo.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/modelnet-hoff-demo
multi-view.dl.img: img/deep-learning/multi-view.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.802863 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/multi-view.png" \
		-F "summary=" \
		-F "title=multi-view.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/multi-view
multi-view.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/multi-view
N.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/N.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.743789 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/N.bmp" \
		-F "summary=" \
		-F "title=N.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/N
N.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/N
o-3d-cnn.dl.img: img/deep-learning/o-3d-cnn.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.821226 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/o-3d-cnn.png" \
		-F "summary=" \
		-F "title=o-3d-cnn.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/o-3d-cnn
o-3d-cnn.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/o-3d-cnn
O.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/O.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.76434 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/O.bmp" \
		-F "summary=" \
		-F "title=O.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/O
O.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/O
off.modelnet.dl.post: post/deep-learning/dataset/ModelNet/OFF.tex post/deep-learning/dataset/ModelNet/OFF-sum.tex
	@pandoc -t html -o post/deep-learning/dataset/ModelNet/OFF-sum.tex.htmlout post/deep-learning/dataset/ModelNet/OFF-sum.tex
	@pandoc -t html -o post/deep-learning/dataset/ModelNet/OFF.tex.htmlout post/deep-learning/dataset/ModelNet/OFF.tex  --bibliography random-bib/3d-deep-learning.bib --mathjax
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-06-18 05:33:54.702873 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/deep-learning/dataset/ModelNet/OFF.tex.htmlout" \
		-F "summary=@post/deep-learning/dataset/ModelNet/OFF-sum.tex.htmlout" \
		-F "title=ModelNet Dataset: Object File Format(OFF)" \
		-F "whose=Qinka" \
		-F "tag=post" \
		-F "tag=blog" \
		-F "tag=deep-learning" \
		-F "tag=ModelNet" \
		-F "tag=OFF" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/dataset/modelnet/off
off.modelnet.dl.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/dataset/modelnet/off
opt-conv.dl.img: img/deep-learning/opt-conv.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.841127 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/opt-conv.png" \
		-F "summary=" \
		-F "title=opt-conv.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/opt-conv
opt-conv.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/opt-conv
P.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/P.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.78221 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/P.bmp" \
		-F "summary=" \
		-F "title=P.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/P
P.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/P
plate01.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/plate01.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.584413 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/plate01.bmp" \
		-F "summary=" \
		-F "title=plate01.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate01
plate01.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate01
plate02.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/plate02.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.602333 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/plate02.bmp" \
		-F "summary=" \
		-F "title=plate02.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate02
plate02.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate02
plate03.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/plate03.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.621063 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/plate03.bmp" \
		-F "summary=" \
		-F "title=plate03.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate03
plate03.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate03
plate04.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/plate04.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.638605 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/plate04.bmp" \
		-F "summary=" \
		-F "title=plate04.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate04
plate04.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate04
plate05.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/plate05.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.656928 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/plate05.bmp" \
		-F "summary=" \
		-F "title=plate05.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate05
plate05.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/plate05
pointnet.dl.img: img/deep-learning/pointnet.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-13 14:17:34.662946 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/pointnet.png" \
		-F "summary=" \
		-F "title=pointnet.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/pointnet.png
pointnet.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/pointnet.png
pointnet.review.dl.post: post/3d-deep-learninig/PointNet-Review.tex post/3d-deep-learninig/PointNet-Review-sum.tex
	@pandoc -t html -o post/3d-deep-learninig/PointNet-Review-sum.tex.htmlout post/3d-deep-learninig/PointNet-Review-sum.tex
	@pandoc -t html -o post/3d-deep-learninig/PointNet-Review.tex.htmlout post/3d-deep-learninig/PointNet-Review.tex  --bibliography random-bib/3d-deep-learning.bib --mathjax
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-06-13 13:28:18.650249 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/3d-deep-learninig/PointNet-Review.tex.htmlout" \
		-F "summary=@post/3d-deep-learninig/PointNet-Review-sum.tex.htmlout" \
		-F "title=PointNet Review" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=PointNet" \
		-F "tag=3D Deep Learning" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/Review/PointNet
pointnet.review.dl.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/Review/PointNet
pttest.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/pttest.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.798928 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/pttest.bmp" \
		-F "summary=" \
		-F "title=pttest.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/pttest
pttest.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/pttest
Q.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/Q.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.81767 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/Q.bmp" \
		-F "summary=" \
		-F "title=Q.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/Q
Q.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/Q
R.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/R.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.836075 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/R.bmp" \
		-F "summary=" \
		-F "title=R.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/R
R.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/R
residual-conv-net.dl.img: img/deep-learning/residual-conv-net.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.861976 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/residual-conv-net.png" \
		-F "summary=" \
		-F "title=residual-conv-net.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/residual-conv-net
residual-conv-net.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/residual-conv-net
S.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/S.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.853717 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/S.bmp" \
		-F "summary=" \
		-F "title=S.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/S
S.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/S
snr.from-mnist.tensorflow.dl.post: post//deep-learning/tensorflow/from_mnist/save_and_restore.md post/deep-learning/tensorflow/from_mnist/save_and_restore_sum.md
	@pandoc -t html -o post/deep-learning/tensorflow/from_mnist/save_and_restore_sum.md.htmlout post/deep-learning/tensorflow/from_mnist/save_and_restore_sum.md
	@pandoc -t html -o post//deep-learning/tensorflow/from_mnist/save_and_restore.md.htmlout post//deep-learning/tensorflow/from_mnist/save_and_restore.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-12-25 09:30:13.507656 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post//deep-learning/tensorflow/from_mnist/save_and_restore.md.htmlout" \
		-F "summary=@post/deep-learning/tensorflow/from_mnist/save_and_restore_sum.md.htmlout" \
		-F "title=From MNIST: Save and restore model" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=deep learning" \
		-F "tag=tensorflow" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/tensorflow/from-mnist/save-and-restore
snr.from-mnist.tensorflow.dl.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/tensorflow/from-mnist/save-and-restore
sparse-3d-cnn-on-different-lattices.dl.img: img/deep-learning/sparse-3d-cnn-on-different-lattices.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.881264 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/sparse-3d-cnn-on-different-lattices.png" \
		-F "summary=" \
		-F "title=sparse-3d-cnn-on-different-lattices.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/sparse-3d-cnn-on-different-lattices
sparse-3d-cnn-on-different-lattices.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/sparse-3d-cnn-on-different-lattices
T.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/T.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.871389 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/T.bmp" \
		-F "summary=" \
		-F "title=T.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/T
T.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/T
table_0440.dl.img: img/deep-learning/table_0440.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.907844 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/table_0440.png" \
		-F "summary=" \
		-F "title=table_0440.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/table_0440
table_0440.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/table_0440
tensorflow-install-unix: post/deep-learning/tensorflow/install/unix.md post/deep-learning/tensorflow/install/unix.sum.md
	@pandoc -t html -o post/deep-learning/tensorflow/install/unix.sum.md.htmlout post/deep-learning/tensorflow/install/unix.sum.md
	@pandoc -t html -o post/deep-learning/tensorflow/install/unix.md.htmlout post/deep-learning/tensorflow/install/unix.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-07-16 08:43:20.630857 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/deep-learning/tensorflow/install/unix.md.htmlout" \
		-F "summary=@post/deep-learning/tensorflow/install/unix.sum.md.htmlout" \
		-F "title=Install Haskell Binding of TensorFlow on *nix" \
		-F "whose=Qinka" \
		-F "tag=deeplearning" \
		-F "tag=tensorflow" \
		-F "tag=install" \
		-F "tag=Haskell" \
		-F "tag=blog" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/tensorflow/install/unix
tensorflow-install-unix.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/deep-learning/tensorflow/install/unix
test.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/test.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.888641 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/test.bmp" \
		-F "summary=" \
		-F "title=test.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/test
test.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/test
test2.dl.img: img/deep-learning/test2.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.927425 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/test2.png" \
		-F "summary=" \
		-F "title=test2.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/test2
test2.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/test2
U.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/U.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.915232 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/U.bmp" \
		-F "summary=" \
		-F "title=U.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/U
U.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/U
V.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/V.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.933201 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/V.bmp" \
		-F "summary=" \
		-F "title=V.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/V
V.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/V
vehicle_generic_plate_font.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/vehicle_generic_plate_font.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:12:14.675516 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/vehicle_generic_plate_font.bmp" \
		-F "summary=" \
		-F "title=vehicle_generic_plate_font.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/vehicle_generic_plate_font
vehicle_generic_plate_font.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/vehicle_generic_plate_font
vote3deep-real.dl.img: img/deep-learning/vote3deep-real.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.96669 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/vote3deep-real.png" \
		-F "summary=" \
		-F "title=vote3deep-real.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/vote3deep-real
vote3deep-real.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/vote3deep-real
vote3deep.dl.img: img/deep-learning/vote3deep.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.947734 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/vote3deep.png" \
		-F "summary=" \
		-F "title=vote3deep.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/vote3deep
vote3deep.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/vote3deep
voxnet.dl.img: img/deep-learning/voxnet.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 07:41:59.986209 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/voxnet.png" \
		-F "summary=" \
		-F "title=voxnet.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/voxnet
voxnet.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/voxnet
W.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/W.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.971937 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/W.bmp" \
		-F "summary=" \
		-F "title=W.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/W
W.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/W
wbgtest.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/wbgtest.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.952724 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/wbgtest.bmp" \
		-F "summary=" \
		-F "title=wbgtest.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/wbgtest
wbgtest.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/wbgtest
X.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/X.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:15.991758 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/X.bmp" \
		-F "summary=" \
		-F "title=X.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/X
X.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/X
Y.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/Y.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:16.010708 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/Y.bmp" \
		-F "summary=" \
		-F "title=Y.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/Y
Y.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/Y
Z.gta5pr.dl.img: img/deep-learning/gta5-plate-recognition/Z.bmp
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-18 08:11:16.028507 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/deep-learning/gta5-plate-recognition/Z.bmp" \
		-F "summary=" \
		-F "title=Z.gta5pr.dl.img" \
		-F "whose=Qinka" \
		-F "mime=image/bmp" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/Z
Z.gta5pr.dl.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/deep-learning/gta5-plate-recognition/Z
bg1.cl.bip.cv.img: img/computer-vision/basic-image-processing/combine-image/bg1.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-08-11 15:52:41.426985 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/computer-vision/basic-image-processing/combine-image/bg1.png" \
		-F "summary=" \
		-F "title=bg1.cl.bip.cv.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/bg1.png
bg1.cl.bip.cv.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/bg1.png

bg2.cl.bip.cv.img: img/computer-vision/basic-image-processing/combine-image/bg2.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-08-11 15:52:41.458345 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/computer-vision/basic-image-processing/combine-image/bg2.png" \
		-F "summary=" \
		-F "title=bg2.cl.bip.cv.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/bg2.png
bg2.cl.bip.cv.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/bg2.png

fn1.cl.bip.cv.img: img/computer-vision/basic-image-processing/combine-image/fn1.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-08-11 15:52:41.478369 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/computer-vision/basic-image-processing/combine-image/fn1.png" \
		-F "summary=" \
		-F "title=fn1.cl.bip.cv.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/fn1.png
fn1.cl.bip.cv.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/fn1.png

ho2.cl.bip.cv.img: img/computer-vision/basic-image-processing/combine-image/ho2.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-08-11 15:52:41.496778 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/computer-vision/basic-image-processing/combine-image/ho2.png" \
		-F "summary=" \
		-F "title=ho2.cl.bip.cv.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/ho2.png
ho2.cl.bip.cv.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/ho2.png

ho3.cl.bip.cv.img: img/computer-vision/basic-image-processing/combine-image/ho3.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-08-11 15:52:41.51549 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/computer-vision/basic-image-processing/combine-image/ho3.png" \
		-F "summary=" \
		-F "title=ho3.cl.bip.cv.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/ho3.png
ho3.cl.bip.cv.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/ho3.png

ho4.cl.bip.cv.img: img/computer-vision/basic-image-processing/combine-image/ho4.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-08-11 15:52:41.532573 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/computer-vision/basic-image-processing/combine-image/ho4.png" \
		-F "summary=" \
		-F "title=ho4.cl.bip.cv.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/ho4.png
ho4.cl.bip.cv.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/ho4.png

lc.cl.bip.cv.img: img/computer-vision/basic-image-processing/combine-image/lc.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-08-11 15:52:41.551569 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/computer-vision/basic-image-processing/combine-image/lc.png" \
		-F "summary=" \
		-F "title=lc.cl.bip.cv.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/lc.png
lc.cl.bip.cv.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/lc.png

mask1.cl.bip.cv.img: img/computer-vision/basic-image-processing/combine-image/mask1.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-08-11 15:52:41.570489 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/computer-vision/basic-image-processing/combine-image/mask1.png" \
		-F "summary=" \
		-F "title=mask1.cl.bip.cv.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/mask1.png
mask1.cl.bip.cv.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/mask1.png

rt1.cl.bip.cv.img: img/computer-vision/basic-image-processing/combine-image/rt1.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-08-11 15:52:41.590272 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/computer-vision/basic-image-processing/combine-image/rt1.png" \
		-F "summary=" \
		-F "title=rt1.cl.bip.cv.img" \
		-F "whose=Qinka" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/rt1.png
rt1.cl.bip.cv.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/compute-vision/basic-image-processing/combine-image/rt1.png

cl.bip.cv.post: post/computer-vision/basic-image-processing/combine-image.tex post/computer-vision/basic-image-processing/combine-image.md
	@pandoc -t html -o post/computer-vision/basic-image-processing/combine-image.md.htmlout post/computer-vision/basic-image-processing/combine-image.md
	@pandoc -t html -o post/computer-vision/basic-image-processing/combine-image.tex.htmlout post/computer-vision/basic-image-processing/combine-image.tex --mathjax --listings
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-08-11 15:47:41.194548 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/computer-vision/basic-image-processing/combine-image.tex.htmlout" \
		-F "summary=@post/computer-vision/basic-image-processing/combine-image.md.htmlout" \
		-F "title=利用简单图像组合图片" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=computer vision" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/computer-vision/basic-image-processing/combine-image
cl.bip.cv.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/computer-vision/basic-image-processing/combine-image
