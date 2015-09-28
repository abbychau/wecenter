window.onload = function()
{
	if (/MSIE 6/.test(navigator.userAgent) || /MSIE 7/.test(navigator.userAgent))
	{
		var newNode = document.createElement("div");
			newNode.setAttribute('id', 'browser-not-support');
	        newNode.innerHTML = '<img class="pull-left" src="'+ G_STATIC_URL +'/css/default/img/404-logo.png" alt="" />'+
					'<div class="pull-left content">'+
						'<h1>您的瀏覽器<span>不受支持</span></h1>'+
						'<p>您的瀏覽器版本非常舊, 存在諸多安全和體驗問題! 建議<a href="http://windows.microsoft.com/zh-cn/windows/upgrade-your-browser">更新</a>或者使用其他瀏覽器來訪問, 如果您使用的是搜狗、360、遨遊等雙核瀏覽器, 請切換到極速模式以獲得更好的體驗</p>'+
						'<ul>'+
							'<li><a href="http://www.google.com/chrome/">￮ Google 瀏覽器</a></li>'+
							'<li><a href="http://opera.com/">￮ Opera 瀏覽器</a></li>'+
							'<li><a href="http://www.mozilla.com/firefox/">￮ Firefox 瀏覽器</a></li>'+
						'</ul>'+
					'</div>';
		document.getElementsByTagName('body')[0].appendChild(newNode);
	}
}