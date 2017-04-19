<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/main.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/resources/css/mobile/sub.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/resources/css/mobile/board.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/resources/css/mobile/enterprise.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/resources/css/mobile/search.css" rel="stylesheet" type="text/css"/>

	<script src="//code.jquery.com/jquery-latest.min.js"></script>

	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"> -->
<!-- 	<link href="/mobile/img/favicon.ico" rel="icon" type="image/x-icon"> -->
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery-2.1.4.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery.bxslider.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/placeholders.js"></script>

	<script src="${pageContext.request.contextPath }/resources/js/mobile/jquery.swipebox.js"></script>
	<link href="${pageContext.request.contextPath }/resources/js/mobile/swipebox.css" rel="stylesheet" type="text/css"/>

	<!-- Add fancyBox main JS and CSS files -->
<!-- 	<script type="text/javascript" src="/mobile/js/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="/mobile/js/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
 -->

	<script src="${pageContext.request.contextPath }/resources/js/mobile/script.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mobile/util.js" type="text/javascript"></script>

    <script src="https://maps.google.com/maps/api/js?key=AIzaSyCAr0HeB2LSff7sqIUhi5D4H0NA0nPD7Bs&sensor=false" type="text/javascript"></script>

    <style type="text/css">
        .search_select {
            width:45%;height:25px;background:#fff;color:#000;font-size:23px;margin-left:7px; 
        }

      
    </style>

   

	<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<script src="../js/html5shiv-printshiv.js"></script>
	<![endif]-->
	
<script>

$(document).ready(function(){
  
    $(".search-box-btn").click(function(){
        var nowText = $(this).text();

        if(nowText == "▼"){
            $(this).text("▲");
            $(".search-box2").slideDown("slow");
            $(".search-box3").slideDown("slow");
        }else{
            $(this).text("▼");
            $(".search-box2").slideUp("slow");
            $(".search-box3").slideUp("slow");
        }
    });

    $(".search_select").change(function(){
        var outsNum = $(this).attr("rel");
        $("#sel"+outsNum).html("");
        
        $(this).find('option:selected').each(function(){
            $("#sel"+outsNum).append("<li>"+$(this).text()+"</li>");
        });

        $(".sellist li").on("click",function(){

            var chkNum = $(this).closest("ul").attr("rel");
            chkNum = parseInt(chkNum)-1;
            
            var sels = $(".search_select").eq(chkNum);
        });
    });
    
});
  </script>	
</head>
<body>

	<div class="side_menu_bg"></div>
	<div class="layer_bg"></div>

<div id="wrap" style="height:100%;">	

    <section id="container" class="search-content area"  style="height:89%;padding:0;top:0px;">	 	
		<form action="./list.html" method="post" name="form" id="form">
			<fieldset>
				<legend>검색</legend>
				<div class="search-box">
                    <a href="./main.html"><img src="./images/left_arrowi.png" style="float:left;" /></a>
					
					
					<input type="hidden" name="mode" value="3">
					<input type="text" id="searchtext" name="con" placeholder="검색하세요." onfocus="this.placeholder=''" onblur="this.placeholder='검색하세요.'"/>
					<button type="button" class="btn_search" style="background:#00a9c7;float:right;" ><img src="${ pageContext.request.contextPath }/resources/images/mobile/icon_menu4.png"></button>
				</div>
                <div class="search-box-btn">▼</div>
                <div class="search-box2">
                    <ul>
                        <li>
                            <span>도/시</span>
                            <select class="search_select" rel="1" size="1" MULTIPLE >
                                <option value="서울">서울</option>
                                <option value="경기">경기</option>
                                <option value="부산">부산</option>
                                <option value="대구">대구</option>
                                <option value="제주">제주</option>
                            </select>
                        </li>

                        <li>
                            <span>테마</span>
                            <select class="search_select" rel="2" size="1" MULTIPLE >
                                <option value="이별여행">이별여행</option>
                                <option value="커플여행">커플여행</option>
                                <option value="솔플">솔플</option>
                                <option value="파티플">파티플</option>
                                <option value="버스">버스</option>
                            </select>
                        </li>

                        <li>
                            <span>계절</span>
                            <select class="search_select" rel="3" size="1" MULTIPLE >
                                <option value="봄">봄</option>
                                <option value="여름">여름</option>
                                <option value="가을">가을</option>
                                <option value="겨울">겨울</option>
                            </select>
                        </li>
                    </ul>
                </div>
                <div class="search-box3">
                    <div class="listDiv" >
                        <span>도/시</span>
                        <ul class="sellist" id="sel1" rel="1"></ul>
                    </div>

                    <div class="listDiv" >
                        <span>테마</span>
                        <ul class="sellist" id="sel2" rel="2"></ul>
                    </div>


                    <div class="listDiv" >
                        <span>계절</span>
                        <ul class="sellist" id="sel3" rel="3"></ul>
                    </div>

                 
                        

                </div>

			</fieldset>
		</form>
    </section><!-- //container End -->
    <!-- footer -->
	</section><!-- //container End -->
	</div><!--wrap_end-->
</body>
</html>