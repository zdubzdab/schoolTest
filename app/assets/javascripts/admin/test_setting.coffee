$ ->
  $('body').on 'click', '#test_setting_table_pagination  a', (event, data, status, xhr) ->
    url = $(this).attr("href")
    $.ajax
      url: url
      type: 'GET'
      dataType: 'html'
      success: (data) ->
        $('#test_settings_partial').html data
    event.preventDefault()

  $("body").on 'ajax:success', '.b_delete_test_setting', (evt, data, status, xhr) ->
    $(this).closest('tr').fadeOut()
