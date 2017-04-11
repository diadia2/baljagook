$(document).ready(function(){
	
	

	//메뉴 열기
	$(".gnb_menu").click(function(){
		$("#side_menu").addClass("on");
		$("#wrap").addClass("gnbOn");
		$(".side_menu_bg").show();
	});
	//메뉴 닫기
	$(".side_menu_bg,.btn_slide_close").click(function(){
		$("#side_menu").removeClass("on");
		$("#wrap").removeClass("gnbOn");
		$(".side_menu_bg").hide();
	});
	
	//메인 비주얼 슬라이드
	$('.main_vis_sld').bxSlider({
		 auto:true,
		 autoStart:true,
		 pager: true,
		 controls:false,
		 speed:1000,
		 pause: 5000
	});

	//추천 단골집 슬라이드
	$('.shop_list').bxSlider({
		 auto:true,
		 autoStart:false,
		 pager: false,
		 controls:false,
		 speed:1000,
		 pause: 3000
	});

	//리스트 flip 메인 상단 리스트의 flip 지정
	//메인 하단 리스트의 flip은 main.php하단에 지정
	$(".shop_list .list .list_inner .list_img").click(function(){
		$(this).parents(".list_inner").toggleClass("active");
	});
	
	
	
	

});




function alert_open(){
	alert("준비중입니다.");
}




