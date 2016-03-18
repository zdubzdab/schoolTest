$ ->
  $('body').on 'click', '#teacher-table-pagination  a', (event, data, status, xhr) ->
    url = $(this).attr("href")
    $.ajax
      url: url
      type: 'GET'
      dataType: 'html'
      success: (data) ->
        $('#partial_teachers').html data
    event.preventDefault()

