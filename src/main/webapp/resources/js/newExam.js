var idx = 1;

$(document).on('click', '.addContent', function (e) {
  var newContent = `
    <li id='q${idx}'>
      <div class="row">
        <div class="col-md mb-3">
          <input type="hidden" class="form-control" name="exams[${idx}].questionNum" value="1">
          <textarea class="form-control" placeholder="문제 : " name="exams[${idx}].examContent" rows="3" required></textarea>
        </div>
        <div class="col-md-2 mb-3">
          <input type="number" class="form-control" name="exams[${idx}].examAllotment" placeholder="배점" required>
		  <div class="mt-2">
				<input type="button" class="btn btn-danger deleteContent" value="삭제"  >
		  </div>
        </div>
      </div>
    </li>
  <div class="mt-2">
    <input type="button" class="btn btn-primary addContent" value="문제 추가">
  </div>
  `;

  //$(this).closest('li').after(newContent);
  $(this).remove();
  $("#question").append(newContent);
  idx++; // Increment cnt for the next question
});

$(document).on('click', '.deleteContent', function (e) {
      var cnt = $(this).next().val();
      $(this).parent().parent().parent().parent().remove();
 })

document.addEventListener('DOMContentLoaded', function() {
  var form = document.getElementById('exam');

  form.addEventListener('submit', function(event) {
    var idx = $('#question>li').length; // Update idx inside the submit event handler
    var totalScore = 0;
    console.log("테스트");

    for (var i = 0; i < idx; i++) {
      totalScore += Number(document.getElementsByName('exams[' + i + '].examAllotment')[0].value);
    }

    if (totalScore != 100) {
      event.preventDefault();
      alert('총 점수가 ' + totalScore + '점 입니다.\n100점으로 설정해주세요.');
    }
  });
});