$.fn.initializeCarusel = ->
  $(this).carousel()
  item = $('.carousel .item')
  item.eq(0).addClass('active')
  currentSlide = 0
