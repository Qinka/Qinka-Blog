URL=
PSK=
TIME=

update: html txt bin qry
	@echo "update all"


html: blog page home
	@echo "update html"

blog: 
	@echo "update blog"

page: pageGlob
	@echo "update page"
pageGlob: page/Glob.html
	@cat page/Glob.html > tmp/page.glob.html
	@echo 'curl -F "type=page" -F "index=glob" -F "title=GLob" -F "html=@tmp/page.glob.html" ' $(URL)/management/html | ./ih $(TIME) $(PSK) | bash
	@echo "update page/Glob.html"

home: topH navH bottomH mainH blogH
	@echo "update home"
topH: top.html
	@cat top.html > tmp/home.top.html
	@echo 'curl -F "type=home" -F "index=\$page.frame.top" -F "title=top" -F "html=@tmp/home.top.html" ' $(URL)/management/html | ./ih $(TIME) $(PSK) | bash
	@echo "update top.html"
navH: nav.html
	@cat nav.html > tmp/home.nav.html
	@echo 'curl -F "type=home" -F "index=\$page.frame.nav" -F "title=nav" -F "html=@tmp/home.nav.html" ' $(URL)/management/html | ./ih $(TIME) $(PSK) | bash
	@echo "update nav.html"
bottomH: bottom.html
	@cat bottom.html > tmp/home.bottom.html
	@echo 'curl -F "type=home" -F "index=\$page.frame.bottom" -F "title=bottom" -F "html=@tmp/home.bottom.html" ' $(URL)/management/html| ./ih $(TIME) $(PSK) | bash
	@echo "update bottom.html"
mainH: home.html
	@cat home.html > tmp/home.home.html
	@echo 'curl -F "type=home" -F "index=\$page.main" -F "title=Home" -F "html=@tmp/home.home.html" ' $(URL)/management/html | ./ih $(TIME) $(PSK) | bash
	@echo "update home.html"
blogH: blog.html
	@cat blog.html > tmp/home.blog.html
	@echo 'curl -F "type=home" -F "index=\$page.blog" -F "title=Blog" -F "html=@tmp/home.blog.html" ' $(URL)/management/html | ./ih $(TIME) $(PSK) | bash
	@echo "update blog.html"
 
txt: css js
	@echo "update txt"

css: frameC
	@echo "update css"
frameC: css.frame.css
	@java -jar yuicompressor.jar --type css --charset utf-8 css.frame.css> tmp/txt.frame.css
	@echo 'curl -F "type=text/css" -F "index=css.frame.css" -F "txt=@tmp/txt.frame.css" ' $(URL)/management/txt | ./ih $(TIME) $(PSK) | bash
	@echo "update css.frame.css"

js: navJ blogJ
	@echo "update js"
navJ: nav.js
	@java -jar yuicompressor.jar --type js --charset utf-8 nav.js > tmp/txt.nav.js
	@echo 'curl -F "type=appli@cation/x-javascript" -F "index=nav.js" -F "txt=@tmp/txt.nav.js" ' $(URL)/management/txt | ./ih $(TIME) $(PSK) | bash
	@echo "update nav.js"
blogJ:blog.js
	@java -jar yuicompressor.jar --type js --charset utf-8 blog.js > tmp/txt.blog.js
	@echo 'curl -F "type=appli@cation/x-javascript" -F "index=blog.js" -F "txt=@tmp/txt.blog.js" ' $(URL)/management/txt | ./ih $(TIME) $(PSK) | bash
	@echo "update blog.js"

bin:
	@echo "update bin"


nav: 
	@echo 'curl -d "label=Home" -d "order=0" -d "ref=/" ' $(URL)/management/nav | ./ih $(TIME) $(PSK) | bash
	@echo "update nav Home"
	@echo 'curl -d "label=Blog" -d "order=1" -d "ref=/blog" ' $(URL)/management/nav | ./ih $(TIME) $(PSK) | bash
	@echo "update nav Blog"
	@echo 'curl -d "label=Glob" -d "order=2" -d "ref=/page/glob" ' $(URL)/management/nav | ./ih $(TIME) $(PSK) | bash
	@echo "update nav Glob(page)"
	@echo "update nav"


qry:
	@echo "update qry"


help:
	@echo "usage:  make URL=[url] TIME=[time(fix)] PSK=[password]"
	@echo ""