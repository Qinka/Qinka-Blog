xrBlog = new XMLHttpRequest();
xrBlog.open('GET','/bl'+location.search,true);
xrBlog.onreadystatechange = opBlog;
xrBlog.send(null);
function sortby(a,b)
{
  if (a['create-time'] > b['create-time'])
    return -1;
  else
    return 1;
}
function opBlog()
{
  if (xrBlog.readyState ==4) if (xrBlog.status == 200)
  {
    var blJSON = eval(xrBlog.responseText);
    if (blJSON == undefined) return;
    var blN = document.getElementById('bloglist');
    blJSON = blJSON.sort(sortby);
    if (blJSON.length == 0)
      blN.innerHTML = "没有东西，在这里";
    else for(var i=0;i<blJSON.length;i++)
    {
      var liE = document.createElement('li');
      var aE  = document.createElement('a');
      var strongE = document.createElement('string');
      var spanE = document.createElement('span');
      var divE = document.createElement('div');
      var sumE = document.createElement('div');
      aE.href="/b"+concat(blJSON[i].index);
      if (blJSON[i].summary != null && blJSON[i].summary.length != 0)
        sumE.innerHTML = blJSON[i].summary;
      else
        sumE.innerHTML = "无";
      aE.innerHTML = blJSON[i].title;
      if (blJSON[i]['author'] == null)
        var aT = "";
      else
        var aT = blJSON[i]['author'];
      spanE.innerHTML = '['+blJSON[i]['create-time'].substring(0,10)+']' + aT;
      strongE.appendChild(aE);
      divE.appendChild(strongE);
      divE.appendChild(spanE);
      liE.appendChild(divE);
      liE.appendChild(sumE);
      blN.appendChild(liE);
    }
  }
}
function concat(sa)
{
  var rtval='';
  for (var i=0;i<sa.length;++i)
  {
    rtval += '/';
    rtval += sa[i];
  }
  return rtval;
}
