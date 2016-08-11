// nav
xmlreq = new XMLHttpRequest();
xmlreq.open("GET",'/n',true);
xmlreq.onreadystatechange = tsop;
xmlreq.send(null);
// author
if (author != null)
{
  var sumN = document.getElementById('sum');
  var auth = document.createElement('p');
  auth.innerText = '作者：'+author;
  sumN.appendChild(auth);
}
// functions
function tsop()
{
  var colors = ["rgba(255,153,0,0.7)","rgba(255,0,153,0.7)","rgba(172,90,193,0.7)","rgba(96,157,176,0.7)"];
  colors = colors.sort(function(){return (Math.round(Math.random())-0.5);});
  if(xmlreq.readyState ==4) if(xmlreq.status == 200)
  {
    var navJSON = eval(xmlreq.responseText);
    if (navJSON == undefined)return;
    var navN = document.getElementById('navs');
    navJSON = navJSON.sort(function(a,b){if (a.order < b.order) return -2; else return 2;});
    for(var i=0;i<navJSON.length;i++)
    {
      var tmpN = document.createElement("li");
      var tmpA = document.createElement("a");
      tmpA.style.color=colors[i];
      tmpA.href=navJSON[i].url;
      tmpA.innerHTML = navJSON[i].label;
      tmpN.appendChild(tmpA);
      navN.appendChild(tmpN);
    }
  }
};
