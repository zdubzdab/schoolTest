@.finish_test = (argument) ->
  if $('#time_section').length > 0
    if localStorage.getItem(argument)
      diff = ($.now() - localStorage.getItem(argument))/1000
      if diff > 5
        $(window).unbind "beforeunload"
        url = "#{$('.test-form').attr('action')}/finish_test"
        retrived_form = localStorage.getItem('form')
        $.ajax
          url: url
          type: "post"
          data: retrived_form
          success: (data) ->
            localStorage.removeItem('form')
            localStorage.removeItem(argument)
            window.location = data.url

$ ->
  liftOff = ->
    $(window).unbind "beforeunload"
    url = "#{$('.test-form').attr('action')}/finish_test"
    serialized_data = $(".test-form").serialize()
    $.ajax
      url: url
      type: "post"
      data: serialized_data

  url = "#{$('.test-form').attr('action')}/finish_test"
  time = $('#time_tab').data('content')
  $('#time_tab').countdown({until: time, expiryUrl: url, onExpiry: liftOff, format: 'MS'})
