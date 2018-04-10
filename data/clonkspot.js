/*
 * Copyright © 2014-2015, Lukas Werling
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
$(function() {
  var wipf = mwf.p.cfg_dataPath + '/wipf.gif', deadwipf = mwf.p.cfg_dataPath + '/deadwipf.gif';

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

  // Inline some attachments.
  var extensions = {
    txt: {
      match: /\.txt$/,
      fn: function(href, content) {
        $.get(href).then(function(text) {
          content.html($('<pre>').text(text));
        }, function() {
          content.children('img')
            .attr('src', deadwipf)
            .attr('alt', 'Load error')
        });
      }
    },
    audio: {
      match: /\.(wav|ogg|mp3)$/,
      fn: function(href, content) {
        content.html('<audio src="'+href+'" controls autoplay><img src="'+deadwipf+'" alt="No audio support"></audio>');
      }
    },
  };
  $('body').on('click', '.amf a', function(e) {
    // Allow middle button clicks.
    if (e.which === 2) return;

    var el = $(this), href = el.attr('href'), content = el.parent().find('.ccl');
    if (content.length) {
      content.toggle();
    } else {
      for (ext in extensions) {
        if (extensions[ext].match.test(href)) {
          content = $('<div class="ccl"><img src="' + wipf + '" alt="Loading..."></div>').appendTo(el.parent());
          extensions[ext].fn(href, content);
        }
      }
    }
    if (content.length) e.preventDefault();
  });

  // Toggle embedded thumbnails.
  $('body').on('click', 'a[href^="attach_show.pl"] > img', function(e) {
    var img = $(e.target).hide(), other = img.siblings();
    if (other.length) {
      other.show();
    } else {
      other = $('<img>')
        .attr('src', wipf)
        .appendTo(img.parent())
      $.get(img.parent().attr('href')).then(function(doc) {
        var src = $($.parseHTML(doc)).filter('.ims').find('img').attr('src');
        other.attr('src', src || deadwipf);
      }, function(xhr) {
        other.attr('src', deadwipf);
      });
    }
    e.preventDefault();
  });

});
