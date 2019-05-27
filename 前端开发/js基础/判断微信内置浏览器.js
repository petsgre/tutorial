function isWechat() {
  var ua = navigator.userAgent.toLowerCase();
  return /micromessenger/i.test(ua);
}
