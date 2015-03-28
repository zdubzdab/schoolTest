$ ->
  show_themes = (theme_selector) ->
    $.get "#{$(theme_selector).closest('form').attr('action')}?#{$(theme_selector).closest('form').serialize()}", (html) =>
      $('.table').html(html)
      $('#add-test').show()

  if !isNaN( parseInt("#{$('#test_theme_id').val()}") )
    show_themes $('#test_theme_id')

  $('body').on 'change', '.klass-selector', ->
    clear_next_selectboxes($(@))
    if !isNaN( parseInt("#{$(@).val()}") )
      $.get "/sub_records?class_caller=#{$('.subject-selector').attr('name')}
        &class_calles=#{$(@).attr('name')}&calles_value=#{$(@).val()}", (html) =>
          $('.subject-selector').empty().append("<option>Виберіть предмет</option>#{html}");
          $('#add-test').hide()

  $('body').on 'change', '.subject-selector', ->
    clear_next_selectboxes($(@))
    if !isNaN( parseInt("#{$(@).val()}") )
      $.get "/sub_records?class_caller=theme
        &class_calles=#{$(@).attr('name')}&calles_value=#{$(@).val()}", (html) =>
          $('#test_theme_id').append(html)
          $('#add-test').hide()

  $('body').on 'change', '#test_theme_id', ->
    clear_next_selectboxes($(@))
    if !isNaN( parseInt("#{$(@).val()}") )
      show_themes($(@))

  clear_next_selectboxes = (current_select) ->
    selectboxes = current_select.nextAll('select')
    selectboxes.each ->
      el = $(@).find('option:first')
      $(@).empty().html("<option>#{el.html()}</option>")
    $('#add-test').hide()
    $('.table').html('')