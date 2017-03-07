jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_categories_link = $('.pagination .next a').attr('href')
      if more_categories_link && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        console.log('test')
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_categories_link, ->
      return
  return