$(function(){

// メッセージのHTMLを組み立て
  function buildHTML(message) {
    var html =
      '<ul class="right-content__contents__messages">' +
      '<li class="right-content__contents__messages__user-name">' +
         message.name +
      '</li>' +
      '<li class="right-content__contents__messages__date">' +
         message.time +
      '</li>' +
      '<li class="right-content__contents__messages__each-message">' +
         message.body +
      '</li>' +
      '</ul>';
    return html
  }

// フォーム送信の非同期化
  $('#new_message').submit(function(e) {
    e.preventDefault();
    var fd = new FormData($(this)[0]);
    $.ajax({
      type: 'POST',
      url: document.location.href,
      data: fd,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data.message);
      $('.right-content__contents').append(html);
    })
    .fail(function() {
      alert("エラーが発生しました");
    });
  });
  return false;
});

