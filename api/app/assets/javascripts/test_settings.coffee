$ ->
  $('body').on 'click', '#add-question', ->
    this_link = $(@)
    $.get this_link.attr('href'), (html) =>
      
    false