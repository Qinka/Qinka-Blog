/** frame work */

/** for query var
 * @param {url} url url relative
 * @param {fucntion} func function(XMLHttpRequest)
 * @param {any}body request body
 * @return void
*/
function globQuery(url,func,body) {
  var req = new XMLHttpRequest();
  req.open("GET",url,true);
  req.onreadystatechange = function (){
    if (req.readyState == 4 && req.status == 200)
      func(req); // req.responseText
  };
  req.send(body);
  return;
}

/**
 * load css
 * @param {url} url 
 */
function loadCss(url) {
  var file = document.createElement('link');
  file.setAttribute('rel','stylesheet');
  file.setAttribute('type','text/css');
  file.setAttribute('href',url);
  if(typeof file != 'undefined')
    document.getElementsByTagName('head')[0].appendChild(file);
  else
    console.log("can not load css");
}

/* for QR's flyout */
var showQR = 0;
/**
 * create QR flyout
 */
function sqrc() {
  var body = document.getElementsByTagName('body')[0];
  var div = document.createElement('div');
  new QRCode(div,window.location.href);
  div.setAttribute('class','showqrcode');
  div.setAttribute('onclick','rqrc()');
  var p = document.createElement('p');
  p.innerText = "点击释放";
  div.appendChild(p);
  body.appendChild(div);
}
/**
 * release QR flyout
 */
function rqrc() {
  var divs = document.getElementsByClassName('showqrcode');
  for(var i = 0;i < divs.length; i++) {
    divs[i].remove();
  }
  showQR = 0;
}
/**
 * display QR
 */
function showQRCode() {
  if (showQR == 0) {
    sqrc();
    showQR = 100;
  }
}
/**
 * remove QR
 */
function removeQRCode() {
  if (showQR > 0) {
    rqrc();
    showQR = 0;
  }
}
/**
 * click QR
 */
function clickQRCode() {
  if(showQR > 0)
    showQR = 0;
}

/**
 * load function
 * @param {function (string){}} func 
 */
function loadText(func) {
  return function (req) {
    func(req.responseText);
  }
}