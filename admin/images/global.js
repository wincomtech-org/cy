/**
 +----------------------------------------------------------
 * 页面加载时运行
 +----------------------------------------------------------
 */
$(function() {
    // 下来菜单
    $('.M').hover(function() {
        $(this).addClass('active');
    },
    function() {
        $(this).removeClass('active');
    });
});

/**
 +----------------------------------------------------------
 * 刷新验证码
 +----------------------------------------------------------
 */
function refreshimage() {
    var cap = document.getElementById('vcode');
    cap.src = cap.src + '?';
}

/**
 +----------------------------------------------------------
 * 无组件刷新局部内容
 +----------------------------------------------------------
 */
function dou_callback(page, name, value, target) {
    $.ajax({
        type: 'GET',
        url: page,
        data: name + '=' + value,
        dataType: "html",
        success: function(html) {
            $('#' + target).html(html);
        }
    });
}
/*
* 权限管理
    --角色与用户
    --角色与模块
*/
$(function(){
    //选中默认角色
    // alert(window.location.href);//http://tx.ext2/admin/rbac.php?rec=awr
    rbac_xuan();
    //当用户选中变化的时候，去选中相应角色
    $("#selthis").change(function(){
        rbac_xuan();
    })
    //点击确定保存角色信息
    $("#btn").click(function(){
        var href = $('#return_url').val(),
            rid = $("#selthis").val(),
            lokey = $('#lokey').val();
        var rlabel = '';
        var ck = $(".ck");
        for(var i=0;i<ck.length;i++) {
            if(ck.eq(i).prop("checked")) {
                rlabel += ck.eq(i).val()+"|";
            }
        }
        rlabel = rlabel.substr(0,rlabel.length-1);
        $.ajax({
            url:href,
            data:{rid:rid,rlabel:rlabel,lokey:lokey,mark:2},
            type:"POST",
            dataType:"TEXT",
            success: function(result) {
                if (result) {
                    // console.log(result);
                    $('#msgtips').css('color', '#2C9533');
                    $('#msgtips').html('提交成功，请等待页面刷新……');
                    setTimeout(function(){window.location.replace(location.href);},1000);
                } else {
                    // console.log('保存失败！');
                    $('#msgtips').css('color', '#F00');
                    $('#msgtips').html('提交失败，请等待页面刷新……');
                    setTimeout(function(){window.location.replace(location.href);},1000);
                }
            }
        });
    })
});
function rbac_xuan(obj='selthis',href='') {
    var href = $('#return_url').val(),
        rid = $("#selthis").val(),
        lokey = $('#lokey').val();
    $.ajax({
        url: href,
        data: {rid:rid,lokey:lokey,mark:1},
        type: 'POST',
        // dataType: 'html',// xml, json, script, html
    })
    .done(function(result) {
        // console.log(result);
        var ck = $(".ck");
        ck.prop("checked",false);
        if (result) {
            var rlabel = result.trim().split('|');
            for(var i=0;i<ck.length;i++) {
                // console.log(rlabel.indexOf());// return -1 0 1
                if(rlabel.indexOf(ck.eq(i).val())>=0) {
                    ck.eq(i).prop("checked",true);
                }
            }
        }
    })
    .fail(function() {
        // console.log("错误error");
        $('#msgtips').css('color', '#F00');
        $('#msgtips').html('提交失败，请等待页面刷新……');
        setTimeout(function(){window.location.replace(location.href);},500);
    })
    .always(function() {
        // console.log("无论成功或失败complete");
    });
}

/**
 +----------------------------------------------------------
 * 表单全选
 +----------------------------------------------------------
 */
function selectcheckbox(form) {
    for (var i = 0; i < form.elements.length; i++) {
        var e = form.elements[i];
        if (e.name != 'chkall' && e.disabled != true) e.checked = form.chkall.checked;
    }
}

/**
 +----------------------------------------------------------
 * 显示服务端扩展列表
 +----------------------------------------------------------
 */
function get_cloud_list(unique_id, get, localsite) {
    $.ajax({
        type: 'GET',
        url: 'http://cloud.Lothar.com/extend&rec=client',
        data: {'unique_id':unique_id, 'get':get, 'localsite':localsite},
        dataType: 'jsonp',
        jsonp: 'jsoncallback',
        success: function(cloud) {
            $('.selector').html(cloud.selector)
            $('.cloudList').html(cloud.html)
            $('.pager').html(cloud.pager)
        }
    });
}

/**
 +----------------------------------------------------------
 * 写入可更新数量
 +----------------------------------------------------------
 */
function cloud_update_number(localsite) {
    $.ajax({
        type: 'GET',
        url: 'http://cloud.Lothar.com/extend&rec=cloud_update_number',
        data: {'localsite':localsite},
        dataType: 'jsonp',
        jsonp: 'jsoncallback',
        success: function(cloud) {
            change_update_number(cloud.update, cloud.patch, cloud.module, cloud.plugin, cloud.theme, cloud.mobile)
        }
    });
}

/**
 +----------------------------------------------------------
 * 修改update_number值
 +----------------------------------------------------------
 */
function change_update_number(update, patch, module, plugin, theme, mobile) {
    $.ajax({
        type: 'POST',
        url: 'cloud.php?rec=update_number',
        data: {'update':update, 'patch':patch, 'module':module, 'plugin':plugin, 'theme':theme}
    });
}

/**
 +----------------------------------------------------------
 * 弹出窗口
 +----------------------------------------------------------
 */
function douFrame(name, frame, url ) {
    $.ajax({
        type: 'POST',
        url: url,
        data: {'name':name, 'frame':frame},
        dataType: 'html',
        success: function(html) {
            $(document.body).append(html);
        }
    });
}

/**
 +----------------------------------------------------------
 * 显示和隐藏
 +----------------------------------------------------------
 */
function douDisplay(target, action) {
    var traget = document.getElementById(target);
    if (action == 'show') {
        traget.style.display = 'block';
    } else {
        traget.style.display = 'none';
    }
}

/**
 +----------------------------------------------------------
 * 清空对象内HTML
 +----------------------------------------------------------
 */
function douRemove(target) {
    var obj = document.getElementById(target);
    obj.parentNode.removeChild(obj);
}

/**
 +----------------------------------------------------------
 * 无刷新自定义导航名称
 +----------------------------------------------------------
 */
function change(id, choose) {
    document.getElementById(id).value = choose.options[choose.selectedIndex].title;
}