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
    tmpA.href="/blog/"+blJSON[i].time+"/"+blJSON[i].index;
    tmpA.innerHTML = blJSON[i].title + " - " + blJSON[i].time;
    tmpN.appendChild(tmpA);
    blN.appendChild(tmpN);
  }
  onceBlog=1;
}
