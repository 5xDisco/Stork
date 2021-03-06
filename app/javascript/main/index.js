document.addEventListener("turbolinks:load", function() {
	// Stork 列表收合
	$(".browse-stork").on("click", function (e) {
		toggleList("caret-browse-stork","dropdown-stork-list");
	});

	$(".browse-channels").on("click", function(e){
		toggleList("caret-browse-channel","space-channel-list");
	});

	$(".browse-users").on("click", function(e){
		toggleList("caret-browse-msg","space-users-list");
	});

	
	$(".browse-apps").on("click", function(e){
		toggleList("caret-browse-app","app-list");
	});


	$("#btn-toggle-sidebar").on("click", function(e){
		e.stopPropagation();
		$(".space-channels-panel").toggle();
		$(".space-icons-panel").toggle();
	});

})


function toggleList(caret,targetList){
	$(`#${caret}`).css({"transition":"transform 0.1s"});
	if($(`#${targetList}`).is(":visible")){
		$(`#${caret}`).css({"transform":"rotate(-90deg)"});
	} else {
		$(`#${caret}`).css({"transform":"rotate(0deg)"});                
	}  
	$(`#${targetList}`).slideToggle();
}




