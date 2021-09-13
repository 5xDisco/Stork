jQuery(function() {
    $("#inp-space-name").on("input",function(e){
        $("#new-space-name").html($(this).val());
    });
 });
