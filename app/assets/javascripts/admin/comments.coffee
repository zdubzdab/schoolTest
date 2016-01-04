$ ->
  $('body').on 'click', '#comments_pagination  a', (event, data, status, xhr) ->
    url = $(this).attr("href")
    $.ajax
      url: url
      type: 'GET'
      dataType: 'html'
      success: (data) ->
        $('#comments_partial').html data
    event.preventDefault()

  $("body").on "click", '.b_delete_comment', 'ajax:success', (evt, data, status, xhr) ->
    $(this).closest('ol').fadeOut()
