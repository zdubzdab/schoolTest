$ ->
  $("body").on 'ajax:success', '.b_delete_teacher', (evt, data, status, xhr) ->
    $(this).closest('tr').fadeOut()

  $('body').on 'click', '#admin_teacher_table_pagination  a', (event, data, status, xhr) ->
    url = $(this).attr("href")
    $.ajax
      url: url
      type: 'GET'
      dataType: 'html'
      success: (data) ->
        $('#partial_admin_teachers').html data
    event.preventDefault()
