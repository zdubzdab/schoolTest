$ ->
  liftOff = ->
    $(window).unbind "beforeunload"
    url = $(".test-form").attr("action")
    window.location = 'url'
    serialized_data = $(".test-form").serialize()
    $.ajax
      url: url
      type: "post"
      data: serialized_data

  url = $(".test-form").attr("action")
  time = $('#time_tab').data('content')
  $('#time_tab').countdown({until: time, expiryUrl: url, onExpiry: liftOff, format: 'MS'})

  if $('#time_section').length > 0
    $(window).on 'unload', ->
      url = $(".test-form").attr("action")
      window.location.replace url
      serialized_data = $(".test-form").serialize()
      $.ajax
        url: url
        type: "post"
        data: serialized_data
