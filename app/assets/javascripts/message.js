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
    var $form = $(this);
    e.preventDefault();
    var fd = new FormData($(this)[0]);
    $.ajax({
      url: document.location.href + '.json',
      method: 'POST',
      processData: false,
      contentType: false,
      data: fd,
      dataType: 'json'
    })
    // console.log(json)
    .done(function(json) {
      var html = buildHTML(json);
      $('.right-content__contents').append(html);
      alert("通信に成功しました");

    })
    .fail(function() {
      alert("エラーが発生しました");
    });
  });
});

