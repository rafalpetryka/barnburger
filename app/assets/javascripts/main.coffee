ready = ->
  #initialise Stellar.js
  #Create a function that will be passed a slide number and then will scroll to that slide using jquerys animate. The Jquery
  #easing plugin is also used, so we passed in the easing method of 'easeInOutQuint' which is available throught the plugin.

  goToByScroll = (dataslide) ->
    htmlbody.animate { scrollTop: $('.slide[data-slide="' + dataslide + '"]').offset().top }, 2000, 'easeInOutQuint'
    return

  $(window).stellar()
  #Cache some variables
  hasPlayed = new Boolean
  hasPlayed = false
  links = $('.navigation').find('li')
  slide = $('.slide')
  button = $('.button')
  mywindow = $(window)
  htmlbody = $('html,body')
  #Setup waypoints plugin
  slide.waypoint (event, direction) ->
    #cache the variable of the data-slide attribute associated with each slide
    dataslide = $(this).attr('data-slide')
    #If the user scrolls up change the navigation link that has the same data-slide attribute as the slide to active and
    #remove the active class from the previous navigation link
    if event == 'down'
      $('.navigation li[data-slide="' + dataslide + '"]').addClass('active').prev().removeClass 'active'
    else
      $('.navigation li[data-slide="' + dataslide + '"]').removeClass('active').prev().addClass 'active'
    if dataslide == 5
      if !hasPlayed
        snd = new Audio('sound.mp3')
        # buffers automatically when created
        snd.load()
        snd.play()
        hasPlayed = true
    return
  #waypoints doesnt detect the first slide when user scrolls back up to the top so we add this little bit of code, that removes the class
  #from navigation link slide 2 and adds it to navigation link slide 1.
  mywindow.scroll ->
    if mywindow.scrollTop() == 0
      $('.navigation li[data-slide="1"]').addClass 'active'
      $('.navigation li[data-slide="2"]').removeClass 'active'
    return
  #When the user clicks on the navigation links, get the data-slide attribute value of the link and pass that variable to the goToByScroll function
  links.click (e) ->
    e.preventDefault()
    dataslide = $(this).attr('data-slide')
    goToByScroll dataslide
    return
  #When the user clicks on the button, get the get the data-slide attribute value of the button and pass that variable to the goToByScroll function
  button.click (e) ->
    e.preventDefault()
    dataslide = $(this).attr('data-slide')
    goToByScroll dataslide
    return
  return

$(document).ready(ready)
$(document).on('page:load', ready)
