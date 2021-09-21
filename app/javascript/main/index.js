jQuery(function () {
	// 瀏覽Stork 列表收合
	$(".browse-stork").on("click", function (e) {
		toggleList("caret-browse-stork","dropdown-stork-list");
	});

	$(".browse-channels").on("click", function(e){
		toggleList("caret-browse-channel","space-channel-list");
	});

	$(".browse-users").on("click", function(e){
		toggleList("caret-browse-msg","space-users-list");
	});

	$("#open-all-channels").on("click", function(e){
		// alert(2);
	});

	// TODO  私訊右邊＋號，跟點擊所有私訊 開啟同樣的畫面
  // TEST
	$("#open-all-messages").on("click", function(e){
		// alert(1);
	});

	$(".invite-user").on("click",function(e){
		// alert(3);
		// pop up 邀請使用者
	});

});


function toggleList(caret,targetList){
	$(`#${caret}`).css({"transition":"transform 0.1s"});
	if($(`#${targetList}`).is(":visible")){
		$(`#${caret}`).css({"transform":"rotate(-90deg)"});
	} else {
		$(`#${caret}`).css({"transform":"rotate(0deg)"});                
	}  
	$(`#${targetList}`).slideToggle();
}


function switchPanel(){

}