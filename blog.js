//blog.js

var onceBlog=0;
xrBlog = new XMLHttpRequest();
xrBlog.open("POST",'/blog',true);
xrBlog.onreadystatechange = tsopBlog;
xrBlog.send(null);
function tsopBlog()
{
  if(onceBlog==1) return;
  var blJSON = eval(xrBlog.responseText);
  if (blJSON == undefined) return;
  var blN = document.getElementById('bloglist');
  if (blJSON.length==0)
    blN.innerHTML = "没有文章。。。";
  else for(var i=0;i<blJSON.length;i++)
  {
    var tmpN = document.createElement("li");
    var tmpA = document.createElement("a");
    var tmpl = document.createElement("strong");
    var tmpr = document.createElement("span");
    var tmpd = document.createElement("div");
    tmpA.href="/blog/"+blJSON[i].time+blJSON[i].index.substr(5);
    tmpA.innerHTML = blJSON[i].title;
    tmpr.innerHTML = "[ " + blJSON[i].time.substring(0,10) + " ]";
    tmpl.style.textAlign="left";
    //tmpl.style.cssFloat="left";
    tmpr.style.cssFloat="right";
    tmpr.style.textAlign="right";
    tmpd.style.display="block";
    tmpA.width="auto";
    tmpl.appendChild(tmpA);
    tmpd.appendChild(tmpl);
    tmpd.appendChild(tmpr);
    tmpN.appendChild(tmpd);
    blN.appendChild(tmpN);
  }
  onceBlog=1;
}
