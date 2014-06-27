$(document).ready( function(){
  $('.commentform').hide();
  $('.answerform').hide();
  $('.answercommentform').hide();
  $('.addAnswer').on("click",function(event){
    event.preventDefault();
    $('.answerform').show();
    $('.addAnswer').hide();
  });
  $('.addComment').on("click",function(event){
    event.preventDefault();
    $('.commentform').show();
    $('.addComment').hide();
  });
  $('.addAnswerComment').on("click",function(event){
    event.preventDefault();
    console.log($(this).data('form-id'))
    $('#'+$(this).data('form-id') + '.answercommentform').show();
    $('.addAnswerComment').hide();
  });
  $('.answerform').on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();

    var question_id = $(this).attr('id');
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
  $('.commentform').on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();
    var question_id = $(this).attr('id');
    var url =  '/questions/' + question_id +'/comments';
    $.post(url, data, function(response){
      $('.commentform')[0].reset();
      $('.commentform').hide();
      $('.addComment').show();
      $('.comments').prepend(response);

    }).fail(function(response) {
    console.log(response)
  });

  });
  $('.answercommentform').on('submit', function(event){
      event.preventDefault();
      var data = $(this).serialize();
      var url = $(this).context.action;
      var that = this
      $.post(url,data,function(response){
        $(that)[0].reset();
      $('.answercommentform').hide();
      $('.addAnswerComment').show();
      console.log($(that).next());
      $(that).next().prepend(response);
      })
  })

});
