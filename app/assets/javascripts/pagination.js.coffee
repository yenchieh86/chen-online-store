$(document).on "turbolinks:load", ->
  if $('.infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      show_more_link = $('.pagination .next a').attr('href')
      if show_more_link && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript show_more_link, ->
      return
  return