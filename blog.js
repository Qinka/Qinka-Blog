//blog.js

xrBlog = new XMLHttpRequest();
xrBlog.open("POST",'/blog',true);
xrBlog.onreadystatechange = tsopBlog;
xrBlog.send(null);
function tsopBlog()
{
  if(xrBlog.readyState ==4) if(xrBlog.status == 200)
  {
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
      var sum = document.createElement("div");
      tmpA.href="/blog/"+blJSON[i].createtime+"/"+blJSON[i].index.substr(5);
      sum.innerHTML = blJSON[i].summary;
      tmpA.innerHTML = blJSON[i].title;
      tmpr.innerHTML = "[ " + blJSON[i].createtime.substring(0,10) + " ]";
      tmpl.style.textAlign="left";
      tmpl.style.fontSize="150%";
      tmpr.style.cssFloat="right";
      tmpr.style.textAlign="right";
      tmpd.style.display="block";
      tmpA.width="auto";
      tmpN.style.paddingTop="20px";
      tmpl.appendChild(tmpA);
      tmpd.appendChild(tmpl);
      tmpd.appendChild(tmpr);
      tmpN.appendChild(tmpd);
      tmpN.appendChild(sum);
      blN.appendChild(tmpN);
    }
  }
}
