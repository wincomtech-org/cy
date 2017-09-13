/******/

$('.header-menu-button').click(function(){
	// $('.header-menu').toggle();	
	// $('header').addClass('navVisible');
	// var hideLogo=$('.header-logo-hidden').css('display');
	// $('.header-logo-hidden').toggle();
	// $('.header-logo').toggle();
	// var  x=$('.header-menu').css('display');
	// var y=$('.home_serach').css('display');
	
	// if(y =="block"){
	// 	$('.home_serach').css('display','none');
	// }
	if($('.china_header ').hasClass('china_header_show')){
		$('.china_header').removeClass('china_header_show');
		$('body').css('overflow','visible')
	}else{
		$('.china_header').addClass('china_header_show');
		$('body').css('overflow','hidden')
		
	}
	
	$('.china_nav').toggle();
	

})




$('.listpromo-items-item-hasContent .listpromo-items-item-tit').click(function(){
	$(this).siblings('ol').toggle();
	var list_ol=$('.listpromo-items-item-hasContent ol').css('display');
	
})

$('.header-menu-close-button').click(function(){
	$('.header-menu').hide();
	$('.header').removeClass('header-fixed');
	var  x=$('.header-menu').css('display');
	if( x == 'block'){
		$('.header-menu').css('display','none');
	}
})

/***搜索***/
$('.header-search-button').click(function(){
	$('.header-top-search').addClass('header-top-search1')
	$('.header-top').css("display",'none');
})
$('.header-top-search .close').click(function(){
	$('.header-top-search').removeClass('header-top-search1');
	$('.header-top').css("display",'block');
})
$('.home_serach .close').click(function(){
	$('.home_serach').hide();
	
})

/***向上箭头***/
$('.doc_up a').click(function(){
	document.body.scrollTop=0
})


/***页面滚动事件**/
$(window).scroll(function(){

	var docWidth=document.body.clientWidth;
	var screenHright=window.screen.height;
	var docHeight=document.body.clientHeight;
	var scrollHeight=document.body.scrollTop;
	if(scrollHeight >screenHright){
		$('.doc_up a').css('display','block')
	}else{
		$('.doc_up a').hide();
	}
	
})

/**轮播**/
$(function() {
		$("#slider").easySlider( {
			slideSpeed: 500,
			paginationSpacing: "15px",
			paginationDiameter: "12px",
			paginationPositionFromBottom: "20px",
			slidesClass: ".slides",
			controlsClass: ".controls",
			paginationClass: ".pagination"					
		})
})