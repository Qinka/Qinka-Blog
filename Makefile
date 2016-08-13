CURL_TOOL="curl "
SHELL=bash
DETAIL=' -i '
URL=http://localhost:3000
PSK=1024
BG=bg
DTIME=0
IH=glob-ih -m -f$(DTIME) -v # use new glob-ih >= 0.0.9.25
NOW=$$(glob-ih -t -f$(DTIME))
# single

########
# Example
###########################################################
#
#	@echo $(CURL_TOOL) $(DETAIL) ' -X METHED -F "PARAM" ' \
#				$(URL)/??' ' |$(IH) $(PSK) | $(SHELL)
#
###########################################################




## for frame
frame: frametop framebottom framenav framejs

frametop:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=frame" ' \
	 			' -F "update-time=$(NOW)"  -F "html=@html/top.html" ' \
				$(URL)/$(BG)/frame/frame/top ' ' |$(IH) $(PSK) | $(SHELL)
framebottom:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=frame" ' \
	 			' -F "update-time=$(NOW)"  -F "html=@html/bottom.html" ' \
				$(URL)/$(BG)/frame/frame/bottom ' ' |$(IH) $(PSK) | $(SHELL)
framenav:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=frame" ' \
	 			' -F "update-time=$(NOW)"  -F "html=@html/nav.html" ' \
				$(URL)/$(BG)/frame/frame/nav ' ' |$(IH) $(PSK) | $(SHELL)

framejs:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=application/x-javascript" -F "text=@resource/javascript/frame.js" ' \
	 			' -F "html=@html/top.html" ' \
				$(URL)/r/frame.js ' ' |$(IH) $(PSK) | $(SHELL)





# for nav
nav:
	@echo $(CURL_TOOL) $(DETAIL) ' -X DELETE' \
					$(URL)/n' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "label=HOME" ' \
					' -F "url=/" -F "order=1" ' \
					$(URL)/n' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "label=BLOG" ' \
					' -F "url=/p/blog" -F "order=2" ' \
					$(URL)/n' ' |$(IH) $(PSK) | $(SHELL)

# for Home Page
homeP:
	@pandoc -o .ignore/home.html -f Markdown -t HTML markdown/home.md
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "html=@.ignore/home.html" ' \
					' -F "title=Home"  -F "update-time=$(NOW)" '\
					' -F "create-time=2016-01-01 00:00:00 UTC" ' \
					$(URL)/p/frame/home ' ' |$(IH) $(PSK) | $(SHELL)

# for Blog page
blogP:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "html=@html/blog.html" ' \
					' -F "title=Blog" -F "update-time=$(NOW)" '\
					' -F "create-time=2016-01-01 00:00:00 UTC" ' \
					$(URL)/p/blog ' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=application/x-javascript" -F "text=@resource/javascript/blog.js" ' \
				$(URL)/r/blog.js ' ' |$(IH) $(PSK) | $(SHELL)




picTest:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=binary" ' \
					' -F "binary=@.ignore/a.png.txt" -F "mime=image/png" ' \
					$(URL)/r/a.png ' ' |$(IH)  $(PSK) | $(SHELL)

picTestB:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=binary" ' \
					' -F "binary=@.ignore/b.png" -F "mime=image/png" ' \
					$(URL)/r/b.png ' ' |$(IH) $(PSK) | $(SHELL)


blogTestA:
	@pandoc -o .ignore/testblog.html -f markdown_github -t HTML markdown/testblog.md
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=blog" ' \
				' -F "html=@.ignore/testblog.html" ' \
				' -F "title=TestBlog" -F "create-time=2016-08-01 00:00:00 UTC" ' \
				' -F "update-time=$(NOW)" -F "tag=test" ' \
				$(URL)/b/test/blog1 ' ' |$(IH) $(PSK) | $(SHELL)


sumo: sumo1

sumo1:
	@pandoc -o .ignore/sumo.sum.html tex/sumo.sum.tex --mathml
	@pandoc -o .ignore/sumo.html tex/sumo.tex --mathml
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=blog" -F "author=Qinka" ' \
				' -F "html=@.ignore/sumo.html" -F "summary=@.ignore/sumo.sum.html" ' \
				' -F "title=数模1" -F "create-time=2016-08-03 15:00:00 UTC" ' \
				' -F "update-time=$(NOW)" -F "tag=sumo" -F "tag=matlab"' \
				$(URL)/b/sumo/1 ' ' |$(IH) $(PSK) | $(SHELL)
