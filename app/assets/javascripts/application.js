//= require rails-ujs
//= require activestorage
// = require turbolinks
// = require jquery3
//= require popper
//= require bootstrap

jQuery(function(){
  $('.delete_action').click(function (){
    let book_id = $(this).attr('data');
    $.ajax({
      url:'/books/' + book_id ,
      type: 'POST',
      data: { _method: 'DELETE'},

      success: function () {
        console.log("good")
      },
      error: function () {
        console.log("bad")
      }
    })
  })
})

jQuery(function (){
  $('.delete_comment').click(function (){
    let book_id = $(this).attr('data');
    let comment_id = $(this).attr('data_comment');
    $.ajax({
      url: '/books/' + book_id + '/comments/' + comment_id,
      type: 'POST',
      data: { _method: 'DELETE'},

      success: function () {
        console.log("good")
      },
      error: function () {
        console.log("bad")
      }
    })
  })
})