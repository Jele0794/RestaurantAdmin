# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    if $('.order-title').length != 0
        $('div.container').css({'min-width': '90%', 'width': 'auto', 'margin': '0 2.5%'})
    else
        $('div.container').css({'min-width': '', 'width': '', 'margin': ''})

    if $('.closed-orders').length != 0
        $('.order-btns').addClass('disabled')
