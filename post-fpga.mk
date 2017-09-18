fpga.adder-dc.JPG.imgadder-dc.JPG: img/fpga/adder-dc.JPG 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-03-13 14:24:46.9209599 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Adder DC" ' \
		' -F "binary=@img/fpga/adder-dc.JPG" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=FPGA" ' \
		' -F "tag=Get Start" ' \
		 $(SITE_URL)/img/fpga/adder-dc.JPG  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

fpga.adder-dc.JPG.imgadder-dc.JPG.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/fpga/adder-dc.JPG  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


fpga.full-adder-dc.jpg.imgfull-adder-dc.jpg: img/fpga/full-adder-dc.jpg 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-03-13 14:24:48.5283832 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Full Adder DC" ' \
		' -F "binary=@img/fpga/full-adder-dc.jpg" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=FPGA" ' \
		' -F "tag=Get Start" ' \
		 $(SITE_URL)/img/fpga/full-adder-dc.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

fpga.full-adder-dc.jpg.imgfull-adder-dc.jpg.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/fpga/full-adder-dc.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


fpga.half-adder-dc.jpg.imghalf-adder-dc.jpg: img/fpga/half-adder-dc.jpg 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-03-13 14:24:49.4915776 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Half Adder " ' \
		' -F "binary=@img/fpga/half-adder-dc.jpg" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=FPGA" ' \
		' -F "tag=Get Start" ' \
		 $(SITE_URL)/img/fpga/half-adder-dc.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

fpga.half-adder-dc.jpg.imghalf-adder-dc.jpg.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/fpga/half-adder-dc.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


fpga.io-ports.JPG.imgio-ports.JPG: img/fpga/io-ports.JPG 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-03-13 14:24:53.0709446 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=I/O Ports" ' \
		' -F "binary=@img/fpga/io-ports.JPG" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=FPGA" ' \
		' -F "tag=Get Start" ' \
		 $(SITE_URL)/img/fpga/io-ports.JPG  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

fpga.io-ports.JPG.imgio-ports.JPG.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/fpga/io-ports.JPG  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


fpga.nexys-3-1.jpg.imgnexys-3-1.jpg: img/fpga/nexys-3-1.jpg 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-03-13 14:24:58.5745017 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Nexys 3 (1)" ' \
		' -F "binary=@img/fpga/nexys-3-1.jpg" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=FPGA" ' \
		' -F "tag=Get Start" ' \
		 $(SITE_URL)/img/fpga/nexys-3-1.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

fpga.nexys-3-1.jpg.imgnexys-3-1.jpg.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/fpga/nexys-3-1.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


fpga.nexys-3-2.jpg.imgnexys-3-2.jpg: img/fpga/nexys-3-2.jpg 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-03-13 14:25:00.0904661 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Nexys 3 (2)" ' \
		' -F "binary=@img/fpga/nexys-3-2.jpg" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=FPGA" ' \
		' -F "tag=Get Start" ' \
		 $(SITE_URL)/img/fpga/nexys-3-2.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

fpga.nexys-3-2.jpg.imgnexys-3-2.jpg.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/fpga/nexys-3-2.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


fpga.nexys-3-3.jpg.imgnexys-3-3.jpg: img/fpga/nexys-3-3.jpg 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-03-13 14:25:01.0945786 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Nexys 3 (3)" ' \
		' -F "binary=@img/fpga/nexys-3-3.jpg" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=FPGA" ' \
		' -F "tag=Get Start" ' \
		 $(SITE_URL)/img/fpga/nexys-3-3.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

fpga.nexys-3-3.jpg.imgnexys-3-3.jpg.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/fpga/nexys-3-3.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


fpga.show.jpg.imgshow.jpg: img/fpga/show.jpg 
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=binary" ' \
		' -F "create-time=2017-03-13 14:25:02.0485404 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=FPGA Show" ' \
		' -F "binary=@img/fpga/show.jpg" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=FPGA" ' \
		' -F "tag=Get Start" ' \
		 $(SITE_URL)/img/fpga/show.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

fpga.show.jpg.imgshow.jpg.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=binary" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/img/fpga/show.jpg  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


get.start.fpga.post: post/fpga/get-started.md  post/fpga/get-started.sum.md
	@pandoc -o .ignore/get-started.html post/fpga/get-started.md
	@pandoc -o .ignore/get-started.sum.html post/fpga/get-started.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-03-06 15:09:27.0651784 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Getting Started with Nexys3" ' \
		' -F "html=@.ignore/get-started.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/get-started.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=blog" ' \
		' -F "tag=code" ' \
		' -F "tag=highlight" ' \
		 $(SITE_URL)/b/fpga/get-start  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

get.start.fpga.post.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/fpga/get-start  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


