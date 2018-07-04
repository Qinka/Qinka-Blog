
adder-dc.fpga.es.img: img/embedded/fpga/adder-dc.JPG
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-19 10:34:29.89566 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/embedded/fpga/adder-dc.JPG" \
		-F "summary=" \
		-F "title=adder-dc.fpga.es.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/adder-dc.JPG
adder-dc.fpga.es.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/adder-dc.JPG
big-little.3519.embedded.post: post/embedded/3519-BIG.LITTLE.md post/embedded/3519-BIG.LITTLE.sum.md
	@pandoc -t html -o post/embedded/3519-BIG.LITTLE.sum.md.htmlout post/embedded/3519-BIG.LITTLE.sum.md
	@pandoc -t html -o post/embedded/3519-BIG.LITTLE.md.htmlout post/embedded/3519-BIG.LITTLE.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-05-25 09:25:45.672619 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/3519-BIG.LITTLE.md.htmlout" \
		-F "summary=@post/embedded/3519-BIG.LITTLE.sum.md.htmlout" \
		-F "title=Linux 大小核 独占" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=hi3519" \
		-F "tag=3519" \
		-F "tag=big.LITTLE" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/3519/big.LITTLE/cpu_affinity
big-little.3519.embedded.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/3519/big.LITTLE/cpu_affinity
ct-ng.es.post: post/embedded/cross-compile-tools-build.md post/embedded/cross-compile-tools-build.sum.md
	@pandoc -t html -o post/embedded/cross-compile-tools-build.sum.md.htmlout post/embedded/cross-compile-tools-build.sum.md
	@pandoc -t html -o post/embedded/cross-compile-tools-build.md.htmlout post/embedded/cross-compile-tools-build.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-06-19 09:22:45.337307 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/cross-compile-tools-build.md.htmlout" \
		-F "summary=@post/embedded/cross-compile-tools-build.sum.md.htmlout" \
		-F "title=构建交叉工具" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=embedded" \
		-F "tag=Crosstool-NG" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/ct-ng
ct-ng.es.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/ct-ng
full-adder-dc.fpga.es.img: img/embedded/fpga/full-adder-dc.jpg
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-19 10:34:37.435899 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/embedded/fpga/full-adder-dc.jpg" \
		-F "summary=" \
		-F "title=full-adder-dc.fpga.es.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/full-adder-dc.jpg
full-adder-dc.fpga.es.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/full-adder-dc.jpg
get-started.fpga.es.post: post/embedded/fpga/get-started.md post/embedded/fpga/get-started.sum.md
	@pandoc -t html -o post/embedded/fpga/get-started.sum.md.htmlout post/embedded/fpga/get-started.sum.md
	@pandoc -t html -o post/embedded/fpga/get-started.md.htmlout post/embedded/fpga/get-started.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-06-19 10:11:47.622628 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/fpga/get-started.md.htmlout" \
		-F "summary=@post/embedded/fpga/get-started.sum.md.htmlout" \
		-F "title=get-started.fpga.es.post" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=embedded" \
		-F "tag=FPGA" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/fpga/nexys3/get-started
get-started.fpga.es.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/fpga/nexys3/get-started
half-adder-dc.fpga.es.img: img/embedded/fpga/half-adder-dc.jpg
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-19 10:34:37.457996 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/embedded/fpga/half-adder-dc.jpg" \
		-F "summary=" \
		-F "title=half-adder-dc.fpga.es.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/half-adder-dc.jpg
half-adder-dc.fpga.es.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/half-adder-dc.jpg
io-ports.fpga.es.img: img/embedded/fpga/io-ports.JPG
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-19 10:34:29.918 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/embedded/fpga/io-ports.JPG" \
		-F "summary=" \
		-F "title=io-ports.fpga.es.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/io-ports.JPG
io-ports.fpga.es.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/io-ports.JPG
nexys-3-1.fpga.es.img: img/embedded/fpga/nexys-3-1.jpg
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-19 10:34:37.476909 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/embedded/fpga/nexys-3-1.jpg" \
		-F "summary=" \
		-F "title=nexys-3-1.fpga.es.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/nexys-3-1.jpg
nexys-3-1.fpga.es.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/nexys-3-1.jpg
nexys-3-2.fpga.es.img: img/embedded/fpga/nexys-3-2.jpg
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-19 10:34:37.496369 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/embedded/fpga/nexys-3-2.jpg" \
		-F "summary=" \
		-F "title=nexys-3-2.fpga.es.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/nexys-3-2.jpg
nexys-3-2.fpga.es.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/nexys-3-2.jpg
nexys-3-3.fpga.es.img: img/embedded/fpga/nexys-3-3.jpg
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-19 10:34:37.513798 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/embedded/fpga/nexys-3-3.jpg" \
		-F "summary=" \
		-F "title=nexys-3-3.fpga.es.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/nexys-3-3.jpg
nexys-3-3.fpga.es.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/nexys-3-3.jpg
openocd.stm32.es.post: post/embedded/stm32/OpenOCD-get-start.md post/embedded/stm32/OpenOCD-get-start.sum.md
	@pandoc -t html -o post/embedded/stm32/OpenOCD-get-start.sum.md.htmlout post/embedded/stm32/OpenOCD-get-start.sum.md
	@pandoc -t html -o post/embedded/stm32/OpenOCD-get-start.md.htmlout post/embedded/stm32/OpenOCD-get-start.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-07-04 10:06:47.243708 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/stm32/OpenOCD-get-start.md.htmlout" \
		-F "summary=@post/embedded/stm32/OpenOCD-get-start.sum.md.htmlout" \
		-F "title=使用 OpenOCD 调试 STM32F1 系列手册" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=embedded" \
		-F "tag=OpenOCD" \
		-F "tag=STM32" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/openocd/get-start
openocd.stm32.es.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/openocd/get-start
os-learn.es.post: post/embedded/os-learning/build-kernel-4.8.4.md post/embedded/os-learning/build-kernel-4.8.4.sum.md
	@pandoc -t html -o post/embedded/os-learning/build-kernel-4.8.4.sum.md.htmlout post/embedded/os-learning/build-kernel-4.8.4.sum.md
	@pandoc -t html -o post/embedded/os-learning/build-kernel-4.8.4.md.htmlout post/embedded/os-learning/build-kernel-4.8.4.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2018-06-19 09:45:07.947961 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/os-learning/build-kernel-4.8.4.md.htmlout" \
		-F "summary=@post/embedded/os-learning/build-kernel-4.8.4.sum.md.htmlout" \
		-F "title=Linux 4.8.4 内核编译并安装到 Ubuntu 16.04 上" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=embeddbed" \
		-F "tag=Linux Kernel" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/os-learning
os-learn.es.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/os-learning
show.fpga.es.img: img/embedded/fpga/show.jpg
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-06-19 10:34:37.530513 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/embedded/fpga/show.jpg" \
		-F "summary=" \
		-F "title=show.fpga.es.img" \
		-F "whose=Qinka" \
		-F "mime=image/jpeg" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/show.jpg
show.fpga.es.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/fpga/show.jpg
stm32.env.setup.es.post: post/embedded/stm32/enviroments/setting.md post/embedded/stm32/enviroments/setting-sum.md
	@pandoc -t html -o post/embedded/stm32/enviroments/setting-sum.md.htmlout post/embedded/stm32/enviroments/setting-sum.md
	@pandoc -t html -o post/embedded/stm32/enviroments/setting.md.htmlout post/embedded/stm32/enviroments/setting.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-09-04 16:00:10.8431427 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/stm32/enviroments/setting.md.htmlout" \
		-F "summary=@post/embedded/stm32/enviroments/setting-sum.md.htmlout" \
		-F "title=Install STM32 Development Environment" \
		-F "whose=Qinka" \
		-F "tag=stm32" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=arm-gcc" \
		-F "tag=code" \
		-F "tag=highlight" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/env/setup
stm32.env.setup.es.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/env/setup
stm32.get.started.es.post: post/embedded/stm32/get-started.md post/embedded/stm32/get-started-sum.md
	@pandoc -t html -o post/embedded/stm32/get-started-sum.md.htmlout post/embedded/stm32/get-started-sum.md
	@pandoc -t html -o post/embedded/stm32/get-started.md.htmlout post/embedded/stm32/get-started.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-09-05 03:06:10.37847628 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/stm32/get-started.md.htmlout" \
		-F "summary=@post/embedded/stm32/get-started-sum.md.htmlout" \
		-F "title=STM32F103 Get Started" \
		-F "whose=Qinka" \
		-F "tag=post" \
		-F "tag=blog" \
		-F "tag=code" \
		-F "tag=highlight" \
		-F "tag=stm32" \
		-F "tag=stm32f103" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/get-started
stm32.get.started.es.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/get-started
stm32.note.1.es.post: post/embedded/stm32/note1.md post/embedded/stm32/note1-sum.md
	@pandoc -t html -o post/embedded/stm32/note1-sum.md.htmlout post/embedded/stm32/note1-sum.md
	@pandoc -t html -o post/embedded/stm32/note1.md.htmlout post/embedded/stm32/note1.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-09-07 12:09:18.645531 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/stm32/note1.md.htmlout" \
		-F "summary=@post/embedded/stm32/note1-sum.md.htmlout" \
		-F "title=Note 1 -- GPIO and Interrupt" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=stm32" \
		-F "tag=stm32f103zet" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/note/1
stm32.note.1.es.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/note/1
stm32.note.2.es.post: post/embedded/stm32/note2.md post/embedded/stm32/note2-sum.md
	@pandoc -t html -o post/embedded/stm32/note2-sum.md.htmlout post/embedded/stm32/note2-sum.md
	@pandoc -t html -o post/embedded/stm32/note2.md.htmlout post/embedded/stm32/note2.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-10-03 11:20:34.705365 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/stm32/note2.md.htmlout" \
		-F "summary=@post/embedded/stm32/note2-sum.md.htmlout" \
		-F "title=Note 2 -- Timer and Interrupt" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=stm32" \
		-F "tag=stm32f103zet" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/note/2
stm32.note.2.es.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/stm32/note/2
transplant.ucosii.es.post: post/embedded/ucosii/transplant.md post/embedded/ucosii/transplant-sum.md
	@pandoc -t html -o post/embedded/ucosii/transplant-sum.md.htmlout post/embedded/ucosii/transplant-sum.md
	@pandoc -t html -o post/embedded/ucosii/transplant.md.htmlout post/embedded/ucosii/transplant.md
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=post" \
		-F "create-time=2017-12-05 12:00:52.923056 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "html=@post/embedded/ucosii/transplant.md.htmlout" \
		-F "summary=@post/embedded/ucosii/transplant-sum.md.htmlout" \
		-F "title=Transplant uC/OS II to STM32F103ZET6 with GNU Toolchains" \
		-F "whose=Qinka" \
		-F "tag=blog" \
		-F "tag=post" \
		-F "tag=ucosii" \
		-F "tag=stm32" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/ucosii/transplant
transplant.ucosii.es.post.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=post" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/b/embedded/ucosii/transplant
openocd-putty.stm32.embedded.img: img/embedded/stm32/openocd-putty-telnet.png
	@${CURL_PATH} ${CURL_DETAIL}  \
		-X PUT \
		-F "type=binary" \
		-F "create-time=2018-07-04 10:21:54.739364 UTC" \
		-F "update-time=${NOW_TIME}" \
		-F "binary=@img/embedded/stm32/openocd-putty-telnet.png" \
		-F "summary=" \
		-F "title=openocd-putty.stm32.embedded.img" \
		-F "mime=image/png" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/stm32/openocd-putty-telnet.png
openocd-putty.stm32.embedded.img.del:
	${CURL_PATH} ${CURL_DETAIL}  \
		-X DELETE \
		-F "type=binary" \
		-H "Authorization:${SITE_TOKEN}" \
		${SITE_URL}/img/embedded/stm32/openocd-putty-telnet.png