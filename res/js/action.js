/* reload */
/*
<div class="col-xs-12 blog-main">
  <div class="blog-post">
*/
document.getElementById("main-part").setAttribute("class","col-xs-12 blog-main blog-post");
document.getElementById("container").setAttribute("class","container");

/* calls */
/* the script of Frame */
/* for nav */
globQuery('/.query/.nav',loadText(navflash),null);
/* for css */
//globQuery('/.query/.site-theme',loadText(themeflash),null);
/* for copyright */
/*
globQuery('/.query/.name',botomflash,null);
globQuery('/.query/.version',bottomflash,null);
globQuery('/.query/.buildinfo',bottomflash,null);
*/
//if (tags.indexOf('highlight')>=0)
//  globQuery('/.query/highlight',loadText(highlight),null);


/* call backs */
/**
 * call back for highlight
 * @param {string} style style name
 */
function highlight(style) {
  if(style == null) return;
  loadCss('/res/css/highlight/'+style);
}
/**
 * call back for theme
 * @param {*} theme name
 */
function themeflash(theme) {
  if (theme == null) return;
  loadCss('/res/css/theme/'+theme);
}

/**
 *  call back for bottom
 * @param {text} responsetext 
 */
/*
function bottom(responsetext) {
  if(responsetext[0] != null && responsetext[1] != null 
    && responsetext[2] != null) {
    var cpr = document.getElementById('copyright');
    var now = new Date();
    var nowYear = now.getFullYear();
    if (nowYear == 2016)
      var nowYearStr = '2016';
    else
      var nowYearStr = '2016-'+ nowYear;
    cpr.innerText = 'Copymiddle (C-M) ' +  nowYearStr + ' Qinka';
    var pwb = document.getElementById('powerby');
    pwb.innerText = 'Power by ' + responsetext[0] + '-' + responsetext[1] + '-' + responsetext[2];
  }
}
var bparray = new Array();
function bottomflash(r,n)
{
  if (bparray == null)
    bparray = new Array();
  bparray[n] = r;
  bottom(bparray);
}
*/
/**
 * navbar reflash 
 * @param {string} responseText
 */
function navflash(responseText) {
  var nJSON = eval(responseText);
  if (nJSON == undefined) return;
  var nN = document.getElementsByTagName('nav')[0];
  nJSON = nJSON.sort(function (a,b){if (a.order < b.order) return -2; else return 2;});
  for(var i=0;i<nJSON.length;i++) {
    var a  = document.createElement('a');
    a.setAttribute("class","blog-nav-item"); // class="blog-nav-item 
    a.href = nJSON[i].url;
    a.innerHTML = nJSON[i].label;
    nN.appendChild(a);
  }
}