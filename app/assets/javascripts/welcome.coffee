# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#clean_search_field").click ->
    $('#search').val("")
    
  $(".search_form").submit (event, data, status, xhr) ->
    form = $(".search_form")
    formData = form.serialize()
    url = $(this).attr("action")
    $.ajax
      url: url
      type: 'GET'
      data: formData
      dataType: 'html'
      success: (data) ->
        $('#partial_news').html data
    event.preventDefault()

