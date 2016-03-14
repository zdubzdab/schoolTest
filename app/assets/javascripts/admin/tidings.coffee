# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("body").on "click", '.b-delete-tiding', 'ajax:success', (evt, data, status, xhr) ->
    $(this).closest('tr').fadeOut()

  $('body').on 'click', '#admin-news-table-pagination  a', (event, data, status, xhr) ->
    url = $(this).attr("href")
    $.ajax
      url: url
      type: 'GET'
      dataType: 'html'
      success: (data) ->
        $('#partial-news').html data
    event.preventDefault()
