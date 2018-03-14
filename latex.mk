
8-bit-guys-man.printable-manual.trick.latex.img: img/latex/trick/printable-manual/8-bit-guys-man.PNG
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:47:14.556654 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/latex/trick/printable-manual/8-bit-guys-man.PNG" \
		-F "summary=" \
		-F "title=8-bit-guys-man.printable-manual.trick.latex.img" \
		-F "mime=image/x-png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/8-bit-guys-man.PNG
8-bit-guys-man.printable-manual.trick.latex.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/8-bit-guys-man.PNG
origin-background-full.printable-manual.trick.latex.img: img/latex/trick/printable-manual/origin-background-full.PNG
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:47:22.368746 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/latex/trick/printable-manual/origin-background-full.PNG" \
		-F "summary=" \
		-F "title=origin-background-full.printable-manual.trick.latex.img" \
		-F "mime=image/x-png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/origin-background-full.PNG
origin-background-full.printable-manual.trick.latex.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/origin-background-full.PNG
origin-background-image.printable-manual.trick.latex.img: img/latex/trick/printable-manual/origin-background-image.PNG
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:47:30.024961 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/latex/trick/printable-manual/origin-background-image.PNG" \
		-F "summary=" \
		-F "title=origin-background-image.printable-manual.trick.latex.img" \
		-F "mime=image/x-png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/origin-background-image.PNG
origin-background-image.printable-manual.trick.latex.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/origin-background-image.PNG
origin-background.pdf.printable-manual.trick.latex.src: src/latex/trick/printable-manual/origin-background.pdf
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:58:05.519002 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@src/latex/trick/printable-manual/origin-background.pdf" \
		-F "summary=" \
		-F "title=origin-background.pdf.printable-manual.trick.latex.src" \
		-F "mime=application/pdf" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/origin-background.pdf
origin-background.pdf.printable-manual.trick.latex.src.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/origin-background.pdf
origin-background.printable-manual.trick.latex.img: img/latex/trick/printable-manual/origin-background.PNG
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:47:37.870405 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/latex/trick/printable-manual/origin-background.PNG" \
		-F "summary=" \
		-F "title=origin-background.printable-manual.trick.latex.img" \
		-F "mime=image/x-png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/origin-background.PNG
origin-background.printable-manual.trick.latex.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/origin-background.PNG
origin-background.tex.printable-manual.trick.latex.src: src/latex/trick/printable-manual/origin-background.tex
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2018-03-14 14:55:24.646653 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@src/latex/trick/printable-manual/origin-background.tex" \
		-F "summary=" \
		-F "title=origin-background.tex.printable-manual.trick.latex.src" \
		-F "mime=application/x-tex" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/origin-background.tex
origin-background.tex.printable-manual.trick.latex.src.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/origin-background.tex
origin.pdf.printable-manual.trick.latex.src: src/latex/trick/printable-manual/origin.pdf
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:58:13.76523 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@src/latex/trick/printable-manual/origin.pdf" \
		-F "summary=" \
		-F "title=origin.pdf.printable-manual.trick.latex.src" \
		-F "mime=application/pdf" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/origin.pdf
origin.pdf.printable-manual.trick.latex.src.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/origin.pdf
origin.tex.printable-manual.trick.latex.src: src/latex/trick/printable-manual/origin.tex
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2018-03-14 14:55:32.51719 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@src/latex/trick/printable-manual/origin.tex" \
		-F "summary=" \
		-F "title=origin.tex.printable-manual.trick.latex.src" \
		-F "mime=application/x-tex" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/origin.tex
origin.tex.printable-manual.trick.latex.src.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/origin.tex
printable-manual.trick.latex.post: post/latex/trick/printable-manual.md post/latex/trick/printable-manual-sum.md
	@pandoc -t html -o post/latex/trick/printable-manual-sum.md.htmlout post/latex/trick/printable-manual-sum.md
	@pandoc -t html -o post/latex/trick/printable-manual.md.htmlout post/latex/trick/printable-manual.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-03-14 14:42:33.025303 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/latex/trick/printable-manual.md.htmlout" \
		-F "summary=@post/latex/trick/printable-manual-sum.md.htmlout" \
		-F "title=Printable Manual" \
		-F "whose=Qinka" \
		-F "tag=latex" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=manual" \
		-F "tag=printable" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/latex/trick/printable-manual
printable-manual.trick.latex.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/latex/trick/printable-manual
two-in-one-origin.printable-manual.trick.latex.img: img/latex/trick/printable-manual/two-in-one-origin.PNG
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:47:45.696634 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/latex/trick/printable-manual/two-in-one-origin.PNG" \
		-F "summary=" \
		-F "title=two-in-one-origin.printable-manual.trick.latex.img" \
		-F "mime=image/x-png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/two-in-one-origin.PNG
two-in-one-origin.printable-manual.trick.latex.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/two-in-one-origin.PNG
two-in-one-pdfpages.pdf.printable-manual.trick.latex.src: src/latex/trick/printable-manual/two-in-one-pdfpages.pdf
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:58:29.954431 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@src/latex/trick/printable-manual/two-in-one-pdfpages.pdf" \
		-F "summary=" \
		-F "title=two-in-one-pdfpages.pdf.printable-manual.trick.latex.src" \
		-F "mime=application/pdf" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/two-in-one-pdfpages.pdf
two-in-one-pdfpages.pdf.printable-manual.trick.latex.src.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/two-in-one-pdfpages.pdf
two-in-one-pdfpages.printable-manual.trick.latex.img: img/latex/trick/printable-manual/two-in-one-pdfpages.PNG
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:47:53.284983 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/latex/trick/printable-manual/two-in-one-pdfpages.PNG" \
		-F "summary=" \
		-F "title=two-in-one-pdfpages.printable-manual.trick.latex.img" \
		-F "mime=image/x-png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/two-in-one-pdfpages.PNG
two-in-one-pdfpages.printable-manual.trick.latex.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/two-in-one-pdfpages.PNG
two-in-one-pdfpages.tex.printable-manual.trick.latex.src: src/latex/trick/printable-manual/two-in-one-pdfpages.tex
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2018-03-14 14:55:39.959175 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@src/latex/trick/printable-manual/two-in-one-pdfpages.tex" \
		-F "summary=" \
		-F "title=two-in-one-pdfpages.tex.printable-manual.trick.latex.src" \
		-F "mime=application/x-tex" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/two-in-one-pdfpages.tex
two-in-one-pdfpages.tex.printable-manual.trick.latex.src.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/two-in-one-pdfpages.tex
two-in-one.pdf.printable-manual.trick.latex.src: src/latex/trick/printable-manual/two-in-one.pdf
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:58:21.369567 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@src/latex/trick/printable-manual/two-in-one.pdf" \
		-F "summary=" \
		-F "title=two-in-one.pdf.printable-manual.trick.latex.src" \
		-F "mime=application/pdf" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/two-in-one.pdf
two-in-one.pdf.printable-manual.trick.latex.src.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/two-in-one.pdf
two-in-one.printable-manual.trick.latex.img: img/latex/trick/printable-manual/two-in-one.PNG
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-03-14 14:48:01.370787 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/latex/trick/printable-manual/two-in-one.PNG" \
		-F "summary=" \
		-F "title=two-in-one.printable-manual.trick.latex.img" \
		-F "mime=image/x-png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/two-in-one.PNG
two-in-one.printable-manual.trick.latex.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/latex/trick/printable-manual/two-in-one.PNG
two-in-one.tex.printable-manual.trick.latex.src: src/latex/trick/printable-manual/two-in-one.tex
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2018-03-14 14:55:47.789705 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@src/latex/trick/printable-manual/two-in-one.tex" \
		-F "summary=" \
		-F "title=two-in-one.tex.printable-manual.trick.latex.src" \
		-F "mime=application/x-tex" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/two-in-one.tex
two-in-one.tex.printable-manual.trick.latex.src.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/src/latex/trick/printable-manual/two-in-one.tex
