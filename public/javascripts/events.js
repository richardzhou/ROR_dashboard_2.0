$(document).ready(function(e)
{
    //alert(1);
    $(".left_navigation_tab").click(function(){
        current_nav_tab_id=$(this).attr("id");
        current_nav_tab=current_nav_tab_id.slice(-1);
        current_content_page=current_nav_tab;
        $(".left_navigation_tab").each(function(){$(this).attr('class','left_navigation_tab')});
        $(this).addClass('current_tab');
        $(".right_content_pane").each(function(){$(this).attr('class','right_content_pane')});
        current_content_page_id="right_content_page"+current_content_page
        $("#"+current_content_page_id).addClass('current_pane');
    });
});

function showhelp()
{
    $("#help_dropdown").slideToggle(1000);
}

function labelChange(a) // for switching the content pane by clicking the left navigation tab
{
    for(i=1;i<=$(".leftinner").length;i++)
    {
        var u="label"+i;
        document.getElementById(u).setAttribute("class", "leftinner");
    }
    var v="label"+a;
    document.getElementById(v).setAttribute("class", "leftinner current");

    for(j=1;j<=$("#result").children("div").length;j++)
    {
        document.getElementById("middle"+j).style.display="none";
    }
    document.getElementById("middle"+a).style.display="block";
    //$('#middle'+a).fadeIn(500);
    sizePLTable(); //used to size table elements in patient list
}