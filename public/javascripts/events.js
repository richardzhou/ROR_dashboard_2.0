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

function showHelp()
{
    $("#help_dropdown").slideToggle(1000);
}