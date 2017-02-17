
$( document ).ready(function() {
   var form = $('.form-question')

form.submit(function(event) {
  event.preventDefault();
    $.ajax({
    type: 'POST',
    url: '/question/new',
    dataType: "JSON",
    data: form.serialize(),
    success:function(data){
      // successful request; do something with the data
      debugger;
      $('.table').append("<tr><th scope=row>1</th><td>"+ data.created_at + "</td><td><a href=/questions/"+ data.id + ">" + data.text + "</a></td></td></tr>")<td><form action="/questions/"+ data.id +"/destroy" method="post"><button class="btn btn-lg btn-primary btn-block" type="submit">Delete</button></form></td>
    },
    error:function(){
      // failed request; give feedback to user
      $('#ajax-panel').html('<p class="error"><strong>Oops!</strong> Try that again in a few moments.</p>');
    }
  });
});
});

