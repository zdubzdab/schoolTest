$.fn.confirm = ->
  if $(this).length > 0
    $(window).bind "beforeunload", ->
      return I18n.t('js.welcome.index.you_really_want')

$.fn.unconfirm = ->
  $(this).bind "click", ->
    $(window).unbind "beforeunload"

$ ->
  $("#time_section").confirm()
  $("#b_save_result").unconfirm()
