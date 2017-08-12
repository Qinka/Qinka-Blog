
frame.blog: blog.html
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-08-11 11:55:37.214848 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@blog.html" \
		-F "summary=" \
		-F "title=Blog" \
		-F "whose=Qinka" \
		-F "tag=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/blog
frame.blog.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/blog

frame.bottom: .frame/bottom.html
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=frame" \
		-F "create-time=2017-08-11 12:18:13.541368 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@.frame/bottom.html" \
		-F "summary=" \
		-F "title=frame.bottom" \
		-F "whose=Qinka" \
		-F "tag=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.frame/bottom
frame.bottom.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.frame/bottom

frame.css.boot: res/css/boot.css
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2017-08-11 12:13:22.249548 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@res/css/boot.css" \
		-F "summary=" \
		-F "title=frame.css.boot" \
		-F "whose=Qinka" \
		-F "mime=text/css" \
		-F "tag=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/css/boot.css
frame.css.boot.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/css/boot.css

frame.css.bootstrap: res/css/bootstrap.min.css
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2017-08-11 12:13:07.000667 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@res/css/bootstrap.min.css" \
		-F "summary=" \
		-F "title=frame.css.bootstrap" \
		-F "whose=Qinka" \
		-F "mime=text/css" \
		-F "tag=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/css/bootstrap.min.css
frame.css.bootstrap.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/css/bootstrap.min.css

frame.css.code: res/css/code.css
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2017-08-11 12:12:51.312084 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@res/css/code.css" \
		-F "summary=" \
		-F "title=frame.css.code" \
		-F "whose=Qinka" \
		-F "mime=text/css" \
		-F "tag=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/css/code.css
frame.css.code.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/css/code.css

frame.header: .frame/header.html
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=frame" \
		-F "create-time=2017-08-11 12:18:13.558218 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@.frame/header.html" \
		-F "summary=" \
		-F "title=frame.header" \
		-F "whose=Qinka" \
		-F "tag=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.frame/header
frame.header.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.frame/header

frame.img.fork.me: res/img/fork.me.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2017-08-11 12:09:12.113728 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@res/img/fork.me.png" \
		-F "summary=" \
		-F "title=frame.img.fork.me" \
		-F "whose=Qinka" \
		-F "mime=image/x-png" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/img/fork.me.png
frame.img.fork.me.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/img/fork.me.png

frame.img.ico: res/img/glob.ico
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2017-08-11 12:10:43.202995 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@res/img/glob.ico" \
		-F "summary=" \
		-F "title=frame.img.ico" \
		-F "whose=Qinka" \
		-F "mime=image/x-icon" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/favicon.ico
frame.img.ico.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/favicon.ico

frame.index: index.md
	@pandoc -t html -o index.md.htmlout index.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-08-11 11:45:54.528308 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@index.md.htmlout" \
		-F "summary=" \
		-F "title=Home" \
		-F "whose=Qinka" \
		-F "tag=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/
frame.index.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/

frame.js.action: res/js/action.js
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2017-08-11 12:11:30.158616 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@res/js/action.js" \
		-F "summary=" \
		-F "title=frame.js.action" \
		-F "whose=Qinka" \
		-F "mime=application/x-javascript" \
		-F "tag=frame" \
		-F "tag=js" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/js/action.js
frame.js.action.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/js/action.js

frame.js.blog: res/js/blog.js
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2017-08-11 12:11:30.176681 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@res/js/blog.js" \
		-F "summary=" \
		-F "title=frame.js.blog" \
		-F "whose=Qinka" \
		-F "mime=application/x-javascript" \
		-F "tag=frame" \
		-F "tag=js" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/js/blog.js
frame.js.blog.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/js/blog.js

frame.js.frame: res/js/frame.js
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2017-08-11 12:11:30.19552 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@res/js/frame.js" \
		-F "summary=" \
		-F "title=frame.js.frame" \
		-F "whose=Qinka" \
		-F "mime=application/x-javascript" \
		-F "tag=frame" \
		-F "tag=js" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/js/frame.js
frame.js.frame.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/js/frame.js

frame.js.qrcode: res/js/qrcode.min.js
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=text" \
		-F "create-time=2017-08-11 12:11:30.217853 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "text=@res/js/qrcode.min.js" \
		-F "summary=" \
		-F "title=frame.js.qrcode" \
		-F "whose=Qinka" \
		-F "mime=application/x-javascript" \
		-F "tag=frame" \
		-F "tag=js" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/js/qrcode.js
frame.js.qrcode.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=text" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/res/js/qrcode.js

frame.nav: .frame/nav.html
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=frame" \
		-F "create-time=2017-08-11 12:18:13.571601 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@.frame/nav.html" \
		-F "summary=" \
		-F "title=frame.nav" \
		-F "whose=Qinka" \
		-F "tag=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.frame/nav
frame.nav.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.frame/nav

frame.top: .frame/top.html
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=frame" \
		-F "create-time=2017-08-11 12:18:13.582322 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@.frame/top.html" \
		-F "summary=" \
		-F "title=frame.top" \
		-F "whose=Qinka" \
		-F "tag=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.frame/top
frame.top.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=frame" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/.frame/top

frame.license: LICENSE.real.md
	@pandoc -t html -o LICENSE.real.md.htmlout LICENSE.real.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-08-12 12:06:42.480649 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@LICENSE.real.md.htmlout" \
		-F "summary=" \
		-F "title=frame.license" \
		-F "whose=Qinka" \
		-F "tag=license" \
		-F "tag=License" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/license
frame.license.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/license
frame.license.fdl: LICENSE.md
	@pandoc -t html -o LICENSE.md.htmlout LICENSE.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-08-12 12:07:25.628312 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@LICENSE.md.htmlout" \
		-F "summary=" \
		-F "title=frame.license.fdl" \
		-F "whose=Qinka" \
		-F "tag=license" \
		-F "tag=GNU Free Documentation License" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/license/gnufdl
frame.license.fdl.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "token:${SITE_TOKEN}" \
		${SITE_URL}/license/gnufdl