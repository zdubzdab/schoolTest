$ ->
  $('body').on 'click', '#methodical-work-table-pagination  a', (event, data, status, xhr) ->
    url = $(this).attr("href")
    $.ajax
      url: url
      type: 'GET'
      dataType: 'html'
      success: (data) ->
        $('#partial-methodical-works').html data
    event.preventDefault()
