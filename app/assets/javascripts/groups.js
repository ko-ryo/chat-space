$(function(){

  function searchUsers() {
    $.ajax({
      url: '/users.json',
      type: 'GET',
      data: {
        name: $('#user-search-field')
      }
    })
  }
})
