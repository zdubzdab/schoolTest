$ ->
  $("#test_theme_id").hide()
  themes = $("#test_theme_id").html()
  $("#subject_id").change ->
    subject = $("#subject_id :selected").text()
    options = $(themes).filter("optgroup[label='#{subject}']").html()
    if options
      $("#test_theme_id").html(options)
      $("#test_theme_id").show()
    else
      $("#test_theme_id").empty()
      $("#test_theme_id").hide()

  $("#test_theme_id").change ->
    theme = $("#test_theme_id :selected").html()
    debugger;
    $.ajax
      url: "persons/search_test_settings"
      type: "get"
      data: theme
      success: (data) ->
        $("#show").html(theme)
        debugger;
