$(function(){
  function buildHTML(message) {
    var html = $('<li class="ul.right-content__contents__messages">').append(message);
    return html;
  }

  $('.right-content__footer').on('submit', function(e) {
    e.preventDefault();
    message = $('.right-content__footer__message-form').val();
    console.log(message);
  });
});
