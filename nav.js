//nav.js
xmlreq = new XMLHttpRequest();
xmlreq.open("POST",'/nav',true);
xmlreq.onreadystatechange = tsop;
xmlreq.send(null);
function tsop()
{
  var colors = ["#ff9900","#ff0099","#cc00ff","#11c2ee"];
  colors = colors.sort(function(){return (Math.round(Math.random())-0.5);});
  if(xmlreq.readyState ==4) if(xmlreq.status == 200)
  {
    var navJSON = eval(xmlreq.responseText);
    if (navJSON == undefined)return;
    var navN = document.getElementById('navs');
    for(var i=0;i<navJSON.length;i++)
    {
      var tmpN = document.createElement("li");
      var tmpA = document.createElement("a");
      tmpA.style.color=colors[i];
      tmpA.href=navJSON[i].ref;
      tmpA.innerHTML = navJSON[i].label;
      tmpN.appendChild(tmpA);
      navN.appendChild(tmpN);
    }
  }
};

xrPb = new XMLHttpRequest();
xrPb.open("GET",'/query/version',true);
xrPb.onreadystatechange = tsopPb;
xrPb.send(null);
function tsopPb()
{
  if(xrPb.readyState ==4) if(xrPb.status == 200)
  {
    var pbP = document.getElementById('powerby');
    var strong = document.createElement('strong');
    strong.innerHTML = "Power by Glob - " + xrPb.responseText;
    pbP.appendChild(strong);
  }
};
