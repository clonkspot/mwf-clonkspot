$(function() {
  // Shrink avatars
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

  // Inline .txt attachments.
  $('.amf a[href$=".txt"]').click(function(e) {
    // Allow middle button clicks.
    if (e.which === 2) return;

    var el = $(this), content = el.parent().find('.ccl');
    if (content.length) {
      content.toggle();
    } else {
      content = $('<div class="ccl">Loading...</div>').appendTo(el.parent());
      $.get(el.attr('href')).then(function(text) {
        content.html($('<pre>').text(text));
      }, function() {
        content.text('Load error');
      });
    }
    e.preventDefault();
  });

});
