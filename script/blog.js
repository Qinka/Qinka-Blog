// The script for blog
bloglist();

// functions

//to request
function bloglist()
{
  blogreq = new XMLHttpRequest();
  var params = location.search.substring(1,location.search.length);
  blogreq.open('GET','/@/.index/tag=t=blog;'+params,true);
  blogreq.setRequestHeader('How','get');
  blogreq.onreadystatechange = flashbloglist;
  blogreq.send(null);
}

// to flash page
function flashbloglist()
{
  if (blogreq.readyState == 4) if (blogreq.status == 200)
  {
    var bJSON = eval(blogreq.responseText);
    if (bJSON == undefined) return;
    bJSON = bJSON.sort(sortBL);
    var div = document.getElementById('bloglist');
    if (bJSON.length == 0)
      div.innerText = "没有东西在这里";
    else
    {
      var ul  = document.createElement('ul');
      for (var i=0;i<bJSON.length;i++)
      {
        var li = document.createElement('li');
        var a = document.createElement('a');
        var strong = document.createElement('strong');
        var span = document.createElement('span');
        var itemDiv = document.createElement('div');
        a.href = concat(bJSON[i].index);
        if (bJSON[i].summary != null && bJSON[i].summary.length != 0)
        {
          var sumDiv = document.createElement('div');
          sumDiv.innerHTML = bJSON[i].summary;
        }
        else var sumDiv = null;
        a.innerText = bJSON[i].title;
        if (bJSON[i]['author'] == null)  var auth = "";
        else var auth = bJSON[i]['author'];
        span.innerHtml = '[' + bJSON[i]['create-time'].substring(0,10)+']'+auth;
        strong.appendChild(a);
        itemDiv.appendChild(strong);
        itemDiv.appendChild(span);
        li.appendChild(itemDiv);
        if (sumDiv != null) li.appendChild(sumDiv);
        ul.appendChild(li);
      }
      div.appendChild(ul);
    }
  }
}

// to sort blog list
function sortBL (a,b)
{
  if (a['create-time'] > b['create-time'])
    return -2;
  else
    return 2;
}

// to concat url
function concat (xs)
{
  var rtval = '';
  for (var i=0;i<xs.length;++i) rtval += '/'+xs[i];
  return rtval;
}
