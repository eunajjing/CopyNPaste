<%-- main>>
@JSP : myinfo.jsp
@Date : 2018.10.10
@Author : 이주원
@Desc : 내 정보 보기 페이지.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="center-block">
			<h2 class="text-center signup-title">내 정보 보기</h2>
			<hr>
			<form class="form-horizontal" method="post" name="updateMember" id="updateMember" enctype="multipart/form-data"
					action="member/updateMember.do">
				<div class="form-group">
					<label class="control-label col-sm-5">프로필 이미지<span class="text-danger"></span></label>
					<div class="col-sm-4">				
						<div>
							<div class="col-sm-3 pr-0 pl-0" >
								<div class="imgfile" style="width:92.5px;height:92.5px;"><img style="height: 100%;width: 100%" class="img-responsive user-photo img-rounded" 
              						id="beforUserPhoto" ></div>				
           					</div>
           				<input type="file" class="userPhoto socialUser" name="userPhotoFile" id="userPhoto" 
								aria-describedby="file_upload" accept="image/*">
								<small class="socialUser"> * .jpg, .gif, .png 파일만 업로드 가능하며, 500kb를 초과할 수 없습니다.</small>
						</div>
					</div>
            	</div>
				
				
				<div class="form-group socialUser">
					<label class="control-label col-sm-5">Email ID <span class="text-danger"></span></label>
					<div class="col-lg-3 col-sm-4">
						<div><!-- class="input-group" -->
							<input type="email" class="form-control" name="userEmail"
								id="userEmail" readonly>
						 </div>
						 <div class="col-sm-4"></div>
					 	<div class="col-sm-12 text-center"><div></div></div>  
					</div>
					
				</div>
				<div class="form-group">
					<label class="control-label col-sm-5">닉네임 <span class="text-danger"></span></label>
						<div class="col-lg-3 col-sm-4">
							<div>
								<input type="text" class="form-control" name="userNick"
										id="userNick">
							</div>
						</div>
						<div class="col-sm-4"></div>
					 <div class="col-sm-12 text-center"><div id="userNickMessage" class="mt-10 socialUser"></div></div>
				</div>
				
				
				<div class="form-group socialUser">
					<label class="control-label col-sm-5">비밀번호<span class="text-danger"></span></label>
						<div class="col-lg-3 col-sm-4">
							<div>
								<input type="password" class="form-control" name="userPwd" id="userPwd">
							</div>
						</div>
						<div class="col-sm-4"></div>
					<div class="col-sm-12 text-center"><div id="userPwdMessage" class="mt-10"></div></div>
				</div>
				
				
				<div class="form-group socialUser">
					<label class="control-label col-sm-5">비밀번호 확인<span class="text-danger"></span></label>
						<div class="col-lg-3 col-sm-4">
							<div>
								<input type="password" class="form-control" name="cuserPwd"
										id="cuserPwd">
							</div>
						</div>
					<div class="col-sm-4"></div>
					<div class="col-sm-12 text-center"><div id="userPwdConfirmMessage" class="mt-10"></div></div>
				</div>
			
				<div class="social-btn text-center">
				&nbsp;<input name ="infoUpdate" type="button" class="btn btn-primary socialUser" id="infoUpdate" value="정보수정">
				&nbsp;<input name ="deleteMember" type="button" class="btn btn-danger" id="deleteMember" value="회원탈퇴">
		  		</div>
			<br>
			</form>
		</div>
	</div>
	<br>	<br>	<br>
</div>

<script type="text/javascript">
var userPhoto; //회원 프로필 사진
var userNick; //회원 닉네임
var userEmail; //회원 이메일
var nickDupCheck ='ok'; //닉네임 중복 진행했는지 확인하는 변수
var rightPwd; //비밀번호 유효성 체크 변수
var pwdDupCheck; //비밀번호 중복 진행했는지 확인하는 변수

//회원 정보 뿌리기. header.jsp와 같은 함수 쓰고 있음. succecss부분 확인 필요
$.ajax({
	type : 'post',
	url : '${pageContext.request.contextPath}/member/myinfo.do',
	success : function(data) {
		userPhoto = data.userPhoto; 
		userNick = data.userNick;
		userEmail = data.userEmail;	
		$('#userEmail').val(data.userEmail);
		$('#userNick').val(userNick); 
		if (data.userSocialStatus != 0){
			$('.socialUser').hide();
			$('#beforUserPhoto').attr("src", userPhoto);
		} else {$('#beforUserPhoto').attr("src", "${pageContext.request.contextPath}/resources/image/userPhoto/" + userPhoto);	
			}
	}	
	,
	error : function(error) {
		console.log(error);
		console.log(error.status);
		}
	})

//닉네임 중복확인. signup.jsp와 다름
	$('#userNick').keyup(function(){
		if ($('#userNick').val() == ''){
			$('#userNickMessage').text("사용할 닉네임을 입력해 주세요");
		} else {
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/member/checkUserNick.do',
				data : {userNick:$('#userNick').val()},
           	 	success : function(data) {
            		if ($('#userNick').val()==userNick){
            			$('#userNickMessage').removeClass("failMessage")
            			$('#userNickMessage').addClass("successMessage")
            			$('#userNickMessage').text("사용 가능한 닉네임입니다.");
        				nickDupCheck = 'ok';   
            		}else {
            			if (data > 0 ) {
            				$('#userNickMessage').removeClass("successMessage")
                			$('#userNickMessage').addClass("failMessage")
                			$('#userNickMessage').text("이미 사용 중인 닉네임입니다.");
                			nickDupCheck = ''
                		} else {
                			$('#userNickMessage').removeClass("failMessage")
                			$('#userNickMessage').addClass("successMessage")
                			$('#userNickMessage').text("사용 가능한 닉네임입니다.");
            				nickDupCheck = 'ok';
               		 }
            		}
            	},
            error : function(error) {
				swal("٩(இ ⌓ இ๑)۶", "잠시 후 다시 시도해 주세요.", "error");
				console.log(error);
				console.log(error.status);
            }
         });
		}
	});
	
//비밀번호 일치 확인. signup.jsp와 같음
	$('#cuserPwd').keyup(function(){
	if($(this).val() != $('#userPwd').val()){
		$('#userPwdConfirmMessage').removeClass("successMessage")
		$('#userPwdConfirmMessage').addClass("failMessage")
		$('#userPwdConfirmMessage').text("비밀번호를 정확히 입력해 주세요.");
		pwdDupCheck = '';
	} else {
		$('#userPwdConfirmMessage').removeClass("failMessage")
		$('#userPwdConfirmMessage').addClass("successMessage")
		$('#userPwdConfirmMessage').text("비밀번호가 일치합니다.");
		pwdDupCheck = 'ok';
	}
})

//비밀번호 영문, 숫자만 입력 가능. signup.jsp와 같음
$("#userPwd").keyup(function (event) {
	regexp =  /^[0-9a-zA-Z]{6,20}$/i;
	var v = $(this).val();
	if (regexp.test(v)) {
		$('#userPwdMessage').removeClass("failMessage")
		$('#userPwdMessage').addClass("successMessage")
		$('#userPwdMessage').text("사용 가능한 비밀번호 입니다.");
		rightPwd = 'ok';
		}else{
			$('#userPwdMessage').removeClass("successMessage")
			$('#userPwdMessage').addClass("failMessage")
			$('#userPwdMessage').text("알파벳 대소문자, 숫자로 6자이상 입력해주세요."); 
			rightPwd = '';
		}
})
		
//회원 정보 수정 버튼 클릭 시 유효성(정보수정 1/3)
$('#infoUpdate').click(function(){
 	if ($('#userPwd').val() == '' && $('#cuserPwd').val() == '') { 
		if ( nickDupCheck != 'ok' && $('#userNick').val() != userNick ){
			/* swal("٩(இ ⌓ இ๑)۶", "사용할 수 없는 닉네임입니다.", "error"); */
						swal({
			  				  title: "사용할 수 없는 닉네임입니다.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: '확인',
			  				  closeOnConfirm: true
			  				})
			} else { 
				updateMember(); }
	} else {
		if ( rightPwd != 'ok' || pwdDupCheck != 'ok' ){
			/* swal("٩(இ ⌓ இ๑)۶", "변경할 비밀번호를 제대로 입력해 주세요.", "error"); */
					swal({
			  				  title: "변경할 비밀번호를 제대로 입력해 주세요.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: '확인',
			  				  closeOnConfirm: true
			  				})
			
		} else {
			if ( nickDupCheck != 'ok' && $('#userNick').val() != userNick ){
				/* swal("٩(இ ⌓ இ๑)۶", "사용할 수 없는 닉네임입니다.", "error"); */
						swal({
			  				  title: "사용할 수 없는 닉네임입니다.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: '확인',
			  				  closeOnConfirm: true
			  				})
				} else {
				updateMember();
				}
			}	
	} 
})

//정보 수정 유효성 시 입력한 비밀번호 확인(정보수정 2/3)
function updateMember(){	       
		swal({
			  title: "비밀번호 확인",
			  text: "<form style='font-size:15px;'><br><input type='password' class='pw'"+
			  		"id='rawpassword' size='40' placeholder='현재 비밀번호를 입력해주세요'/></form>",
			  html: true,
			  inputAttributes: { autocapitalize: 'off' },
			  showCancelButton: true,
			  confirmButtonText : "OK",
			  confirmButtonClass : "btn-danger btn-sm",
			  cancelButtonClass : "btn btn-sm",
			  closeOnConfirm: false
			}, function () {
					//비밀번호 비교
					var rawpassword=$('#rawpassword').val();
					$.ajax({
						type: "post",
						data: {rawpassword:rawpassword},
						url: '${pageContext.request.contextPath}/member/matchPwd.do',
						success: function(data){
							if( data == true){
								//비밀번호 확인 후 정보 수정
								console.log("data: " + data);
								infoUpdateAjax();
							} else{
								console.log("data: " + data);
								$('#userPwd').val("");
								$('#userPwd').attr("placeholder","비밀번호를 정확히 입력해 주세요.");
							}
						},
						error: function (){
							$('#userPwd').val("");
							$('#userPwd').attr("placeholder","잠시후 다시 시도해주세요.");
						}
					})				
				  }
			)
	};
	
	
	
	
	
//DB로 가는 정보수정(정보수정 3/3)
		function infoUpdateAjax(){
		var form = $('form')[1];
			//FormData parameter에 담아줌
			var formData = new FormData(form);	

			$.ajax({
				type : 'post',
				data: formData, 
				enctype: 'multipart/form-data',
				processData : false,
				contentType : false,
				url : '${pageContext.request.contextPath}/member/updateMember.do',
				success : function() {
						 swal({type: "success",
						 title: "୧༼ ヘ ᗜ ヘ ༽୨",
						 text: "회원정보가 수정되었습니다.",
						 confirmButtonClass : "btn-danger btn-sm",
						 closeOnConfirm: false	},
						 function(){	location.reload();	});	
						},
				error : function(error) {
						/* swal("٩(இ ⌓ இ๑)۶", "에러가 발생했습니다.", "error"); */
						swal({
			  				  title: "에러가 발생했습니다.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: '확인',
			  				  closeOnConfirm: true
			  				})
						console.log(error);
						console.log(error.status);
						}
			})
		}		
		
		
//회원탈퇴
 $('#deleteMember').click(function(){
	  swal({
		  title: "٩(இ ⌓ இ๑)۶",
		  text: "탈퇴해도 작성한 노트 및 드래그, 게시글, 댓글은 삭제되지 않으며 동일한 Email로는 재가입이 불가능합니다.",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "회원탈퇴",
		  cancelButtonText: "cancel",
		  closeOnConfirm: false,
		  closeOnCancel: true
		},
			function(isConfirm) {
		 		 if (isConfirm) {
					  $.ajax({
			       		type : 'post',
			        	data: {userEmail:userEmail},
			        	url :  '${pageContext.request.contextPath}/member/deleteMember.do',
			        	success : function(data) {
								 swal({type: "success",
								 title: "٩(இ ⌓ இ๑)۶",
								 text: "회원 탈퇴가 완료되었습니다.",
				             	 confirmButtonClass : "btn-danger",
							 	 closeOnConfirm: false
									},
								 function(){
								 location.href="${pageContext.request.contextPath}/logout";
									});	
				       			},
						error : function(error) {
			          			 swal("٩(இ ⌓ இ๑)۶", "에러가 발생했습니다.", "error");
			           	  	 	console.log(error);
			           		 	console.log(error.status);
			       				}
			    		})
		  		} else {
		    		return false;
		  			}
		});
})

</script>