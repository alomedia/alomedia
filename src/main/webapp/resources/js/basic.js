$(".delete").click(function() {
	var id = $(this).attr('id');
	
	var choice = confirm(id + "번 계정을 정말 삭제하시겠습니까?");
	
	if (!choice) {
	    event.preventDefault();
	    return;
  	}
	
});
