# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(()->
  $('#header h1').fitText(1.7)
  $('#header h1').lettering()
  $('#header h1').show()
  sizeHead = ()->
    $('#header h1').height($('#header h1 span').first().outerHeight())
    $.each $('#header h1 span'), (i, letter) =>
      $letter = $(letter)
      $
      $letter.width($('#header h1').width() / $('#header h1 span').length)
      if (i % 2) == 0
        $letter.addClass('odd')
      if i == 0
        left = 0
      else
        left = i  * $('#header h1 span').first().width()
      animate_1 = (i)->
        $letter.addClass('fadeIn')
        $letter.addClass('flipInY')
      setTimeout (=> animate_1()), 35 * i
      unless i == 0
        $($('#header h1 span').get(i - 1)).removeClass('animated flipInY fadeIn').wrap('<a href="/" />')
      if i+1 == $('#header h1 span').length
        $letter.removeClass('animated flipInY fadeIn').wrap('<a href="/" />')
      return

  sizeHead()
  $(window).resize ->
    sizeHead()

  $('.aside div.block.JS_flipClick').on('click', (e)->
    $target = $(e.currentTarget)
    $front = $target.find('.flip_front_content')
    $back = $target.find('.flip_back_content')
    $target.removeClass('animated flipInX')
    if $front.is(':visible')
      $front.hide()
      $back.show()
      $target.addClass('animated flipInX')
    else
      $front.show()
      $back.hide()
      $target.addClass('animated flipInX')
  )
  #if $('#header').length
    #$('#header h1').fitText(1.5)
    #$('#header h1').lettering()

    #fadeSlide = ()->
      #$('#header h1').show()
      #$('#header h1').height($('#header h1 span').first().outerHeight())
      #$.each $('#header h1 span'), (i, letter) =>
        #$letter = $(letter)
        #$letter.width($('#header h1').width() / $('#header h1 span').length)
        #if (i % 2) == 0
          #$letter.addClass('odd')
        #if i == 0
          #left = 0
        #else
          #left = i  * $('#header h1 span').first().width()
        #animate = (left)->
          #console.log left
          #$letter
          #.animate({
            #opacity: 1,
          #}, {duration: 230 * i, queue: false})
          #.animate({
            #left: left,
          #}, 
          #{duration: 70 * i, queue: false, easing: 'easeInOutCirc' })
          #return 
        #setTimeout (=> animate(left)), 15
        #return

)

