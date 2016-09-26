CURL_TOOL="curl "
SHELL=bash
DETAIL=' -i '
URL=http://localhost:3000
PSK=1024
BG=bg
DTIME=0
IH=glob-ih -m -f$(DTIME) -v # use new glob-ih >= 0.0.9.25
NOW=$$(glob-ih -t -f$(DTIME))
CODE_STYLE=zenburn

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
	@echo $(CURL_TOOL) $(DETAIL) ' -X DELETE' \
					$(URL)/n' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "label=HOME" ' \
					' -F "url=/" -F "order=1" ' \
					$(URL)/n' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "label=BLOG" ' \
					' -F "url=/p/blog" -F "order=2" ' \
					$(URL)/n' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "label=TAGS" ' \
					' -F "url=/p/tags" -F "order=3" ' \
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

tagP:
	@pandoc -o .ignore/tags.html -f Markdown -t HTML markdown/tags.md
	@pandoc -o .ignore/tags.sum.html -f Markdown -t HTML markdown/tags.sum.md
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "html=@.ignore/tags.html" ' \
					' -F "summary=@.ignore/tags.sum.html" ' \
					' -F "title=Tags" -F "update-time=$(NOW)" '\
					' -F "create-time=2016-08-17 12:20:22.6418401 UTC" ' \
					$(URL)/p/tags ' ' |$(IH) $(PSK) | $(SHELL)


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


sumo: sumo1 sumoT greymodel

sumo1:
	@pandoc -o .ignore/sumo.sum.html tex/sumo.sum.tex --mathml
	@pandoc -o .ignore/sumo.html tex/sumo.tex --mathml
	@./append.code.sh .ignore/sumo.html
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=blog" -F "author=Qinka" ' \
				' -F "html=@.ignore/sumo.html" -F "summary=@.ignore/sumo.sum.html" ' \
				' -F "title=数模1" -F "create-time=2016-08-03 15:00:00 UTC" ' \
				' -F "update-time=$(NOW)" -F "tag=sumo" -F "tag=matlab"' \
				$(URL)/b/sumo/1 ' ' |$(IH) $(PSK) | $(SHELL)

sumo0813pdf: sumo0813 tex/20160813.pdf
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=binary" ' \
				' -F "mime=application/pdf" -F "binary=@tex/20160813.pdf" ' \
				$(URL)/r/pdf/20160813.pdf ' ' |$(IH) $(PSK) | $(SHELL)

tex/20160813.pdf: tex/20160813.tex
	@xelatex tex/20160813.tex

sumoT: sumo0813

sumo0813: sumo0813sumTaxi
	@cat tex/20160813.sum.tex | sed  '1 s/^/\\def\\pandoc{1}/' 
	@cat tex/20160813.tex | sed  '1 s/^/\\def\\pandoc{1}/' | pandoc -o .ignore/20160813.html -f latex -t html --mathml 
	@cat tex/20160813.sum.tex | sed  '1 s/^/\\def\\pandoc{1}/' | pandoc -o .ignore/20160813.sum.html -f latex -t html --mathml
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=blog" -F "author=Qinka" ' \
				' -F "html=@.ignore/20160813.html" ' \
				' -F "title=网约车" -F "create-time=2016-08-14 01:26:15.6555934 UTC" ' \
				' -F "summary=@.ignore/20160813.sum.html" '\
				' -F "update-time=$(NOW)" -F "tag=sumo" -F "tag=matlab" -F "tag=code" -F "tag=练习" ' \
				$(URL)/b/sumo/T/20160813 ' ' |$(IH) $(PSK) | $(SHELL)

sumo0813sumTaxi: .ignore/sumtaxi.docx lhs/sumTaxi.lhs
	@pandoc -o .ignore/sumtaxi.html lhs/sumtaxi.lhs --from latex+lhs --to html
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=binary" ' \
				' -F "mime=application/vnd.openxmlformats-officedocument.wordprocessingml.template" ' \
				' -F "binary=@.ignore/sumtaxi.docx" ' \
				$(URL)/r/doc/sumtaxi.docx ' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=text/literate-haskell" -F "text=@lhs/sumTaxi.lhs" ' \
				$(URL)/r/lhs/sumTaxi.lhs' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=blog" -F "author=Qinka" ' \
				' -F "html=@.ignore/sumtaxi.html" -F "title=车辆应答模拟"  ' \
				' -F "create-time=2016-08-17 08:47:45.1602758 UTC" -F "update-time=$(NOW)" ' \
				' -F "tags=sumo code haskell mc mcmc 练习" ' \
				$(URL)/b/sumo/20160813/code/sumtaxi ' ' |$(IH) $(PSK) | $(SHELL)

.ignore/sumtaxi.docx: lhs/sumTaxi.lhs
	@pandoc -o .ignore/sumtaxi.docx lhs/sumTaxi.lhs --from latex+lhs --to docx

greymodel: greymodel.source
	@pandoc -o .ignore/greymodel.html tex/greymodel.tex --from latex --to html --mathml
	@pandoc -o .ignore/greymodel.sum.html tex/greymodel.sum.tex --from latex --to html --mathml
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=blog" -F "author=Qinka" ' \
				' -F "html=@.ignore/greymodel.html" -F "title=GM(1,1)灰色预测代码" ' \
				' -F "summary=@.ignore/greymodel.sum.html" '\
				' -F "tags=sumo code matlab greymodel 练习" ' \
				' -F "create-time=2016-08-17 08:47:45.1602758 UTC" -F "update-time=$(NOW)" ' \
				$(URL)/b/sumo/greymodel ' ' |$(IH) $(PSK) | $(SHELL)

greymodel.source: source/matlab/basicgrey.m source/matlab/judge.m source/matlab/lcheck.m source/matlab/relations.m
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=text/matlab" -F "text=@source/matlab/basicgrey.m" ' \
				$(URL)/r/source/matlab/basicgrey.m' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=text/matlab" -F "text=@source/matlab/judge.m" ' \
				$(URL)/r/source/matlab/judge.m' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=text/matlab" -F "text=@source/matlab/lcheck.m" ' \
				$(URL)/r/source/matlab/lcheck.m' ' |$(IH) $(PSK) | $(SHELL)
	@echo $(CURL_TOOL) $(DETAIL) ' -X PUT -F "type=txt" ' \
				' -F "mime=text/matlab" -F "text=@source/matlab/relations.m" ' \
				$(URL)/r/source/matlab/relations.m' ' |$(IH) $(PSK) | $(SHELL)