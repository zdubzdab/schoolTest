$ ->
  if $('#time_section').length > 0
    $(window).bind "beforeunload", ->
      return I18n.t('js.welcome.index.you_really_want')

  $("body").bind "click", ".b_save_result", ->
    $(window).unbind "beforeunload"
