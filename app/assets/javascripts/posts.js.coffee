# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
  previewPost()
  $('.js_post_realtime').prop('checked', localStorage.postRealtime == 'true')
)

$(document).on('click', '.js_post_preview', (e) ->
  e.preventDefault()
  previewPost()
)

$(document).on('keypress', '.js_post_body:visible', (e) ->
  switch e.which
    when 13
      if $('.js_post_realtime').is(':checked') 
        previewPost()
)

$(document).on('change', '.js_post_realtime', (e) ->
  localStorage.postRealtime = $(this).prop('checked')
)

previewPost = ->
  $body = $('.js_post_body:visible')
  if $body.length
    $.post('/posts/markdown', "body=#{encodeURIComponent($body.val())}", (data) ->
      $('.js_post_rendered').html(data).height($body.height())
      $('.js_post_source').text(data).height($body.height())
      prettyPrint()
    )

