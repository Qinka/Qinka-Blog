URL=$(GLOB_URL)
PSK=$(GLOB_BACKGROUND_TOKEN)
TIME=0
SHELL=bash
BG=background

update: html txt bin qry
	@echo "update all"


html: blog page home
	@echo "update html"

blog: blg-yesod english setupos xhsk-rp
	@echo "update blog"

blg-yesod: getstart
	@echo "update yesod blog"
getstart:
	@echo 'curl -F "type=blog" -F "index=blog" -F "index=yesod" ' \
		' -F "index=getstart" -F "title=Yesod 学习笔记-1" ' \
		' -F "html=@blog/Yesod/GetStart.html" -F "summary=@blog/Yesod/GetStart.summary.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update blg-yesod-GetStart"

setupos: InstallOS
InstallOS:
	@echo 'curl -F "type=blog" -F "index=blog" -F "index=setupos" ' \
		' -F "index=installdockeros" -F "title= 安装 Docker OS" ' \
		' -F "html=@blog/SetupOS/IDOS.html" -F "summary=@blog/SetupOS/IDOS.summary.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update blg-setupos-installboot2docker2disk"

english:
rtof:
	@echo 'curl -F "type=blog" -F "index=blog" -F "index=english" -F "idnex=rtof" \
		-F "title=Reaction of THE TAIL OF FAME" \
		-F "html=@blog/english/RToF.html" -F "summary=@blog/english/RToF.summary.html" '\
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update RToF"

blg-test: blgtest1 blgtest2
	@echo "blog-test update"
blgtest1:
	@echo 'curl -F "type=blog" -F "index=blog" -F "index=test1" -F "title=Test-Blog-1" \
		-F "html=@blog/test/test1.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
blgtest2:
	@echo 'curl -F "type=blog" -F "index=blog" -F "index=test2" -F "title=Test-Blog-2" \
		-F "html=@blog/test/test2.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)


xhsk-rp: xhsk-rp-haskell xhsk-rp-docker xhsk-rp-ci xhsk-rp-codeclimate
	@echo "update xhsk-rp"
xhsk-rp-haskell:
	@echo 'curl -F "type=blog" -F "index=blog" -F "index=xhsk-rp" -F "index=haskell" ' \
		' -F "title=Haskell" -F "html=@blog/xhsk/Haskell.html" -F "summary=@blog/xhsk/Haskell.summary.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update xhsk-rp-haskell"
xhsk-rp-docker:
	@echo 'curl -F "type=blog" -F "index=blog" -F "index=xhsk-rp" -F "index=docker" ' \
		' -F "title=Docker" -F "html=@blog/xhsk/Docker.html" -F "summary=@blog/xhsk/Docker.summary.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update xhsk-rp-docker"
xhsk-rp-ci:
	@echo 'curl -F "type=blog" -F "index=blog" -F "index=xhsk-rp" -F "index=ci" ' \
		' -F "title=CI" -F "html=@blog/xhsk/CI.html" -F "summary=@blog/xhsk/CI.summary.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update xhsk-rp-ci"
xhsk-rp-codeclimate:
	@echo 'curl -F "type=blog" -F "index=blog" -F "index=xhsk-rp" -F "index=codeclimate" ' \
		' -F "title=CodeClimate" -F "html=@blog/xhsk/CodeClimate.html" -F "summary=@blog/xhsk/CodeClimate.summary.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update xhsk-rp-codeclimate"

page: pageGlob pageLicense
	@echo "update page"
pageGlob: page/Glob.html
	@cat page/Glob.html > tmp/page.glob.html
	@echo 'curl -F "type=page" -F "index=page" -F "index=glob" -F "title=GLob" ' \
		' -F "html=@tmp/page.glob.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update page/Glob.html"
pageLicense:
	@echo 'curl -F "type=page" -F "index=page" -F "index=LICENSE" -F "title=License" ' \
		' -F "html=@page/LICENSE.html" '  \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)

home: topH navH bottomH mainH blogH
	@echo "update home"
topH: top.html
	@cat top.html > tmp/home.top.html
	@echo 'curl -F "type=home" -F "index=home" -F "index=page" -F "index=frame" ' \
		' -F "index=top" -F "title=top" -F "html=@tmp/home.top.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update top.html"
navH: nav.html
	@cat nav.html > tmp/home.nav.html
	@echo 'curl -F "type=home" -F "index=home" -F "index=page" -F "index=frame" ' \
		' -F "index=nav" -F "title=nav" -F "html=@tmp/home.nav.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update nav.html"
bottomH: bottom.html
	@cat bottom.html > tmp/home.bottom.html
	@echo 'curl -F "type=home" -F "index=home" -F "index=page" -F "index=frame" ' \
		' -F "index=bottom" -F "title=bottom" -F "html=@tmp/home.bottom.html" ' \
		$(URL)/$(BG)/html| ih $(TIME) $(PSK) | $(SHELL)
	@echo "update bottom.html"
mainH: home.html
	@cat home.html > tmp/home.home.html
	@echo 'curl -F "type=home" -F "index=home" -F "index=page" -F "index=main" ' \
		' -F "title=Home" -F "html=@tmp/home.home.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update home.html"
blogH: blog.html
	@cat blog.html > tmp/home.blog.html
	@echo 'curl -F "type=home" -F "index=home" -F "index=page" -F "index=blog" ' \
		' -F "title=Blog" -F "html=@tmp/home.blog.html" ' \
		$(URL)/$(BG)/html | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update blog.html"

txt: css js src
	@echo "update txt"

css: frameC zenburnC
	@echo "update css"
frameC: css.frame.css
	@java -jar yuicompressor.jar --type css --charset utf-8 css.frame.css> tmp/txt.frame.css
	@echo 'curl -F "type=text/css" -F "index=css" -F "index=frame.css" ' \
		' -F "txt=@tmp/txt.frame.css" ' \
		$(URL)/$(BG)/txt | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update css.frame.css"
zenburnC: zenburn.css
	@java -jar yuicompressor.jar --type css --charset utf8 zenburn.css > tmp/txt.zenburn.css
	@echo 'curl -F "type=text/css" -F "index=css" -F "index=zenburn.css" ' \
		' -F "txt=@tmp/txt.zenburn.css" ' \
		$(URL)/$(BG)/txt | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update zenburn.css"

js: navJ blogJ hlJ
	@echo "update js"
navJ: nav.js
	@java -jar yuicompressor.jar --type js --charset utf-8 nav.js > tmp/txt.nav.js
	@echo 'curl -F "type=application/x-javascript" -F "index=nav.js" ' \
		' -F "txt=@tmp/txt.nav.js" ' \
		$(URL)/$(BG)/txt | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update nav.js"
blogJ:blog.js
	@java -jar yuicompressor.jar --type js --charset utf-8 blog.js > tmp/txt.blog.js
	@echo 'curl -F "type=application/x-javascript" -F "index=blog.js" ' \
		' -F "txt=@tmp/txt.blog.js" ' \
		$(URL)/$(BG)/txt | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update blog.js"
hlJ:
	@echo 'curl -F "type=application/x-javascript" -F "index=javascript" ' \
		-F "index=highlight.js" -F "txt=@highlight.pack.js" ' \
		' $(URL)/$(BG)/txt | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update highlight.pack.js"

src:
	@echo "update source"

bin: qinka.logo image
	@echo "update bin"
qinka.logo:
	@echo 'curl -F "type=image/png" -F "index=qinka.logo" ' \
		' -F "bin=@bin/logo.png" '  \
		$(URL)/$(BG)/bin | ih $(TIME) $(PSK) | $(SHELL)

image: latex glob-bishop fork-me
	@echo "update image"
latex:
	@echo 'curl -F "type=image/svg+xml" -F "index=image" -F "index=LaTeX-logo.svg" ' \
		' -F "bin=@bin/image/LaTeX-logo.svg" ' \
		$(URL)/$(BG)/bin | ih $(TIME) $(PSK) | $(SHELL)
	@echo 'curl -F "type=image/svg+xml" -F "index=image" -F "index=TeX-logo.svg" ' \
		' -F "bin=@bin/image/TeX-logo.svg" ' \
		$(URL)/$(BG)/bin | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update LaTeX and TeX logo"
faviconI:
	@echo 'curl -F "index=favicon.ico" -F "type=image/x-ico" ' \
		' -F "file=@bin/icon/favicon.ico" ' \
		$(URL)/$(BG)/static | ih $(TIME) $(PSK) | $(SHELL)
glob-bishop:
	@echo 'curl -F "type=image/png" -F "index=glob-bishop-mk1.png" ' \
		' -F "bin=@bin/image/Glob-Bishop-mk1.png" ' \
		$(URL)/$(BG)/bin | ih $(TIME) $(PSK) | $(SHELL)
fork-me:
	@echo 'curl -F "type=image/png" -F "index=fork.me.png" ' \
		' -F "bin=@fork.me.png" ' \
		$(URL)/$(BG)/bin | ih $(TIME) $(PSK) | $(SHELL)



nav:
	@echo 'curl -d "label=Home" -d "order=0" -d "ref=/" ' \
		$(URL)/$(BG)/nav | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update nav Home"
	@echo 'curl -d "label=Blog" -d "order=1" -d "ref=/blog" ' \
		$(URL)/$(BG)/nav | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update nav Blog"
	@echo 'curl -d "label=Glob" -d "order=2" -d "ref=/page/glob" ' \
		$(URL)/$(BG)/nav | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update nav Glob(page)"
	@echo 'curl -d "label=LICNESE" -d "order=100000" -d "ref=/page/LICENSE" ' \
		$(URL)/$(BG)/nav | ih $(TIME) $(PSK) | $(SHELL)
	@echo "update nav License(page)"
	@echo "update nav"


qry:
	@echo "update qry"

rootTxt:
	@echo 'curl -F "index=root.txt" -F "type=text/plain" ' \
		' -F "file=@root.txt" ' \
		$(URL)/$(BG)/static | ih $(TIME) $(PSK) | $(SHELL)
	@echo 'curl -F "index=jd_root.txt" -F "type=text/plain" ' \
		' -F "file=@jd_root.txt" ' \
		$(URL)/$(BG)/static | ih $(TIME) $(PSK) | $(SHELL)

help:
	@echo "usage:  make URL=[url] TIME=[time(fix)] PSK=[password]"
	@echo ""

list:
	@echo 'curl -F "type=html" ' \
		$(URL)/$(BG)/list | ih $(TIME) $(PSK) | $(SHELL)

sqltest:
	@curl https://raw.githubusercontent.com/Qinka/Glob/master/database/function.sql \
		> tmp/function.sql
	@echo "SELECT drop_all_table('qinka','public');" > tmp/script2.sql
	@curl https://raw.githubusercontent.com/Qinka/Glob/master/database/table.sql > \
		tmp/table.sql
	@echo 'curl -F "sql=@tmp/function.sql" ' \
		$(URL)/$(BG)/sql | ih $(TIME) $(PSK) | $(SHELL)
	@echo ""
	@echo 'curl -F "sql=@tmp/script2.sql" -F "raw-way=raw-sql"' \
		$(URL)/$(BG)/sql | ih $(TIME) $(PSK) | $(SHELL)
	@echo ""
	@echo 'curl -F "sql=@tmp/table.sql" ' \
		$(URL)/$(BG)/sql | ih $(TIME) $(PSK) | $(SHELL)

drop:
	@echo "SELECT drop_all_table('postgres','public');" > tmp/script2.sql
	@echo 'curl -F "sql=@tmp/script2.sql" -F "raw-way=raw-sql"' \
		$(URL)/$(BG)/raw | ih $(TIME) $(PSK) | $(SHELL)

upTable: tmp/table.sql
	@echo 'curl -F "sql=@tmp/table.sql" ' \
		$(URL)/$(BG)/raw | ih $(TIME) $(PSK) | $(SHELL)

tmp/table.sql:
		@curl https://raw.githubusercontent.com/Qinka/Glob/master/database/table.sql > tmp/table.sql
