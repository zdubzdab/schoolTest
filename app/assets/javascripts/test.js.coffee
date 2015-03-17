$ ->
  $('body').on 'change', '.klass-selector', ->
    $.get "/sub_records?class_caller=#{$('.subject-selector').attr('name')}
      &class_calles=#{$(@).attr('name')}&calles_value=#{$(@).val()}", (html) =>
        $('.subject-selector').append(html);
        $('#add-test').hide()

  $('body').on 'change', '.subject-selector', ->
    $.get "/sub_records?class_caller=theme
      &class_calles=#{$(@).attr('name')}&calles_value=#{$(@).val()}", (html) =>
        $('#test_theme_id').append(html)
        $('#add-test').hide()

  $('body').on 'click', '.show-tests', ->
    $.get "#{$(@).closest('form').attr('action')}?#{$(@).closest('form').serialize()}", (html) =>
      $('.table').html(html)
      $('#add-test').show()
    return false

