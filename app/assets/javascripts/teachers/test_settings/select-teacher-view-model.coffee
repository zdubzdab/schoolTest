ns = namespace("forms.selects")

class ns.selectTeacherViewModel
  constructor: ->
    @themeName             = ko.observable('')
    @subjectName           = ko.observable('')
    @categgoryName         = ko.observable('')
    @availableThemes       = ko.observableArray([])
    @availableSubjects     = ko.observableArray([])
    @avaliableCateggories  = ko.observableArray([])

    @availableSubjects(@_fetchSubjects )
    @availableThemes(@_fetchThemes )
    @avaliableCateggories(@_fetchCateggories )

  _fetchThemes: (onData) ->
    $.getJSON('/applications/get_themes', onData)

  _fetchSubjects: (onData) ->
    console.log('some')

  _fetchCateggories: (onData) ->
    console.log('some')