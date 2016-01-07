$ ->
  $("#test_theme_select_box").parent().hide()
  themes = $("#test_theme_select_box").html()
  $("#subject_id").change ->
    subject = $("#subject_id :selected").text()
    options = $(themes).filter("optgroup[label='#{subject}']").html()
    if options
      $("#test_theme_select_box").html(options)
      $("#test_theme_select_box").parent().show()
    else
      $("#test_theme_select_box").empty()
      $("#test_theme_select_box").parent().hide()

  $("#test_theme_select_box").change ->
    theme = $("#test_theme_select_box :selected").text()
    $.ajax
      url: "test_settings/search_test_settings"
      type: "get"
      data: "key=" + theme
      dataType: "html"
      success: (request) ->
        $("#show_test_setting_links").html(request)
        debugger;
