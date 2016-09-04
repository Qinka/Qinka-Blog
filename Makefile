CURL_TOOL="curl "
SHELL=bash
DETAIL=' -i '
URL=http://localhost:3000
PSK=921 924
BG=bg
DTIME=0
IH=/Users/Qinka/Glob/.stack-work/install/x86_64-osx/nightly-2016-07-15/8.0.1/bin/glob-ih -m -f$(DTIME) -v # use new glob-ih >= 0.0.9.25
NOW=$$(/Users/Qinka/Glob/.stack-work/install/x86_64-osx/nightly-2016-07-15/8.0.1/bin/glob-ih -t -f$(DTIME))
CODE_STYLE=zenburn
TIMECHECKER=/Users/Qinka/Glob/.stack-work/install/x86_64-osx/nightly-2016-07-15/8.0.1/bin/glob-timecheck
NEWPOST=/Users/Qinka/Glob/.stack-work/install/x86_64-osx/nightly-2016-07-15/8.0.1/bin/glob-newpost

# single

########
# Example
###########################################################
#
#	@echo $(CURL_TOOL) $(DETAIL) ' -X METHED -F "PARAM" ' \
#				$(URL)/??' ' |$(IH) $(PSK) | $(SHELL)
#
###########################################################


checktime:
	@echo $(CURL_TOOL) ' -X POST -H "HOW:get" ' \
				$(URL)/q/servertime | $(SHELL) | $(TIMECHECKER)


## for frame
frame: frametop framebottom framenav framejs

frametop:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=frame" ' \
				' -F "update-time=$(NOW)"  -F "create-time=2016-01-01 00:00:00 UTC" ' \
				'-F "html=@html/top.html" -F "title=top of frame"' \
				$(URL)/'~@123top' ' ' |$(IH) $(PSK) | $(SHELL)
framebottom::
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=frame" ' \
				' -F "update-time=$(NOW)"  -F "create-time=2016-01-01 00:00:00 UTC" ' \
				'-F "html=@html/bottom.html" -F "title=bottom of frame"' \
				$(URL)/'~@123bottom' ' ' |$(IH) $(PSK) | $(SHELL)
framenav::
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=frame" ' \
				' -F "update-time=$(NOW)"  -F "create-time=2016-01-01 00:00:00 UTC" ' \
				'-F "html=@html/nav.html" -F "title=nav of frame"' \
				$(URL)/'~@123nav' ' ' |$(IH) $(PSK) | $(SHELL)

framejs:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=text" -F "title=js off frame"' \
				' -F "update-time=$(NOW)"  -F "create-time=2016-01-01 00:00:00 UTC" ' \
				' -F "mime=application/x-javascript" -F "text=@resource/javascript/frame.js" ' \
				$(URL)/r/frame.js ' ' |$(IH) $(PSK) | $(SHELL)


hightlight:
	@echo update "$(CODE_STYLE).css"
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=text/css" -F "text=@resource/highlight/styles/$(CODE_STYLE).css" ' \
				$(URL)/r/highlight/css ' ' | $(IH) $(PSK) | $(SHELL)
	@echo
	@echo update hightlight.js
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=application/x-javascript" ' \
				'-F "text=@resource/highlight/highlight.pack.js" ' \
				$(URL)/r/highlight/js ' ' | $(IH) $(PSK) | $(SHELL)



# for nav
nav:
	@echo $(CURL_TOOL) $(DETAIL) ' -X POST -H "HOW:del"' \
					$(URL)/n' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X POST -H "HOW:put" -F "label=HOME" ' \
					' -F "url=/" -F "order=1" ' \
					$(URL)/n' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X POST -H "HOW:put" -F "label=BLOG" ' \
					' -F "url=/blog" -F "order=2" ' \
					$(URL)/n' ' |$(IH) $(PSK) | $(SHELL)

# for Home Page
homeP:
	@pandoc -o .ignore/home.html -f Markdown -t HTML markdown/home.md
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "html=@.ignore/home.html" -F "type=post"' \
					' -F "title=Home"  -F "update-time=$(NOW)" '\
					 '-F "create-time=2016-01-01 00:00:00 UTC" '\
					$(URL)/ ' ' |$(IH) $(PSK) | $(SHELL)

# for Blog page
blogP:
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "html=@html/blog.html" -F "type=post"' \
					' -F "title=Blog" -F "update-time=$(NOW)" '\
					' -F "create-time=2016-01-01 00:00:00 UTC" ' \
					$(URL)/blog ' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=text" ' \
				' -F "mime=application/x-javascript" -F "text=@resource/javascript/blog.js" ' \
				' -F "title=the js of blog" -F "update-time=$(NOW)" '\
				' -F "create-time=2016-01-01 00:00:00 UTC" ' \
				$(URL)/blog/js ' ' |$(IH) $(PSK) | $(SHELL)




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
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=post" ' \
				' -F "html=@.ignore/testblog.html" ' \
				' -F "title=TestBlog" -F "create-time=2016-08-01 00:00:00 UTC" ' \
				' -F "update-time=$(NOW)" -F "tags=test blog" ' \
				$(URL)/b/blog1 ' ' |$(IH) $(PSK) | $(SHELL)


sumo: sumo1

sumo1:
	@pandoc -o .ignore/sumo.sum.html tex/sumo.sum.tex --mathml
	@pandoc -o .ignore/sumo.html tex/sumo.tex --mathml
	@./append.code.sh .ignore/sumo.html
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=blog" -F "author=Qinka" ' \
				' -F "html=@.ignore/sumo.html" -F "summary=@.ignore/sumo.sum.html" ' \
				' -F "title=数模1" -F "create-time=2016-08-03 15:00:00 UTC" ' \
				' -F "update-time=$(NOW)" -F "tag=sumo" -F "tag=matlab"' \
				$(URL)/b/sumo/1 ' ' |$(IH) $(PSK) | $(SHELL)


sumo0813sumTaxi: lhs/sumtaxi.ignore.docx
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=binary" ' \
				' -F "mime=application/vnd.openxmlformats-officedocument.wordprocessingml.template" ' \
				'-F "binary=@lhs/sumtaxi.ignore.docx" ' \
				$(URL)/r/doc/sumtaxi.docx ' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=text/literate-haskell" -F "text=@lhs/sumTaxi.lhs" ' \
				$(URL)/r/lhs/sumTaxi.lhs' ' |$(IH) $(PSK) | $(SHELL)

lhs/sumtaxi.ignore.docx: lhs/sumTaxi.lhs
	@pandoc -o lhs/sumtaxi.ignore.docx lhs/sumTaxi.lhs --from latex+lhs --to docx


#################
## for 0.0.10.x
#################

blog-sv3-26026: markdown/sv3-openwrt.md markdown/sv3-openwrt.sum.md
	@pandoc -o .ignore/sv3-26026.html markdown/sv3-openwrt.md
	@pandoc -o .ignore/sv3-26026.sum.html markdown/sv3-openwrt.sum.md
	@$(NEWPOST) "sv3-26026 and OpenWRT" '/blog/sv3-26026-openwrt' \
		-t'sv3-26026' -t'openwrt' -t'embedded' -t'linux' -t'填坑' \
		-v --diff="$(DTIME)" \
		--html='.ignore/sv3-26026.html' \
		--summary='.ignore/sv3-26026.sum.html'
