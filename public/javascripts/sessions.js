window.onload = initDate;

function initDate()
{
    document.getElementsByName('username').item(0).focus();
    var lang='';
    detectLanguage();
    var now = new Date();
    document.getElementById("greeting").innerHTML = timeString(now.getHours());
}

function detectLanguage()
{
    var selectedLang=$("#set_locale").val();
    switch (selectedLang)
    {
        case 'zh-CN':
            lang='zh-CN';
            break;
        default:
            lang='en';
            break;
    }
}

function timeString(theHour)
{
    if (theHour < 12)
    {
        //return "Good morning.";
        switch(lang)
        {
            case 'zh-CN':
                return "上午好.";
                break;
            default:
                return "Good morning.";
                break;
        }
    }
    if (theHour < 19)
    {
        //return "Good afternoon.";
        switch(lang)
        {
            case 'zh-CN':
                return "下午好.";
                break;
            default:
                return "Good afternoon.";
                break;
        }
    }
    //return "Good Evening.";
    switch(lang)
    {
        case 'zh-CN':
            return "晚上好.";
            break;
        default:
            return "Good evening.";
            break;
    }
}


$(document).ready(function(e)
{
/*
    $(":submit[id=login_submit]").click(function()
    {
        $.post('signin.php',{'username':$('#username').val(),'password':$('#password').val(),'tzo':$('#timezone').val(),'dst':$('#daylightSavingTime').val()},function(data)
        {
            //alert(data.loginInfoValid);
            if(data.loginInfoValid==1) // login successful
            {
                switch(data.role)
                {
                    case 'insernalSettingUser':
                        window.location.href='internal/setting.php?did='+data.did+'&frominternal='+data.frominternal;
                        break;
                    case 'superuser':
                        window.location.href='superuser.php?did='+data.did+'&sid=0&frominternal='+data.frominternal;
                        break;
                    case 'PI':
                        window.location.href='superuser.php?did='+data.did+'&sid=0&frominternal='+data.frominternal;
                        break;
                    case 'else':
                        if(data.firstloadpage==1) window.location.href='dashboard.php?did='+data.did+'&tabid=1&frominternal='+data.frominternal;
                        else if(data.firstloadpage==2) window.location.href='dashboard.php?did='+data.did+'&tabid=2&frominternal='+data.frominternal;
                        else window.location.href='dashboard.php?did='+data.did+'&tabid=1&frominternal='+data.frominternal;
                        break;
                    default:
                        break;
                }
            }
            else // data.loginInfoValid==1, login failed
            {
                $('#login_error').css('visibility','visible');
                //$("input#uname_forget").val('');
                //$("input#email_forget").val('');
                //$('#forget_popup').slideUp(1000);
            }
        },'json');
    });
*/

    $('#forget').click(function()
    {
        var height=$("#forget_popup").outerHeight();
        var width=$("#forget_popup").outerWidth();
        var top=$("#forget").offset().top;
        var left=$("#forget").offset().left;
        $("#forget_popup").css("top", (top-height-5));
        $("#forget_popup").css("left", (left-(width/4)));
        $("#retrieve_password").removeAttr('disabled');
        $("#cancel_it").removeAttr('disabled');
        $("#sending").hide();
        $("#forget_popup").slideDown(600);
    });
/*
    $('#retrieve_password').click(function()
    {
        var uname=$("input#uname_forget").val();
        var email=$("input#email_forget").val();
        //alert(uname);
        //alert(email);
        if( uname && email)
        {
            $("#retrieve_password").attr('disabled','true');
            $("#cancel_it").attr('disabled','true');
            $("#sending").show();

            $.post('emailTest.php',{'uname':uname,'email':email},function(data)
            {
                alert(data.confirmation);
                $("input#uname_forget").val('');
                $("input#email_forget").val('');
                $('#forget_popup').slideUp(1000);
            },'json');
        }
        else
        {
            alert('Please enter a valid username and email address to retrieve your password.');
            //$("input#uname_forget").val('');
            //$("input#email_forget").val('');
        }
    });
*/

    $("#retrieve_password").click(function(){
        $("#retrieve_password").attr('disabled','true');
        $("#cancel_it").attr('disabled','true');
        var uname=$("input#uname_forget").val();
        var email=$("input#email_forget").val();
        if(uname && email) $("#sending").show();
        $.ajax({
            type: 'POST',
            url: '/users/retrieve_password',
            //url: '<%= retrieve_password_path %>', # this way does not work
            data: {username:uname,email:email},
            dataType: 'json',
            success: function(data)
            {
                switch(lang)
                {
                    case 'zh-CN':
                        if(data.send['b']) alert("您的密码已经发送至您的注册邮箱");
                        else alert("请输入有效的用户名和注册邮箱来找回密码");
                        break;
                    default:
                        alert(data.send['a']);
                        break;
                }
                //alert(data.send['a']);
                //alert(data.send['b']);
                //alert(data.save);
                $("input#uname_forget").val('');
                $("input#email_forget").val('');
                $('#forget_popup').slideUp(1000);
            }
            /*
            ,
            error: function(data)
            {
                alert(data);
                $("input#uname_forget").val('');
                $("input#email_forget").val('');
                $('#forget_popup').slideUp(1000);
            }*/
        });
        //return false      // very important?  (stops general submit)
    });

    $('#cancel_it').click(function()
    {
        $("input#uname_forget").val('');
        $("input#email_forget").val('');
        $("#forget_popup").slideUp(1000);
    });
});