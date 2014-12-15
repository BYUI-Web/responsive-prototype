(function() {
  var onMenuBoxClick;

  window.showQuickGuide = function() {
    return $("#quick-guide").addClass("open");
  };

  window.hideQuickGuide = function() {
    return $("#quick-guide").removeClass("open");
  };

  onMenuBoxClick = (function(_this) {
    return function(e) {
      var $el;
      $el = $(e.currentTarget).parent();
      if ($el.attr('class').indexOf('open') === -1) {
        return $el.addClass('open');
      } else {
        return $el.removeClass('open');
      }
    };
  })(this);

  $('.menu-box .title').on("click", onMenuBoxClick);

  $('#byui-guide-show-btn').on("click", showQuickGuide);

  $('#quick-guide .close-btn').on("click", hideQuickGuide);

  console.log($('#quick-guide .close-btn'));

}).call(this);
