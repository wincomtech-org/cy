/**轮播**/
/****首页轮播*/
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
		 	$('.prodcts_detail_tit .txt').css('padding-top',intercept/2+"px");
		}
	}

	/**产品页***/
	var productImg=$('.product_item_items .img img').height();	
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

/*导航联系我们*/
if(screen.width >768){
	$('.header-connect-button').hover(function(){
		
		$('.index_contact_us_con').show();
	},function(){
		$('.index_contact_us_con').hide();
	})
}	
	

$(document).ready(function(){
	/**产品高度**/
	var arrPro=$('.product_item_items');
	var productImg=$('.product_item_items .img img').height();
	var productTxt=$('.product_item_items .txt').height();
	var productInt=productImg - productTxt;
	if(screen.width > 768){
		$.each(arrPro,function(i,val){
		
			var productImg=$(this).children('.img').children('a').children('img').height();
			var productTxt=$(this).children('.txt').height();
			var productInt=productImg - productTxt;
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
		 var intercept= proTxtHeight -proHeight;
		 $('.prodcts_detail_tit .img').css('margin-top',intercept/2+"px")
	}
}



/**头部导航***/
if(screen.width > 1024){
	$('.chinaNav_header>li').hover(function(){
		// $(this).addClass('active').siblings().removeClass('active');
		$(this).find('.china_nav_content').show();
	},function(){
		// $(this).removeClass('active');
		$(this).find('.china_nav_content').hide();
	})
}

if( screen.width < 1024){
	$('.chinaNav_header >li .headerContent_item').click(function(){
		if($(this).parent().hasClass('header_hasContent')){
			// if($(this).parent().children('.china_nav_content ').hide()){
			// 	$(this).siblings('.china_nav_content ').children('.chinaNav_content_items').children('p').removeClass('arr2').addClass('arr1')
			// }
			$(this).parent().children('.china_nav_content ').toggle();
			if($(this).hasClass('arr1')){
				$(this).removeClass('arr1').addClass('arr2');
			}else{
				$(this).removeClass('arr2').addClass('arr1');
			}	
		}
		$('.chinaNav_content_items>p').click(function(){
			$(this).siblings('.chinaNav_content').toggle();
			if($(this).hasClass('arr1')){
				$(this).removeClass('arr1').addClass('arr2');
			}else{
				$(this).removeClass('arr2').addClass('arr1');
			}
			
		})
	})	
}

