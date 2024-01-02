$(".reset").click(function() {
	var id = $(this).attr('id');
	
	var choice = confirm(id + "번 계정의 비빌번호를 초기화하시겠습니까?");
	
	if (!choice) {
	    event.preventDefault();
	    return;
  	}
	
});