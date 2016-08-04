CURL_TOOL="curl "
SHELL=bash
DETAIL=' -i '
URL=http://localhost:3000
PSK=1024
BG=bg
DTIME=0
# single

########
# Example
###########################################################
#
#	@echo $(CURL_TOOL) $(DETAIL) ' -X METHED -F "PARAM" ' \
#				$(URL)/??' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)
#
###########################################################




## for frame
frame: frametop framebottom framenav framejs

frametop:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=frame" ' \
	 			' -F "update-time=2016-07-25 00:00:00 UTC"  -F "html=@html/top.html" ' \
				$(URL)/$(BG)/frame/frame/top ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)
framebottom:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=frame" ' \
	 			' -F "update-time=2016-07-25 00:00:00 UTC"  -F "html=@html/bottom.html" ' \
				$(URL)/$(BG)/frame/frame/bottom ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)
framenav:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=frame" ' \
	 			' -F "update-time=2016-07-25 00:00:00 UTC"  -F "html=@html/nav.html" ' \
				$(URL)/$(BG)/frame/frame/nav ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)

framejs:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=application/x-javascript" -F "text=@resource/javascript/frame.js" ' \
	 			' -F "html=@html/top.html" ' \
				$(URL)/r/frame.js ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)





# for nav
nav:
	@echo $(CURL_TOOL) $(DETAIL) ' -X DELETE' \
					$(URL)/n' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "label=HOME" ' \
					' -F "url=/" -F "order=1" ' \
					$(URL)/n' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "label=BLOG" ' \
					' -F "url=/p/blog" -F "order=2" ' \
					$(URL)/n' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)

# for Home Page
homeP:
	@pandoc -o .ignore/home.html -f Markdown -t HTML markdown/home.md
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "html=@.ignore/home.html" ' \
					' -F "title=Home"  -F "update-time=2016-01-01 00:00:00 UTC" '\
					' -F "create-time=2016-01-01 00:00:00 UTC" ' \
					$(URL)/p/frame/home ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)

# for Blog page
blogP:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "html=@html/blog.html" ' \
					' -F "title=Blog" -F "update-time=2016-01-01 00:00:00 UTC" '\
					' -F "create-time=2016-01-01 00:00:00 UTC" ' \
					$(URL)/p/blog ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=application/x-javascript" -F "text=@resource/javascript/blog.js" ' \
				$(URL)/r/blog.js ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)




picTest:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=binary" ' \
					' -F "binary=@.ignore/a.png.txt" -F "mime=image/png" ' \
					$(URL)/r/a.png ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)

picTestB:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=binary" ' \
					' -F "binary=@.ignore/b.png" -F "mime=image/png" ' \
					$(URL)/r/b.png ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)


blogTestA:
	@pandoc -o .ignore/testblog.html -f markdown_github -t HTML markdown/testblog.md
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=blog" ' \
				' -F "html=@.ignore/testblog.html" -F "summary=@.ignore/home.summary.html" ' \
				' -F "title=TestBlog" -F "create-time=2016-08-01 00:00:00 UTC" ' \
				' -F "update-time=2016-08-01 00:00:00 UTC" ' \
				$(URL)/b/test/blog1 ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)


sumo: sumo1

sumo1:
	@pandoc -o .ignore/sumo.sum.html tex/sumo.sum.tex --mathml
	@pandoc -o .ignore/sumo.html tex/sumo.tex --mathml
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=blog" ' \
				' -F "html=@.ignore/sumo.html" -F "summary=@.ignore/sumo.sum.html" ' \
				' -F "title=数模1" -F "create-time=2016-08-03 15:00:00 UTC" ' \
				' -F "update-time=2016-08-03 15:00:00 UTC" ' \
				$(URL)/b/sumo/1 ' ' | glob-ih $(DTIME) $(PSK) | $(SHELL)
