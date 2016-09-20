/* to share in qzone */
qzoneshare();
/* functions */
function qzoneshare()
{
  var sumP = document.getElementsByClassName('summaryP');
  if (sumP[0] == null)
   ;// sumP = document.getElementsByClassName('homemain')[0].innerText;
  else
    sumP = sumP[0].innerText;
  var param =
  {
      url:location.url,
      showcount:'1',
      style:'102',
      width:145,
      height:30
  };
  var str = [];
  for (var i in param)
    str.push(i+'='+encodeURIComponent(param[i]||''));
  document.write(['<a version="1.0" class="qzOpenerDiv" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?',str.join('&'),'" target="_blank">分享</a>'].join(''));
}