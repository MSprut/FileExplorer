$(document).ready ->

	$('.asset_details').hover ((e)->
		offs = $(@).closest('.asset_details').offset()
		if $(@).find('.context-menu').is(':hidden')
			$(@).find('.context-menu').css
				top:  offs.top + 24,
				left: e.pageX - 15
		$(@).find('.context-menu').show()
	), ->
		$(@).find('.context-menu').hide()
		$(@).find('.actions').hide()

	$('.context-menu').on().hover ->
		$(@).show()

	$('.context-menu').off().click (e) ->
		$(@).find('.actions').toggle()

  ###$(document).on "change", "input.item-ids", ->
    num_of_checkbox = $("input.item-ids").length
    num_of_checkbox_checked = $("input.item-ids:checked").length
    if num_of_checkbox_checked > 0
      $('#menu ul li.remove-all').show()
    else
      $('#menu ul li.remove-all').hide()
  ###
