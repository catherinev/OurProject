$(document).ready( function(){
  $('.answerform').hide();
  $('.addAnswer').on("click",function(event){
    event.preventDefault();
    $('.answerform').show();
    $('.addAnswer').hide();
  });
  $('.answerform').on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();
    var question_id = $(this).attr('id')
    var url =  '/questions/' + question_id+'/answers';
    $.post(url, data, function(response){
      alert(response.content);

    });
  });
});
