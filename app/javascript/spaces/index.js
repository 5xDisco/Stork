jQuery(function() {
    $("#inp_space_name").on("input",function(e){
        $("#new-space-name").html($(this).val());
    });
 });
