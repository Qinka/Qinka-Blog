//nav.js
var once=0;
xmlreq = new XMLHttpRequest();
xmlreq.open("POST",'/nav',true);
xmlreq.onreadystatechange = tsop;
xmlreq.send(null);
function tsop()
{
  if(once ==1)return;
  var navJSON = eval(xmlreq.responseText);
  if (navJSON == undefined)return;
  var navN = document.getElementById('navs');
  for(var i=0;i<navJSON.length;i++)
  {
    var tmpN = document.createElement("li");
    var tmpA = document.createElement("a");
    tmpA.href=navJSON[i].ref;
    tmpA.innerHTML = navJSON[i].label;
    tmpN.appendChild(tmpA);
    navN.appendChild(tmpN);
  }
  once=1;
}
xrPb = new XMLHttpRequest();
xrPb.open("GET",'/query/version',true);
xrPb.onreadystatechange = tsopPb;
xrPb.send(null);
function tsopPb()
{
  document.getElementById('powedby').innerHTML = "Power by Glob - "+xrPb.responseText;
}
