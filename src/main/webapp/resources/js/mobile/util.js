	/********************************************************* 
		//	전체선택 전체 해제
		//<input type="checkbox" name="chkAll" id="chkAll" onclick="fnCheck();">  // 전체선택 및 해제 값
		//<input type="checkbox" value="<>" name="chkidx" id="<>"> // 각각 레코드 값 value와  id는 디비 키값을 루프로 넣는다.
		//<a href="javascript:chkboxValid();" class="btn btn-danger">선택삭제</a>
		//<a name="chkAll" id="chkAll" onclick="fnCheck();" class="btn btn-success">전체선택 및 해제</a>
	*********************************************************/
	function fnCheck(){
		var obj = $('#chkAll');
		$('input[name=chkidx]').prop('checked',(obj[0].tog = !obj[0].tog));
	}
	
	function chkboxValid(str){
		var obj = [];
		var strIdx ="";
		var chkcnt
		$('input[name=chkidx]:checked').each(function(){obj.push(this.value)});
		chkcnt = $('input:checkbox[name=chkidx]:checked').length - 1  //선택된 갯수 , 배열에 맞추기 위해 -1 한다
		
		$.each(obj,function(index, item){
			if (index == chkcnt){
				strIdx +=  "" + item + "";
			}else{
				strIdx += "" + item + ",";
			}
		});

		if (strIdx == ""){ 
			alert("선택된 게시물이 없습니다.");
			return; 
		}else{  
			if(confirm('선택한 게시물을 삭제하시겠습니까?')){
				$("input[name='strIdx']").val(strIdx);
				$("#form").submit();
			}
		}
	}

	/********************************************************* 
		//	오늘로 부터 몇일전 값구하기
		//<button type="button" onclick="tday(-7)">1주일</button>
		//<button type="button" onclick="tday(-180)">6개월</button>
	*********************************************************/
	function tday(i){
		var Now = new Date();
		var NowTime = Now.getFullYear();
		NowgetMonth = Now.getMonth() + 1;
		NowTime += '-' + NowgetMonth ;
		NowTime += '-' + Now.getDate();
		//NowTime += ' ' + Now.getHours();
		//
		//NowTime += ':' + Now.getMinutes();
		//
		//NowTime += ':' + Now.getSeconds();

		var d = date_add(NowTime, i);
		$("#Datepicker1").val(d);   // id가 Datepicker1 인 인풋박스에 값넣음
		$("#Datepicker2").val(NowTime); // 해당 아이디 인풋박스 만듬
	}


	function date_add(sDate, nDays) {
		var yy = parseInt(sDate.substr(0, 4), 10);
		var mm = parseInt(sDate.substr(5, 2), 10);
		var dd = parseInt(sDate.substr(8), 10);
	 
		d = new Date(yy, mm - 1, dd + nDays);
	 
		yy = d.getFullYear();
		mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
		dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
	 
		return '' + yy + '-' +  mm  + '-' + dd;
	}

	
	/********************************************************* 
		레이어 팝업창 중앙에 뜨기
		<a href="javascript:showPopup1();">PC</a>
			function showPopup1(){
				$("#popLayer1").show();
				$("#popLayer1").center();
			}
	*********************************************************/
	$.fn.center = function () {
		this.css({"position":"fixed", "z-index":"10000", "top":"6%", "left":"50%", "margin-left":"-298px"});
		//position":"absolute", "z-index":"10000", "top":"4595px", "left":"653px
		//this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
		//this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		//this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		return this;
	}


	function j_hide(layer_name){
		$("#"+layer_name).hide();
	}

	function j_show(layer_name){
		$("#"+layer_name).show();
	}

	function j_center(layer_name){
		$("#"+layer_name).center();
	}
	

	/********************************************************* 
	- 비밀번호 검증
	if(!chkPwd($('#pass2').val().trim())) {  
		$('#pass2').val('');
		$('#pass2').focus();
		return;
	}
	*********************************************************/
	function chkPwd(str){
		var reg_pwd = /^.*(?=.{6,15})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		//var reg_pwd = /^.*(?=.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!reg_pwd.test(str)){
			alert('비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~15자 이내)');
			return false;
		}
		return true;
	}


	/*********************************************************************************************************************
	'	Function name	: 이미지 변경
	'	Description1		: <img src="rollover-image-1.png" id='add' onmouseover="FncImgChange('add','/data/editor/7.JPG');" onmouseout="" onclick="" >
	'	Description2		: FncImgChange('이미지아이디','이미지경로')
	' *********************************************************************************************************************/
	function FncImgChange(id,img){
		$("#" + id).attr("src",img);
	}


	/* ######################################################################
	'	Function name	: 팝업레이어
	'	Description1		: <a href="javascript:LayerPopup(url);" >팝업창 오픈</a>
<style>
	#DocumentMask {  
	  position:absolute;  
	  z-index:9000;  
	  background-color:#000;  
	  display:none;  
	  left:0;
	  top:0;
	}
	#LayerPopupContent{
	  display: none;
	  position:absolute;  
	  left:100px;
	  top:100px;
	  z-index:10000;
	}
</style>

<div id="DocumentMask"></div>
<div id="LayerPopupContent">
	<table bgcolor="white">
		<tr>
			<td>
				<iframe name="iframeidxkey" id="iframeidxkey" width="560" height="350" frameborder="0"></iframe>
			</td>
		</tr>
	</table>
</div>
닫기  onclick="javascript:parent.LayerPopupClose();"
	' ######################################################################*/
	function LayerPopup(url){
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();  

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#DocumentMask').css({'width':maskWidth,'height':maskHeight});  

		//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
		//$('#mask').fadeIn(1);      //1000 - 1초
		$('#DocumentMask').fadeTo("slow",0.3);     // 0.8 - 80%
		
		if(url != ""){
			document.getElementById("iframeidxkey").src= url;
		}

		$("#LayerPopupContent").center();
		$('#LayerPopupContent').show();
	}

	function LayerPopupClose(){
		$('#DocumentMask,#LayerPopupContent').hide();
	}

	jQuery.fn.center = function () {
		this.css("position","absolute");
		this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
		this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		return this;
	}


	/************************************************
	1.업로드 할 이미지 미리보기
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	1.
		<div style="text-align:center;">
		<input type="file" style="width:500px;" onchange="fileInfoView(this)" /><br>
		<div id="img_box"></div>
		</div>
	2.
	<img src="/mobile/img/sub/img_camera.png" alt="메인노출사진등록No_images" onclick="document.getElementById('FileName1').click();" id="imgFileName1" />
	<input type="file" size="30" id="FileName1" name="FileName1" onchange="fileInfoView(this,'imgFileName1')" style="display:none;" />
	***********************************************/
	function fileInfoView(f,imgid,w,h){
		var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음
		// file 은 배열이므로 file[0] 으로 접근해야 함


		if(file[0].size > 1024 * 1024 * 10){
			// 큰 파일을 올리니까 브라우저가 다운되었음 -_-;;
			alert('10MB 이상의 파일은 올리실 수 없습니다.');
			return;
		}
//		else if (!file[0].name.match(/\.(jpg|jpeg|png|gif|JPG|GIF|JPEG|PNG)$/)){ // 선택한 파일이 이미지인지 확인
//			alert('이미지 파일만 선택하시기 바랍니다.');
//			return;
//		}
		
//		var ext = file[0].name.split('.').pop().toLowerCase();
//		if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
//			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
//			return;
//		}


		var reader = new FileReader(); 
		reader.onload = function(rst){
			//$('#'+imgid).append('<img src="' + rst.target.result + '">'); // append 메소드를 사용해서 이미지 추가
			$("#"+imgid).attr("src", rst.target.result).css({"width":w,"height":h}) ;
		}
		reader.readAsDataURL(file[0]); // 파일을 읽는다
	}



function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex ;
		var regex_plus ;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp("\\s" + sqlArray[i] + "\\s","gi") ;
			if (regex.test(obj.value)) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
			
			regex_plus = new RegExp( "\\+" + sqlArray[i] + "\\+","gi") ;
			if (regex_plus.test(obj.value)) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex_plus, "");
				return false;
			}
		}
	}
	return true ;
}

	function courec(board_idx,coupon_idx){
		$.ajax({
			type: "POST",
			url: "/mobile/coupon/coupon_take_ajax.php",
			data:{board_idx:board_idx,coupon_idx:coupon_idx} ,
			dataType: "text",
			success: function (data) {
				if (data == 1) {
					alert("로그인 후 쿠폰을 발급발을 수 있습니다.");
				}

				if (data == 2) {
					alert("발행된 쿠폰이 없거나 발행기간 지났습니다.");
				}

				if (data == 3) {
					alert("쿠폰이 발행되었습니다.");
				}

				if (data == 4) {
					alert("해당 쿠폰을 이미 받으셨습니다.");
				}

			}
		});
	}


	function fn_coupon_use(){

		var board_idx = $("#CouponUse_board_idx").val();
		var coupon_idx = $("#CouponUse_coupon_idx").val();
		var store_number = $("#store_number").val();

		$.ajax({
			type: "POST",
			url: "/mobile/inc/coupon_use_ajax.php",
			data:{board_idx:board_idx,coupon_idx:coupon_idx,store_number:store_number} ,
			dataType: "text",
			success: function (data) {
				if (data == 1) {
					alert("로그인 후 쿠폰을 사용하실 수 있습니다.");
				}

				if (data == 2) {
					alert("쿠폰 사용기간이 지났습니다.");
				}
				if (data == 3) {
					alert("매장 비밀번호가 일치하지 않습니다.");
				}

				if (data == 4) {
					alert("소지하고 있는 쿠폰이 없거나 이미 사용하였습니다.");
					close_use();
				}

				if (data == 5) {
					alert("쿠폰이 정상적으로 사용되었습니다.");
					close_use();
					location.reload();
				}

			}
		});
	}

	function fncgood(board_idx,num,mode){
		$.ajax({
			type: "POST",
			url: "/mobile/enterprise/good_ajax.php",
			data:{board_idx:board_idx} ,
			dataType: "text",
			success: function (data) {
				var data1 = data.split("||");
	
				if (data1[1] == "1") {
					alert("로그인 후 좋아요를 하실 수 있습니다.");
				}else if(data1[1] =="2"){
					
					if(mode == "1"){
						$("#goodcnt1"+num).text(data1[2]);
						
					}else if(mode == "2"){
						$("#goodcnt2"+num).text(data1[2]);
					}else if(mode == "3"){
						$("#goodcnt"+num).text(data1[2]);
					}else if(mode == "4"){
						$("#goodcnt4"+num).text(data1[2]);
					}

					alert("좋아요가 완료 되었습니다.");
				
				}else if(data1[1]=="3"){
					alert("해당매장에 이미 좋아요를 선택하셨습니다.");
				}
			}
		});
	}