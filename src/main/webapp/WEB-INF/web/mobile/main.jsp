<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0" />
	<meta name="format-detection" content="telephone=no, address=no, email=no" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="mama" />
	<meta property="og:description" content="share you map" />
    <!--
	<meta property="og:image" content="/data/board/tNVRIuu9Gs.png" />
    -->
 
	<link href="./css/common.css" rel="stylesheet" type="text/css"/>
	<link href="./css/main.css" rel="stylesheet" type="text/css"/>
	<link href="./css/sub.css" rel="stylesheet" type="text/css"/>
    <link href="./css/board.css" rel="stylesheet" type="text/css"/>
    <link href="./css/enterprise.css" rel="stylesheet" type="text/css"/>

	<script src="//code.jquery.com/jquery-latest.min.js"></script>

	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"> -->
	<link href="/mobile/img/favicon.ico" rel="icon" type="image/x-icon">
	<script src="./js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="./js/jquery-2.1.4.min.js" type="text/javascript"></script>
	<script src="./js/jquery.bxslider.js"></script>
	<script src="./js/placeholders.js"></script>

	<script src="./js/jquery.swipebox.js"></script>
	<link href="./js/swipebox.css" rel="stylesheet" type="text/css"/>


	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="/mobile/js/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="/mobile/js/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />


	<script src="./js/script.js" type="text/javascript"></script>
	<script src="./js/util.js" type="text/javascript"></script>

    <script src="https://maps.google.com/maps/api/js?key=AIzaSyCAr0HeB2LSff7sqIUhi5D4H0NA0nPD7Bs&sensor=false" type="text/javascript"></script>



    <style type="text/css">
        
        /* 하단 길찾기 */
        #navDiv{
            width:100%;height:70%;background:#fff;position:absolute;z-index:98;bottom:0px;
            display:none;
        }
    </style>

	<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<script src="../js/html5shiv-printshiv.js"></script>
	<![endif]-->
	<title>마마</title>
</head>

<body>

	<div class="side_menu_bg"></div>
	<div class="layer_bg"></div>

<div id="wrap" style="height:100%;">	

	<header id="header" class="clearfix">
		<a href="#!" class="gnb_menu">
			<span class="left"></span>
			<span class="center"></span>
			<span class="right"></span>
		</a>
		<h2 class="page_tit">
            <a href="./main.html"><img src="./images/logo.png" alt="로고" class="logo" style="height:60px;" /></a>
        </h2>

		

	</header><!--header_end-->



	<aside id="side_menu">

        <!-- 로그인 안되었을 때 -->
		<div class="user_info">
			<div class="user_img" id="user_img">
				<a href="./login.html">
					<img src="./images/user_no_img.png" alt="유저이미지" />
				</a>
			</div>
            <div class="user_txt" style="vertical-align:middle;">
                        <a href="./login.html"><strong class="login_txt01">로그인을 해주세요.</strong></a>
        
            </div>
		</div>



        <!-- 로그인 안되었을 때 -->
        <!--
		<div class="user_info">
			<div class="user_img" id="user_img">
				<a href="./login.html">
					<img src="./images/user_img.png" alt="유저이미지" />
				</a>
			</div>
            <div class="user_txt" style="vertical-align:middle;">
                        <a href="./login.html"><strong class="login_txt01"><span>홍순일</span>님 환영합니다</strong></a>
        
            </div>
		</div>
        -->


		<nav id="gnb">
			<ul class="depth01 clearfix">

                
				<li >
                    <a href="#!">
                        <img src="./images/icon_menu1.png" alt="즐겨찾기" /> <span>즐겨찾기</span>
                    </a>
                    
                    <img class="menu_rg" src="./images/icon_menu4.png" alt="검색" onclick="goSearchs();" />
                </li>


              

                <li id="show_map">
                    <a href="#!">
                        <img src="./images/icon_menu2.png" alt="지도" /> <span>지도</span>
                    </a>
                    <span class="menu_te">▲</span>
                </li>

                <li id="hidden_map" >
                    <div style="width:100%;max-height:200px;overflow:hidden;overflow-y:auto;">

                        <ul class="sub_depth01 clearfix">

                            <li>
                                <a href="#!">
                                    <span>지도1</span>
                                </a>
                            </li>

                            <li>
                                <a href="#!">
                                    <span>지도1</span>
                                </a>
                            </li>
                 
                          
                        </ul>

                    </div>

                </li>

                <li id="show_place" >
                    <a href="#!">
                        <img src="./images/icon_menu3.png" alt="장소" /> <span>장소</span>
                    </a>
                    <span class="menu_te">▲</span>
                </li>

                <li id="hidden_place" >
                    <div style="width:100%;max-height:200px;overflow:hidden;overflow-y:auto;">

                        <ul class="sub_depth01 clearfix">

                            <li>
                                <a href="#!">
                                    <span>장소1</span>
                                </a>
                            </li>

                            <li>
                                <a href="#!">
                                    <span>장소1</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!">
                                    <span>장소1</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!">
                                    <span>장소1</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!">
                                    <span>장소1</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!">
                                    <span>장소1</span>
                                </a>
                            </li>

                        </ul>

                    </div>

                </li>


                <li id="show_fav">
                    <a href="#!">
                        <img src="./images/icon_menu1.png" alt="즐겨찾기" /> <span>즐겨찾기</span>
                    </a>
                    
                    <span class="menu_te">▲</span>
                </li>


                <li id="hidden_fav" >
                    <div style="width:100%;max-height:200px;overflow:hidden;overflow-y:auto;">

                        <ul class="sub_depth01 clearfix">

                            <li>
                                <a href="#!">
                                    <span>즐겨찾기1</span>
                                </a>
                            </li>

                            <li>
                                <a href="#!">
                                    <span>즐겨찾기1</span>
                                </a>
                            </li>
                 
                          
                        </ul>

                    </div>

                </li>

				


				
			</ul>
			<div class="register_btn">
				<label for="agree01" class="ios_check"><input type="checkbox" id="agree01" class="ios-switch green  bigswitch" ><span><span></span></span>
                <span class="t_xt">실시간 기록</span>
                </label>
			</div>
			
		</nav>
		<a href="#!" class="btn_slide_close"><img src="./images/btn_slide_close.png" alt="메뉴 닫기" /></a>
	</aside>


    <div style="" id="navDiv">
        <div id="closeNavi" class="btnNavi" style="width:100%;height:20px;font-weight:bold;background-color:white;padding-top:10px;padding-left:10px;">
            <div style="width:85%;display:inline-block;">
            서초구 저기동 저기 어디?
            </div>


            <span style="float:right;margin-right:25px;width:20px;text-align:center;position:absolute;" id="clsNav">X</span>
        </div>
        <div class="coupon_tab_btn">
            <span class="tab_btn tab01 active">
                <a href="#!">자가용</a>
            </span>
            
            <span class="tab_btn tab02">
                <a href="#!">대중교통</a>
            </span>


            <span class="tab_btn tab03">
                <a href="#!">도보</a>
            </span>


        </div>
        
        <div  style="width:100%;overflow:hidden;overflow-y:auto;height:83%;">

            <ul class="foot_depth01 clearfix">

                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>

                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>
                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>
                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>
                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>
                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>
                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>
                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>
                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>
                <li>
                    <a href="#!">
                        <span>장소1</span>
                    </a>
                </li>

            </ul>

        </div>
        
        
    </div>




    <section id="container" style="height:89%;padding:0;">
    <div id="map" style="width:100%; height:100%;"></div>

    


    <div id="bottomDiv" class="btnNavi" style="width:100%;height:60px;bottom:0px;font-size:30px;font-weight:bold;display:block;position:fixed;background-color:white;opacity:0.8;padding-top:10px;padding-left:10px;">
        
        <div style="width:85%;display:inline-block;" id="openNavi">
            서초구 저기동 저기 어디?
        </div>
        
        <span style="float:right;margin-right:25px;width:20px;text-align:center;position:absolute;" id="clsNav2">X</span>
    
    </div>


    
    <!-- footer -->


	</section><!-- //container End -->

   

	</div><!--wrap_end-->

    

</body>
</html>

<script type="text/javascript">

$(document).ready(function(){
    $("#hidden_fav").hide();
    $("#hidden_map").hide();
    $("#hidden_place").hide();


    $("#show_fav").click(function(){
        $("#hidden_fav").slideToggle('slow');
        var nowText = $(this).find(".menu_te").text();

        if(nowText == "▲"){
            $(this).find(".menu_te").text("▼");
        }else{
            $(this).find(".menu_te").text("▲");
        }
    });

    $("#show_map").click(function(){
        $("#hidden_map").slideToggle('slow');
        var nowText = $(this).find(".menu_te").text();

        if(nowText == "▲"){
            $(this).find(".menu_te").text("▼");
        }else{
            $(this).find(".menu_te").text("▲");
        }
    });

    $("#show_place").click(function(){
        $("#hidden_place").slideToggle('slow');
        var nowText = $(this).find(".menu_te").text();

        if(nowText == "▲"){
            $(this).find(".menu_te").text("▼");
        }else{
            $(this).find(".menu_te").text("▲");
        }
    });
    

    $("#openNavi").click(function(){
        $("#navDiv").slideDown("slow");
    });

    $("#closeNavi").click(function(){
        $("#navDiv").slideUp("slow");
    });

    $(".coupon_tab_btn span").click(function(){
        $(".coupon_tab_btn span").each(function(){
            $(this).removeClass("active");
        });

        $(this).addClass("active");
    });

    $("#clsNav").click(function(){
        $("#bottomDiv").hide();
    });

    $("#clsNav2").click(function(){
        $("#bottomDiv").hide();
    });


});



var latitude = "";
var longitude = "";

function getLocation(){
    var options = {
        // 가능한 경우, 높은 정확도의 위치(예를 들어, GPS 등) 를 읽어오려면 true로 설정
        // 그러나 이 기능은 배터리 지속 시간에 영향을 미친다. 
        enableHighAccuracy:true, // 대략적인 값이라도 상관 없음: 기본값
        
        // 위치 정보가 충분히 캐시되었으면, 이 프로퍼티를 설정하자, 
        // 위치 정보를 강제로 재확인하기 위해 사용하기도 하는 이 값의 기본 값은 0이다.
        maximumAge:3000,     // 5분이 지나기 전까지는 수정되지 않아도 됨
        
        // 위치 정보를 받기 위해 얼마나 오랫동안 대기할 것인가?
        // 기본값은 Infinity이므로 getCurrentPosition()은 무한정 대기한다.
        timeout: 15000    // 15초 이상 기다리지 않는다.
    }



	if (navigator.geolocation)
    {
		navigator.geolocation.getCurrentPosition(showPosition,showError, options);
    } else {
		alert("이 브라우저에서는 위치 추적을 할 수 없습니다.");
	}
}
getLocation();

function showPosition(position)
{
	latitude = position.coords.latitude;	
	longitude = position.coords.longitude;
		latitude == "37.530806";
		longitude == "126.8482816";
	if (latitude == "")
	{
		//좌표 못가져오면 서울시 좌표로 고정
		latitude == "37.5664101";
		longitude == "126.9783282";

	}
	get_map(latitude, longitude);

}
function get_map(latitude, longitude)
{
    var locations = new Array();
	var map = new google.maps.Map(document.getElementById('map'), {
	  zoom: 16,
	  center: new google.maps.LatLng(latitude, longitude),
	  mapTypeId: google.maps.MapTypeId.ROADMAP
	});
	var	startLat	= "";
	var	startLng	= "";
	var	endLat		= "";
	var	endLng		= "";

	google.maps.event.addListener(map, 'idle', function(){
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng(); 
		
     


	});
}


 
function showError(error){
  switch(error.code) 
    {
    case error.PERMISSION_DENIED:
		get_map("37.5664101", "126.9783282");
		alert("위치추적을 거부했습니다.");
		break;
    case error.POSITION_UNAVAILABLE:
      alert("Location information is unavailable.");
		get_map("37.5664101", "126.9783282");
      break;
    case error.TIMEOUT:
      alert("TIME OUT")
		get_map("37.5664101", "126.9783282");
      break;
    case error.UNKNOWN_ERROR:
      alert("알수 없는 오류가 발생되어 지도 데이터를 불러올수 없습니다.");
      break;
    }
  }

  function goSearchs(){
      location.href="./search.html";
  }

  </script>