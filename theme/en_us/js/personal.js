
// 用户头像上传预览 
function preview(file)  
{  
    // console.log(this.files)
    var prevDiv = document.getElementById("preview");  
    if (file.files && file.files[0]) {  
        var reader = new FileReader();  
        reader.onload = function(evt) {  
            prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';  
        }    
        reader.readAsDataURL(file.files[0]);  
    } else {  
        prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';  
    }  
};



// 个人资料编辑
// 用户名正则表达式
var enlnamereg=/^[a-zA-Z0-9_-]{3,50}$/;
// 中文姓名正则表达式
var zhnamereg=/^[\u4e00-\u9fa5]{1,50}$/;
var namecheck = '';
// 密码正则表达式
var passwordreg=/^[a-zA-Z0-9_-]{5,18}$/;
// 手机号码正则表达式
var telereg=/^1[34578]\d{9}$/;
var telcheck = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
// 电子邮箱正则表达式
var emailreg=/\w+[@]{1}\w+[.]\w+/;
var emailcheck = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
// 字母正则表达式
var commonreg=/^[a-zA-Z]{1,50}$/;

function ff1(){
    var qw=$("#nkname").val();
    if(qw!=""){ $("#o1").text("Format OK");return true;}
    else{$("#o1").text("Can`t be empty");return false;}
}
function ff2(){
    var qw=$("#rlname").val();
    if(qw!=""){ $("#o2").text("Format OK");return true;}
    else{$("#o2").text("Can`t be empty");return false;}
}
function ff3(){
    var qw=$("#pe").val();
    var Reg = qw.match(telcheck);
    if(Reg==null){ $("#o3").text("Format error");return false;}
    else{$("#o3").text("Format OK");return true;}
}
function ff4(){
    var qw=$("#mailb").val();
    var Reg = qw.match(emailcheck);
    if(Reg==null){ $("#o4").text("Format error");return false;}
    else{$("#o4").text("Format OK");return true;}
}
function ff5(){
    var qw=$("#contact").val();
    var eng = qw.match(enlnamereg);
    var zh = qw.match(zhnamereg);
    if(eng==null && zh==null){ $("#o4").text("Format error");return false;}
    else{$("#o4").text("Format OK");return true;}
}
function send(){
    // return (ff1()&&ff2()&&ff3()&&ff4()&&ff5());
    var ststus = ff1()&&ff2()&&ff3()&&ff4()&&ff5();
    if (status) { douSubmit('usereditform'); } else { return status; }
};

// 修改密码
function oldpassw(){
    var pw=$("#oldpw").val().length;
    if(pw>5&&pw<9){ $("#om1").text("Format OK");return true; }
    else{ $("#om1").text("Format error");return false; }

};
function newpassw1(){
    var pw=$("#newpw1").val().length;
    if(pw>5&&pw<9){ $("#om2").text("Format OK");return true; }
    else{ $("#om2").text("Format error");return false; }
};
function newpassw2(){
    var pw1=$("#newpw1").val();
    var pw2=$("#newpw2").val();
    if(pw1==pw2){
        $("#om3").text("uniform excitation");return true;
    }else{ 
        $("#om3").text("non-uniform excitation");return false; 
    }
};
function send1(){
    var ststus = oldpassw()&&newpassw1()&&newpassw2();
    if (status) { douSubmit('userpasswordform'); } else { return status; }
};



// 订单打印 全选
$(".per-list").delegate(".per-li","click",function(){
    // var dd=$(this).find("input[name='ids']:checkbox");
    var dd=$(this).find("input").eq(0);
    var as=$(this).children("label");
    var ds=$(dd).prop("checked");
    if(ds){ $(this).children("label").addClass("ck");}
    else{ $(this).children("label").removeClass("ck");}
});

// 订单列表图片控制
var cartimg=$(".per-li img").height();
$(".per-li label").height(cartimg);


