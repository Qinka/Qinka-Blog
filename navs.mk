navs:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X DELETE '  \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		$(SITE_URL)/@/@nav ' ' |  $(IH_PATH) -m -f$(IH_DELAY)  -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "label=^H HOME" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "url=/" -F "order=1" ' \
		$(SITE_URL)/@/@nav ' ' | $(IH_PATH) -m -f$(IH_DELAY) -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL) ' -X PUT -F "label=^B BLOG" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "url=/blog" -F "order=2" ' \
		$(SITE_URL)/@/@nav ' ' |  $(IH_PATH) -m -f$(IH_DELAY) -p '$(PRIVATE_KEY)' -d '$(SITE_DETAL)' -v | $(SHELL)
