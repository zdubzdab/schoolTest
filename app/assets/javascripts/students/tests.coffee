$ ->
  time = $('#time_tab').data('content')
  $('#time_tab').countdown({until: time, format: 'MS'})

  makeUnselectable = (node) ->
    if node.nodeType == 1
      node.setAttribute 'unselectable', 'on'
    child = node.firstChild
    while child
      makeUnselectable child
      child = child.nextSibling
    return

  makeUnselectable document.getElementById('test_section')

