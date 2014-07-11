# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("#submit-photo").click -> 
	v = $("#photo-name").val()
	if v == null or v == ""
		alert "name can not be empty"
		$("#photo-name").focus()
		return false

	v = $("#category-id").val()
	if v == null or v == ""
		alert "please choose category"
		$("#category-id").focus()
		return false

	v = $("#image-path").val()
	if v == null or v == ""
		alert "please choose a photo"
		$("#image-path").focus()
		return false

$(".bxslider").bxSlider pagerCustom: "#bx-pager"

jQuery(document).ready ($) ->
  $("#banner-slide").bjqs
    animtype: "slide"
    height: 320
    width: 620
    responsive: true
    randomstart: true

  return