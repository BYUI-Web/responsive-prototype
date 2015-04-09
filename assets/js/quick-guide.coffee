# Temporary for local testing:
window.showQuickGuide = () -> $("#quick-guide").addClass    "open"
window.hideQuickGuide = () -> $("#quick-guide").removeClass "open"

onMenuBoxClick = (e) =>
  $el = $(e.currentTarget).parent()
  if $el.attr('class').indexOf('open') == -1
    $el.addClass 'open'
  else
    $el.removeClass 'open'

$('.menu-box .title').on "click", onMenuBoxClick
$('#byui-guide-show-btn').on "click", showQuickGuide
$('#quick-guide .close-btn').on "click", hideQuickGuide
console.log $('#quick-guide .close-btn')
