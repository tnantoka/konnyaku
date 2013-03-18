# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
  #try
  #  $('#upload_file').fileupload('destroy')
  #catch e
  #  console.error e

  $('.js_upload_drop')
    .off()
    .html('<i class="icon-upload icon-2x"></i>') 
    .on('dragover', ->
      $(this).html('<i class="icon-plus-sign icon-2x"></i>') 
    )
    .on('dragleave', ->
      $(this).html('<i class="icon-upload icon-2x"></i>') 
    )

  $('.js_upload_new').fileupload(
    dropZone: $('.js_upload_drop')
    start: ->
      $('.js_upload_drop').html('<i class="icon-spinner icon-spin icon-2x"></i>') 
    done: ->
      $('.js_upload_drop').html('<i class="icon-ok-sign icon-2x"></i>') 
      window.location.reload()
    fail: (e) ->
      $('.js_upload_drop').html('<i class="icon-exclamation-sign icon-2x"></i>') 
  )
)

$(document).on('drop dragover', (e) ->
  e.preventDefault();
)
