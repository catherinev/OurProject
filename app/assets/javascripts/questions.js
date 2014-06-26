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
    var url =  '/questions/' + question_id +'/answers';
    $.post(url, data, function(response){
      console.log(response);
      $('.answerform')[0].reset();
      $('.answerform').hide();
      $('.addAnswer').show();
      $('.answers').prepend(response);

    }).fail(function(response) {
    console.log(response)
  });

  });
});
