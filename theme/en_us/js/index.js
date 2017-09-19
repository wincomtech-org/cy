/******/

/*给所有的页面第一次加载是加class .main_body1*/
$(document).ready(function(){
	if(screen.width > 1023){
		 $('.main-body').addClass('main-body1');
	}
  
});


$('.header-menu-button').click(function(){
	$('.header-menu').toggle();	
	$('header').addClass('navVisible');
	var hideLogo=$('.header-logo-hidden').css('display');
	var headerLogo=$('.header-logo').css('display');
	$('.header-logo').toggle();
	var  x=$('.header-menu').css('display');
	var y=$('.home_serach').css('display');
	if(headerLogo =="none"){
		$('.header-logo').css('display','inline-block')
	}else{
		$('.header-logo').css('display','none')
	}
	if(hideLogo =="none"){
		$('.header-logo-hidden').css('display','inline-block')
	}else{
		$('.header-logo-hidden').css('display','none')
	}
	if(x =="block"){
		$('.main-body').addClass('main-body1');
		$('.header').addClass('header-fixed');
	}else{
		$('.main-body').removeClass('main-body1');
		$('.header').removeClass('header-fixed');
	}
	
	if(y =="block"){
		$('.home_serach').css('display','none');
	}

	/***导航页面**/
		if(screen.width < 1024){
			var mainBody=$('.main-body').css('padding-top');
			console.log(mainBody)
			if($('.header').hasClass('header-fixed')){
				$('.main-body').css('padding-top','69px')

			}else{
				$('.main-body').css('padding-top','0')
			}

			
		}

})

$('.listPromo1-item-content>a').mouseover(function(event) {
	/* Act on the event */
	$(this).siblings('ol').show();
});

$('.listpromo-items-item-tit').click(function(){
	$(this).siblings('ol').toggle();
	if($(this).children('span').hasClass('icon_x')){
		$(this).children('span').addClass('icon_x1').removeClass('icon_x');
	}else{
		$(this).children('span').addClass('icon_x').removeClass('icon_x1');
		console.log($(this).siblings('ol').children('li').children('.hasContent_three').children('span'))
		if($(this).siblings('ol').children('li').children('.hasContent_three').children('span').hasClass('icon_x1')){
		  $(this).siblings('ol').children('li').children('.hasContent_three').children('span').removeClass('icon_x1').addClass('icon_x');
		  $(this).siblings('ol').children('li').children('.hasContent_three_content').hide();
		}
	}
	
})

$('.listpromo-items-item-tit').hover(function(){

})

/*导航联系我们hover*/
if(screen.width >1024){
	$('.header-connect-button').hover(function(){
		
		$('.index_contact_us_con').show();
	},function(){
		$('.index_contact_us_con').hide();
	})
}

/**头部默认展开*/
if(screen.width<1023){
	$('.header').removeClass('header-fixed');
}

/**三级导航**/
$('.hasContent_three').click(function(){
	$(this).siblings('ul').toggle();
	if($(this).children('span').hasClass('icon_x')){
		$(this).children('span').addClass('icon_x1').removeClass('icon_x');
	}else{
		$(this).children('span').addClass('icon_x').removeClass('icon_x1');
	}
})

$('.header-menu-close-button').click(function(){
	$('.header-menu').hide();
	$('.header').removeClass('header-fixed');
	var  x=$('.header-menu').css('display');
	if( x == 'block'){
		$('.header-menu').css('display','none');
	}
	$('.main-body').css('padding-top','0');
})


/***搜索***/
$('.header-search-button').click(function(){
	$('.home_serach').toggle();
	$('.header ').addClass('header-fixed');
	var z=$('.header-menu').css('display');
	if(z=="block"){
		$('.header-menu').css('display','none');
		$('.header-logo-hidden').toggle();
		$('.header-logo').toggle();
		$('.main-body').removeClass('main-body1');
	}
})
$('.home_serach .close').click(function(){
	$('.home_serach').hide();
	$('.header ').removeClass('header-fixed');
	
})

/*767屏幕下搜索*/
if(screen.width < 767){
	$('.header-search-button').click(function(){
		
		$('.home_serach').show();
		$('.header ').addClass('header-fixed');
		
	})
	$('.home_serach .close').click(function(){
		$('.home_serach').hide();
		$('.header ').removeClass('header-fixed');
		$('.main-body').css('padding-top','50px');
	
	})
}

/***向上箭头***/
$('.doc_up a').click(function(){
	document.body.scrollTop=0
})



$(window).resize(function(){
	/**产品详情页的产品图高度**/
	var proWidth=$('.prodcts_detail_tit .img').width();
	var proHeight=$('.prodcts_detail_tit .img').height();
	var proTxtHeight=$('.prodcts_detail_tit .txt').height();
	var proHeight=proWidth;
	$('.prodcts_detail_tit .img').css('height',proHeight);

	if(screen.width > 767){
		if(proHeight > proTxtHeight){
			var intercept=proHeight - proTxtHeight;
		 	$('.prodcts_detail_tit .txt').css('padding-top',intercept/2.5+"px");
		}
	}


	// 首页
	var gridItem=$('.gridPromo-items-item .MediaPromo-media').width();
	if(gridItem < 253){
		$('.MediaPromo-category-wrapper').css('padding-right','0');
		$('.MediaPromo-category-wrapper .MediaPromo-date').css('position','static');
	}
	else{
		$('.MediaPromo-category-wrapper').css('padding-right','80px');
		$('.MediaPromo-category-wrapper .MediaPromo-date').css('position','absolute');
	}
	

		/*767屏幕下搜索*/
	if(screen.width < 767){
		$('.header-search-button').click(function(){
			
			$('.home_serach').show();
			$('.header ').addClass('header-fixed');
			
		})
		$('.home_serach .close').click(function(){
			$('.home_serach').hide();
			$('.header ').removeClass('header-fixed');
			$('.main-body').css('padding-top','50px');

		})
	}
})

// 首页
var gridItem=$('.gridPromo-items-item .MediaPromo-media').width();
if(gridItem < 253){
		$('.MediaPromo-category-wrapper').css('padding-right','0');
		$('.MediaPromo-category-wrapper .MediaPromo-date').css('position','static');
}else{
		$('.MediaPromo-category-wrapper').css('padding-right','80px');
		$('.MediaPromo-category-wrapper .MediaPromo-date').css('position','absolute');
}

/***产品高度***/
$(document).ready(function(){
	/**产品高度**/
	var arrPro=$('.product_item_items');
	var productImg=$('.product_item_items .img img').height();
	var productTxt=$('.product_item_items .txt').height();
	var productInt=productImg - productTxt;
	if(screen.width>768){
		$.each(arrPro,function(i,val){
		
			// console.log(typeof($(this)[i]))
			var productImg=$(this).children('.img').children('a').children('img').height();
			var productTxt=$(this).children('.txt').height();
			var productInt=productImg - productTxt;
			console.log(productInt,productTxt);

			if(productInt > 0){
				$(this).children('.txt').css('margin-top',productInt/2.5+'px')
			
			}
		})
	}
	
	

})



/**产品详情页的产品图高度**/
var proWidth=$('.prodcts_detail_tit .img').width();
var proHeight=$('.prodcts_detail_tit .img').height();
var proTxtHeight=$('.prodcts_detail_tit .txt').height();

var proHeight=proWidth;
$('.prodcts_detail_tit .img').css('height',proHeight);

if(screen.width > 767){

	if(proHeight > proTxtHeight){
		 var intercept=proHeight - proTxtHeight;
		 $('.prodcts_detail_tit .txt').css('padding-top',intercept/2.5+"px")
	}else{
		var intercept=proTxtHeight - proHeight;
		 $('.prodcts_detail_tit .img').css('margin-top',intercept/2+"px")
	}

}



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
			paginationPositionFromBottom: "30px",
			slidesClass: ".slides",
			controlsClass: ".controls",
			paginationClass: ".pagination"					
		})
})