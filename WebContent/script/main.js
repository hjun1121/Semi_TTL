$(function(){

	//사이즈 변수 선언(공통 사용)
	var winWidth = window.innerWidth || document.documentElement.clientWidth;
	
	
	/* 신착도서, 추천도서 */
	var moveTime = 500;
	$('.book > ul > li h2 a').bind('click focus', function(){
		$('.book > ul > li').removeClass('on');
		$(this).parent().parent().addClass('on');
		return false;
	});
	
	var listCount = $('.book > ul > li.on > div > div > ul > li').length;
	var listWidth = $('.book > ul > li.on > div > div').width();
	if($(window).width() < 750)
	{
		listWidth = listWidth/2;
	}
	else
	{
		listWidth = listWidth/4;
	}
	
	$('.book > ul > li > div > div > ul > li').css('width',listWidth);
	$('.book > ul > li > div > div > ul').css('width',listWidth * listCount);
	
	$(window).resize(function(){
		var listCount = $('.book > ul > li.on > div > div > ul > li').length;
		var listWidth = $('.book > ul > li.on > div > div').width();
		if($(window).width() < 750)
		{
			listWidth = listWidth/2;
		}
		else
		{
			listWidth = listWidth/4;
		}
		
		$('.book > ul > li > div > div > ul > li').css('width',listWidth);
		$('.book > ul > li > div > div > ul').css('width',listWidth * listCount);
	});
	
	//도서 롤링
	$('.book > ul > li .btns a.prev').click(function(){//이전버튼 클릭
		
		var listWidth = $(this).parent().parent().find('li').width();
		var listCount = $(this).parent().parent().find('li').length;
		
		$(this).parent().parent().find('li').css('width',listWidth);
		$(this).parent().parent().find('ul').css('width',listWidth * listCount);
		
		var bookList = $(this).parent().parent().find('ul');
		
		var listDispCnt = 4;
		if($(window).width() < 750)
		{
			listDispCnt = 2;
		}
		if(listCount > listDispCnt){
			if(!$(bookList).is(":animated")){
				for ( var int = 0; int < listDispCnt; int++) {
					$(this).parent().parent().find('li').last().prependTo(bookList);
				}
				$(bookList).css('left',-listWidth*listDispCnt);
				$(bookList).animate({'left':'0'},moveTime);
			}
		}
		return false;
	});
	$('.book > ul > li .btns a.next').click(function(){//다음버튼 클릭
		var listWidth = $(this).parent().parent().find('li').width();
		var listCount = $(this).parent().parent().find('li').length;
		
		$(this).parent().parent().find('li').css('width',listWidth);
		$(this).parent().parent().find('ul').css('width',listWidth * listCount);
		
		var bookList = $(this).parent().parent().find('ul');
		
		var listDispCnt = 4;
		if($(window).width() < 750)
		{
			listDispCnt = 2;
		}
		if(listCount > listDispCnt){
			if(!$(bookList).is(":animated")){
				$(bookList).animate({'left':-listWidth*listDispCnt},moveTime,function(){
					for ( var int = 0; int < listDispCnt; int++) {
						$(this).children().first().appendTo(bookList);
					}
					$(bookList).css('left','0');
				});
			}
		}
		return false;
	});
	
	

});