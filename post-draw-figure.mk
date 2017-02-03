py-draw-lib: post/draw-figure/py-draw-lib.tex  post/draw-figure/py-draw-lib.sum.tex
	@pandoc -o .ignore/py-draw-lib.html post/draw-figure/py-draw-lib.tex
	@pandoc -o .ignore/py-draw-lib.sum.html post/draw-figure/py-draw-lib.sum.tex
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-01-20 00:14:46.091797 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Python Draw Libraries" ' \
		' -F "html=@.ignore/py-draw-lib.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/py-draw-lib.sum.html" ' \
		' -F "whose=post/draw-figure/py-draw-lib.tex" ' \
		' -F "tag=code" ' \
		' -F "tag=python" ' \
		' -F "tag=blog" ' \
		 $(SITE_URL)/b/py/draw/libraries  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

py-draw-lib.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		 $(SITE_URL)/b/py/draw/libraries  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)


