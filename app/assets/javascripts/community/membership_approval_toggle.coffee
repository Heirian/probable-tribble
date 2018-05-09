$ ->
  if $("#community_require_approval").is(':checked') == false
    $('#membership_approval').hide()

$('#community_require_approval').change ->
  $('#membership_approval').toggle()
