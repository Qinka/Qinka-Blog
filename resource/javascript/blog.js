xrBlog = new XMLHttpRequest();
xrBlog.open('GET','/bl',true);
xrBlog.onreadystatechange = opBlog;
xrBlog.send(null);
function opBlog()
{
  if (xrBlog.readyState ==4) if (xrBlog.status == 200)
  {
    var blJSON = eval(xrBlog.responseText);
    if (blJSON == undefined) return;
    var blN = document.getElementById('bloglist');
    blJSON.sort(function(a,b){return (a['create-time'] < b['create-time'])});
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
      if (blJSON.summary != null)
        sumE.innerHTML = blJSON[i].summary;
      aE.innerHTML = blJSON[i].title;
      spanE.innerHTML = '['+blJSON[i]['create-time'].substring(0,10)+']';
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
