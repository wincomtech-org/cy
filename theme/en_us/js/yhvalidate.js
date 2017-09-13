$(document).ready(function(){
//登录找回密码验证
	$(".lr-form input[type='text'],.lr-form input[type='password']").each(function(){
		$(this).next(".error").text("");
		$(this).focus(function(){
			$(this).next(".error").text("");
		})
	});

	// 用户名正则表达式
	var enlnamereg=/^[a-zA-Z0-9_-]{3,50}$/;
	// 中文姓名正则表达式
	var zhnamereg=/^[\u4e00-\u9fa5]{1,50}$/;
	var namecheck = /[\\\~@$%^&=+{};'\"<>\/]/;
	// 密码正则表达式
	var passwordreg=/^[a-zA-Z0-9_-]{5,18}$/;
	// 手机号码正则表达式
	var telereg=/^1[34578]\d{9}$/;
	// 电子邮箱正则表达式
	var emailreg=/\w+[@]{1}\w+[.]\w+/;
	// 字母正则表达式
	var commonreg=/^[a-zA-Z]{1,50}$/;

	//失去焦点验证
	$(".lr-form input[type='text'],.lr-form input[type='password']").blur(function(){
		if($(this).is("#username")){
			var name=$("#username").val();
			if(enlnamereg.test(name)){
				$("#username").next(".error").text("");
			} 
			else{
				$("#username").next(".error").text("Format error");
			}
			if(name==""||name==null){
				$("#username").next(".error").text("Can`t be empty");
			}
		}
		if($(this).is("#password")){
			var password=$("#password").val();
			if(passwordreg.test(password)){
				$("#password").next(".error").text("");
			} 
			else{
				$("#password").next(".error").text("Format error");
			}
			if(password==""||password==null){
				$("#password").next(".error").text("Can`t be empty");
			}
		}
		if($(this).is("#email")){
			var email=$("#email").val();
			if(emailreg.test(email)){
				$("#email").next(".error").text("");
			} 
			else{
				$("#email").next(".error").text("Format error");
			}
			if(email==""||email==null){
				$("#email").next(".error").text("Can`t be empty");
			}
		}
		if($(this).is("#captcha")){
			var captcha=$("#captcha").val();
			if(captcha==""||captcha==null){
				$("#captcha").nextAll(".error").text("Can`t be empty");
			}	
			else{				
				$("#captcha").nextAll(".error").text("");
			}		
		}
	});

	//登录表单提交验证
	$("#login").click(function(){
		var status=true;
		var email=$("#email").val();
		if(!emailreg.test(email)){
			$("#email").next(".error").text("Format error");
			status=false;
		}
		if(email==""||email==null){
			$("#email").next(".error").text("Can`t be empty");
			status=false;
		}

		var password=$("#password").val();
		if(!passwordreg.test(password)){
			$("#password").next(".error").text("Format error");
			status=false;
		}
		if(password==""||password==null){
			$("#password").next(".error").text("Can`t be empty");
			status=false;			
		}

		var captcha=$("#captcha").val();
		if(captcha==""||captcha==null){
			$("#captcha").nextAll(".error").text("Can`t be empty");
			status=false;			
		}
		if (status) { douSubmit('loginform'); } else { return status; }
	});

	//找回密码表单提交验证
	$("#send").click(function(){
		var status=true;
		var email=$("#email").val();
		if(!emailreg.test(email)){
			$("#email").next(".error").text("Format error");
			status=false;
		}
		if(email==""||email==null){
			$("#email").next(".error").text("Can`t be empty");
			status=false;			
		}

		var captcha=$("#captcha").val();
		if(captcha==""||captcha==null){
			$("#captcha").nextAll(".error").text("Can`t be empty");
			status=false;
		}			
		if (status) { douSubmit('pwd_reset_form'); } else { return status; }
	});


	/*注册咨询验证*/
	$("#reg-form input[type='text'],#reg-form input[type='password']").each(function(){
		$(this).parents(".rc-row").find(".error").text("").hide();
		$(this).focus(function(){
			$(this).parents(".rc-row").find(".error").text("").hide();
		})
	});
	
	//填写时，失去焦点验证
	$("#reg-form input[type='text'],#reg-form input[type='password'],#reg-form textarea").blur(function(){
		if($(this).is("#firstname")){
			var fname=$("#firstname").val();
			if(commonreg.test(fname)){
				$("#firstname").parents(".rc-row").find(".error").text("").show();
			} 
			else{
				$("#firstname").parents(".rc-row").find(".error").text("Firstname format error").show();
			}
			if(fname==""||fname==null){
				$("#firstname").parents(".rc-row").find(".error").text("Firstname Can`t be empty").show();
			}
		}
		if($(this).is("#lastname")){
			var lname=$("#lastname").val();
			if(commonreg.test(lname)){
				$("#lastname").parents(".rc-row").find(".error").text("").show();
			} 
			else{
				$("#lastname").parents(".rc-row").find(".error").text("Lastname format error").show();
			}
			if(lname==""||lname==null){
				$("#lastname").parents(".rc-row").find(".error").text("Lastname Can`t be empty").show();
			}
		}
		if($(this).is("#password")){
			var password=$("#password").val();
			if(passwordreg.test(password)){
				$("#password").parents(".rc-row").find(".error").text("").show();
			} 
			else{
				$("#password").parents(".rc-row").find(".error").text("Format error").show();
			}
			if(password==""||password==null){
				$("#password").parents(".rc-row").find(".error").text("Can`t be empty").show();
			}
		}
		if($(this).is("#repassword")){
			var password=$("#password").val();
			var repassword=$("#repassword").val();
			if(passwordreg.test(repassword)||repassword==password){
				$("re#password").parents(".rc-row").find(".error").text("").show();
			} 
			else{
				$("#repassword").parents(".rc-row").find(".error").text("Format error").show();
			}
			if(repassword==""||repassword==null){
				$("#repassword").parents(".rc-row").find(".error").text("Can`t be empty").show();
			}
		}
		if($(this).is("#email")){
			var email=$("#email").val();
			if(emailreg.test(email)){
				$("#email").parents(".rc-row").find(".error").text("").show();
			} 
			else{
				$("#email").parents(".rc-row").find(".error").text("Format error").show();
			}
			if(email==""||email==null){
				$("#email").parents(".rc-row").find(".error").text("Can`t be empty").show();
			}
		}
		if($(this).is("#telephone")){
			var telephone=$("#telephone").val();
			if(telereg.test(telephone)){
				$("#telephone").parents(".rc-row").find(".error").text("").show();
			} 
			else{
				$("#telephone").parents(".rc-row").find(".error").text("Format error").show();
			}
			if(telephone==""||telephone==null){
				$("#telephone").parents(".rc-row").find(".error").text("Can`t be empty").show();
			}
		}
		if($(this).is("#message")){
			var message=$("#message").val();
			if(message==""||message==null){
				$("#message").parents(".rc-row").find(".error").text("Can`t be empty").show();
			}
		}
		if($(this).is("#company")){
			var company=$("#company").val();
			if(company==""||company==null){
				$("#company").parents(".rc-row").find(".error").text("Can`t be empty").show();
			}
		}
		if($(this).is("#postcode")){
			var postcode=$("#postcode").val();
			if(postcode==""||postcode==null){
				$("#postcode").parents(".rc-row").find(".error").text("Can`t be empty").show();
			}
		}
		if($(this).is("#address")){
			var address=$("#address").val();
			if(address==""||address==null){
				$("#address").parents(".rc-row").find(".error").text("Can`t be empty").show();
			}
		}

	});

	//注册表单提交验证
	$("#register").click(function(){
		var status=true;
		//判断单选框是否选择
		if($("#reg-form input[name='sex']:checked").size()!=0){
			$("#reg-form input:radio").parents(".rc-row").find(".error").text("");
		}
		else{
			$("#reg-form input:radio").parents(".rc-row").find(".error").text("You have to choose one").show();
			status=false;
		}

		if($("#rule").is(":checked")){
			$("#register").prev(".error").text("");
		}
		else{
			$("#register").prev(".error").text("You have to agree").show();
			status=false;
		}
		
		$("#reg-form input[type='text'],#reg-form input[type='password'],#reg-form textarea").each(function(){
			if($(this).is("#firstname")){
				var fname=$("#firstname").val();
				if(commonreg.test(fname)){
					$("#firstname").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#firstname").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			}
			if($(this).is("#lastname")){
				var lname=$("#lastname").val();
				if(commonreg.test(lname)){
					$("#lastname").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#lastname").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			}
			if($(this).is("#password")){
				var password=$("#password").val();
				if(passwordreg.test(password)){
					$("#password").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#password").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			}
			if($(this).is("#repassword")){
				var password=$("#password").val();
				var repassword=$("#repassword").val();
				if(passwordreg.test(repassword)||repassword==password){
					$("re#password").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#repassword").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			}
			if($(this).is("#email")){
				var email=$("#email").val();
				if(emailreg.test(email)){
					$("#email").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#email").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			}
			if($(this).is("#telephone")){
				var telephone=$("#telephone").val();
				if(telereg.test(telephone)){
					$("#telephone").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#telephone").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			}
		 	if($(this).val()==""||$(this).val()==null){
				$(this).parents(".rc-row").find(".error").text("Can`t be empty").show();
				status=false;
			}

		});

		$("#reg-form select").each(function(){
			if($(this).val()=="0"){
				$(this).parents(".rc-row").find(".error").text("please select").show();
				status=false;				
			}
		});
		if (status) { douSubmit('reg-form'); } else { return status; }
	});


	// 咨询表单提交
	$("#consultate").click(function(){
		var status=true;
		//判断单选框是否选择
		if($("#cons-form input[name='sex']:checked").size()!=0){
			$("#cons-form input:radio").parents(".rc-row").find(".error").text("");
		}
		else{
			$("#cons-form input:radio").parents(".rc-row").find(".error").text("You have to choose one").show();
			status=false;
		}
		
		$("#cons-form input[type='text'],#cons-form input[type='password'],#cons-form textarea").each(function(){
			if($(this).is("#firstname")){
				var fname=$("#firstname").val();
				if(commonreg.test(fname)){
					$("#firstname").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#firstname").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			 	if($(this).val()==""||$(this).val()==null){
					$(this).parents(".rc-row").find(".error").text("Can`t be empty").show();
					status=false;
				}
			}
			if($(this).is("#lastname")){
				var lname=$("#lastname").val();
				if(commonreg.test(lname)){
					$("#lastname").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#lastname").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			 	if($(this).val()==""||$(this).val()==null){
					$(this).parents(".rc-row").find(".error").text("Can`t be empty").show();
					status=false;
				}
			}
			if($(this).is("#password")){
				var password=$("#password").val();
				if(passwordreg.test(password)){
					$("#password").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#password").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			 	if($(this).val()==""||$(this).val()==null){
					$(this).parents(".rc-row").find(".error").text("Can`t be empty").show();
					status=false;
				}
			}
			if($(this).is("#repassword")){
				var password=$("#password").val();
				var repassword=$("#repassword").val();
				if(passwordreg.test(repassword)||repassword==password){
					$("re#password").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#repassword").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			 	if($(this).val()==""||$(this).val()==null){
					$(this).parents(".rc-row").find(".error").text("Can`t be empty").show();
					status=false;
				}
			}
			if($(this).is("#email")){
				var email=$("#email").val();
				if(emailreg.test(email)){
					$("#email").parents(".rc-row").find(".error").text("").show();
				} 
				else{
					$("#email").parents(".rc-row").find(".error").text("Format error").show();
					status=false;
				}
			 	if($(this).val()==""||$(this).val()==null){
					$(this).parents(".rc-row").find(".error").text("Can`t be empty").show();
					status=false;
				}
			}
		});
		if (status) { douSubmit('reg-form'); } else { return status; }
	});
});
