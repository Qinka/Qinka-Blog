/* the script of Frame */
/* for nav */
globQuery('/@/@nav',navflash,null,null);
/* for css */
globQuery('/@/~site-theme',themeflash,null,null);
/* for copyright */
globQuery('/@/~name',bottomflash,0,null);
globQuery('/@/~version',bottomflash,1,null);
globQuery('/@/~buildinfo',bottomflash,2,null);
if (tags.indexOf('highlight')>=0)
  globQuery('/@/~highlight',highlight,null,null);
/* for daovoice */
(function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,"script","//widget.daovoice.io/widget/06e2aa9f.js","daovoice");
//dv(window,document,"script","//widget.daovoice.io/widget/06e2aa9f.js","daovoice");
daovoice('init',{app_id:"06e2aa9f"});
daovoice('update');
/* functions */
/* for DaoVoice 
function dv (i,s,o,g,r,a,m)
{
  i["DaoVoiceObject"]=r;
  i[r]=i[r]||dv2(i,r),i[r].l=1*new Date();
  a=s.createElement(o),m=s.getElementsByTagName(o)[0];
  a.async=1;
  a.src=g;
  m.parentNode.insertBefore(a,m);
}
function dv2(i,r)
{
  (i[r].q=i[r].q||[]).push(arguments);
}*/
/* call back of css request */
function themeflash(responseText,n)
{
  var theme = responseText;
  if (theme == null) return;
  var file = document.createElement('link');
  file.setAttribute('rel','stylesheet');
  file.setAttribute('type','text/css');
  file.setAttribute('href','/theme/'+theme);
  if(typeof file != 'undefined')
    document.getElementsByTagName('head')[0].appendChild(file);
}
/* call back of nav request */
function navflash(responseText,n)
{
  var nJSON = eval(responseText);
  if (nJSON == undefined) return;
  var nN = document.getElementsByTagName('nav')[0];
  nJSON = nJSON.sort(function (a,b){if (a.order < b.order) return -2; else return 2;});
  var ul = document.createElement('ul');
  for(var i=0;i<nJSON.length;i++)
  {
    var li = document.createElement('li');
    var a  = document.createElement('a');
    a.href = nJSON[i].url;
    a.innerHTML = nJSON[i].label;
    li.appendChild(a);
    ul.appendChild(li);
  }
  nN.appendChild(ul);
}
// for fetch response texts
var bparray = new Array();
function bottomflash(r,n)
{
  if (bparray == null)
    bparray = new Array();
  bparray[n] = r;
  bottom(bparray);
}
// for bottom
function bottom(responsetext)
{
  if(responsetext[0] != null && responsetext[1] != null && responsetext[2] != null)
  {
    var cpr = document.getElementById('copyright');
    var now = new Date();
    var nowYear = now.getFullYear();
    if (nowYear == 2016)
      var nowYearStr = '2016';
    else
      var nowYearStr = '2016-'+ nowYear;
    cpr.innerText = 'Copyright (C) ' +  nowYearStr + ' Qinka';
    var pwb = document.getElementById('powerby');
    pwb.innerText = 'Power by ' + responsetext[0] + ' - ' + responsetext[1] + '-' + responsetext[2];
  }
}

// for write 

// for query
function globQuery(url,func,n,body)
{
  var req = new XMLHttpRequest();
  req.open("GET",url,true);
  req.onreadystatechange = function (){
    if (req.readyState == 4 && req.status == 200)
      func(req.responseText,n);
  };
  req.send(body);
}


// for highlight
function highlight(style,i)
{
  if(style == null) return;
  var file = document.createElement('link');
  file.setAttribute('rel','stylesheet');
  file.setAttribute('type','text/css');
  file.setAttribute('href','/highlight/'+style);
  if(typeof file != 'undefined')
    document.getElementsByTagName('head')[0].appendChild(file);
}