# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("body").on 'ajax:success', '.b_delete_student', (evt, data, status, xhr) ->
    $(this).closest('tr').fadeOut()

  $('body').on 'click', '#admin_student_table_pagination  a', (event, data, status, xhr) ->
    url = $(this).attr("href")
    $.ajax
      url: url
      type: 'GET'
      dataType: 'html'
      success: (data) ->
        $('#partial_admin_students').html data
    event.preventDefault()

