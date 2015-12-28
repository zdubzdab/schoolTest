$.fn.confirm = ->
  if $('.test-form').length > 0
    $(window).on "beforeunload", ->
      $('#overlay').show()
      setTimeout (->
        $('#overlay').hide()
        return
      ), 1000
      return I18n.t('js.welcome.index.you_really_want')

$.fn.unconfirm = ->
  $(this).bind "click", ->
    $(window).off "beforeunload"

$ ->
  $("#time_section").confirm()
  $("#b_save_result").unconfirm()
