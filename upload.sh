#!/bin/sh

echo $1
echo $2
echo $3
echo $#

if [ $# -eq 3 ]; then
    # update $page.main
    ## compress
    cat home.html > home.c.html
    ## upload
    echo 'curl -F "type=home" -F "index=\\\$page.main" -F "title=Home" -F "html=@home.c.html" ' $1/management/html | ./ih $2 $3 | bash

    # update $page.blog
    ## compress
    cat blog.html > blog.c.html
    ## upload
    echo 'curl -F "type=home" -F "index=\\\$page.blog" -F "title=Blog" -F "html=@blog.c.html" ' $1/management/html | ./ih $2 $3 | bash

    # update $page.frame.top
    ## compress
    cat top.html > top.c.html
    ## upload
    echo 'curl -F "type=home" -F "index=\\\$page.frame.top" -F "title=top" -F "html=@top.c.html" ' $1/management/html | ./ih $2 $3 | bash

    # update $page.frame.nav
    ## compress
    cat nav.html > nav.c.html
    ## upload
    echo 'curl -F "type=home" -F "index=\\\$page.frame.nav" -F "title=nav" -F "html=@nav.c.html" ' $1/management/html | ./ih $2 $3 | bash

    # update $page.frame.bottom
    ## compress
    cat bottom.html > bottom.c.html
    ## upload
    echo 'curl -F "type=home" -F "index=\\\$page.frame.bottom" -F "title=bottom" -F "html=@bottom.c.html" ' $1/management/html  | ./ih $2 $3 | bash

    # update /txt/css.frame.css
    ## compress
    java -jar yuicompressor.jar --type css --charset utf-8 -v css.frame.css  > css.frame.c.css
    ## upload
    echo 'curl -F "type=text/css" -F "index=css.frame.css" -F "txt=@css.frame.c.css" ' $1/management/txt | ./ih $2 $3 | bash

    # update /txt/blog.js
    ## compress
    java -jar yuicompressor.jar --type js --charset utf-8 -v blog.js > blog.c.js
    ## upload
    echo 'curl -F "type=application/x-javascript" -F "index=blog.js" -F "txt=@blog.c.js" ' $1/management/txt | ./ih $2 $3 | bash

    # update /txt/nav.js
    ## compress
    java -jar yuicompressor.jar --type js --charset utf-8 -v nav.js > nav.c.js
    ## upload
    echo 'curl -F "type=application/x-javascript" -F "index=nav.js" -F "txt=@nav.c.js" ' $1/management/txt | ./ih $2 $3 | bash
else
    echo "usage:  ./upload.sh url password time(fix)"
fi