// Shrink avatars
$(function() {
  $('.ava')
    .hide()
    .each(function() {
      var el = $(this), phgt = el.parent().height(), size;
      if (el.height() >= phgt) {
        size = Math.max(32, phgt);
        el.height(size)
          .width(size);
      }
    })
    .show();
});
