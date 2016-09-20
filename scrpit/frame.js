/* the script of Frame */
/* for nav */
querynavs();
/* for css */
loadcss();
/* for daovoice */
(function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,"script","//widget.daovoice.io/widget/06e2aa9f.js","daovoice");
//dv(window,document,"script","//widget.daovoice.io/widget/06e2aa9f.js","daovoice");
daovoice('init',{app_id:"06e2aa9f"});
daovoice('update');
/* functions */
/* for DaoVoice */
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
}
/* load css */
function loadcss ()
{
  cssreq = new XMLHttpRequest();
  cssreq.open("POST","/q/site-theme",true);
  cssreq.onreadystatechange = themeFlash;
  cssreq.setRequestHeader('How','get');
  cssreq.send(null);
}
/* call back of css request */
function themeFlash()
{
  if (cssreq.readyState == 4) if (cssreq.status == 200)
  {
    var theme = cssreq.responseText;
    if (theme == null) return;
    var file = document.createElement('link');
    file.setAttribute('rel','stylesheet');
    file.setAttribute('type','text/css');
    file.setAttribute('href','/theme/'+theme);
    if(typeof file != 'undefined')
      document.getElementsByTagName('head')[0].appendChild(file);
  }
}
/* Quert Navs */
function querynavs ()
{
  navreq = new XMLHttpRequest();
  navreq.open("POST","/n",true);
  navreq.onreadystatechange = navflash;
  navreq.setRequestHeader('How','get');
  navreq.send(null);
}
/* call back of nav request */
function navflash()
{
  if(navreq.readyState == 4) if(navreq.status == 200)
  {
    var nJSON = eval(navreq.responseText);
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
}