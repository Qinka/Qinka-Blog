//nav.js
xmlreq = new XMLHttpRequest();
xmlreq.open("POST",'/nav',true);
xmlreq.onreadystatechange = tsop;
xmlreq.send(null);
function tsop()
{
  if(xmlreq.readyState ==4) if(xmlreq.status == 200)
  {
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
  }
}
xrPb = new XMLHttpRequest();
xrPb.open("GET",'/query/version',true);
xrPb.onreadystatechange = tsopPb;
xrPb.send(null);
function tsopPb()
{
  if(xrPb.readyState ==4)
  {
    var verPb = xrPb.responseText;
    h = document.getElementById('powerby');
    if(h!=null)
      h.innerHTML = "Power by Glob - "+verPb;
    else
      h.innerHTML = " Power by Glob";
  }
}
