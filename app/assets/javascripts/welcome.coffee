# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
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

  $("#clean_search_field").click ->
    $('#search').val("")
    form = $(".search_form")
    formData = form.serialize()
    $.ajax
      type: 'GET'
      data: formData
      dataType: 'html'
      success: (data) ->
        $('#partial_news').html data

  $('body').on 'click', '#tiding_table_pagination  a', (event, data, status, xhr) ->
    url = $(this).attr("href")
    $.ajax
      url: url
      type: 'GET'
      dataType: 'html'
      success: (data) ->
        $('#partial_news').html data
    event.preventDefault()

  $("#clean_search_field").click ->
    $('#search').val("")
    form = $(".search_form")
    formData = form.serialize()
    $.ajax
      type: 'GET'
      data: formData
      dataType: 'html'
      success: (data) ->

        $('#partial_news').html data

  $('body').on 'click', '#tiding_table_pagination  a', (event, data, status, xhr) ->
    url = $(this).attr("href")
    $.ajax
      url: url
      type: 'GET'
      dataType: 'html'
      success: (data) ->
        debugger;
        $('#partial_news').html data
    event.preventDefault()