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
    return html;
  };

// フォーム送信の非同期化
  $('.right-content__footer').submit(function(e) {
    var $form = $(this);
    e.preventDefault();
    var fd = new FormData($(this)[0]);
    $.ajax(document.location.href + '.json',{
      method: 'POST',
      processData: false,
      contentType: false,
      data: fd,
      dataType: 'json',
      success: function(json) {
        var html = buildHTML(json);
        $('.right-content__contents').append(html);
      },
      error: function(json) {
        alert("エラーが発生しました");
      }
    });
  });
});

