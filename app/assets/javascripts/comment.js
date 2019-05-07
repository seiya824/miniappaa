$(function(){
  function buildHTML(comment){
    var html = `<div class="card">
                  <div class="card-body">
                    <p>${comment.text}</p>
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data)
      var html = buildHTML(data);
      $('.comment__show').append(html)
      $('.textbox').val('')
      $('.form-send').prop('disabled', false)
    })
    .fail(function(){
      alert('error');
    })
  })
});