$.fn.initializeCarusel = ->
  $(this).carousel()
  item = $('.carousel .item')
  item.eq(0).addClass('active')
  numberofSlides = $('.item').length
  currentSlide = Math.floor(Math.random() * numberofSlides)
