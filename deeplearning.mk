tensorflow-install-unix: post/tensorflow/install/unix.md  post/tensorflow/install/unix.sum.md
	@pandoc -o .ignore/unix.html post/tensorflow/install/unix.md
	@pandoc -o .ignore/unix.sum.html post/tensorflow/install/unix.sum.md
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X PUT  \
		' -F "type=post" ' \
		' -F "create-time=2017-07-16 08:43:20.630857 UTC" ' \
		' -F "update-time=$(IH_NOW)" ' \
		' -F "title=Install Haskell Binding of TensorFlow on *nix" ' \
		' -F "html=@.ignore/unix.html" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		' -F "summary=@.ignore/unix.sum.html" ' \
		' -F "whose=Qinka" ' \
		' -F "tag=deeplearning" ' \
		' -F "tag=tensorflow" ' \
		' -F "tag=install" ' \
		' -F "tag=Haskell" ' \
		' -F "tag=blog" ' \
		 $(SITE_URL)/b/deeplearning/tensorflow/install/unix  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)

tensorflow-install-unix.del:
	@$(ECHO) $(CURL_PATH) $(CURL_DETAIL)  -X DELETE  \
		' -F "type=post" ' \
		' -F "sha-file-name=/`$(MD5) $(PRIVATE_KEY).pub`" ' \
		 $(SITE_URL)/b/deeplearning/tensorflow/install/unix  |  $(IH_PATH) -m  -f '$(IH_DELAY)' -p '$(PRIVATE_KEY)' -d '$(SITE_DELTA)' -v | $(SHELL)


