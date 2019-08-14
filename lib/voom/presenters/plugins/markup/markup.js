window.vUpdateIframeHeight = function(iframeId, times) {
  if (!iframeId) {
    console.warn('No iframe ID provided');

    return;
  }

  var times = times || 1;
  var iframe = document.getElementById(iframeId);

  if (!(iframe && iframe.hasAttribute('data-auto-height'))) {
    return;
  }

  var doc = iframe.contentDocument;

  if (!doc) {
    // `allow-same-origin` sandbox attribute not present.
    return;
  }

  var root = doc.scrollingElement || doc.documentElement;

  // Updating the iframe's height multiple times may be necessary as the
  // iframe's document's offsetHeight varies depending on the presence of a
  // vertical scrollbar. When resizing such that the vertical scrollbar is no
  // longer necessary, the height must be further adjusted.
  for (var i = 0; i < times; i++) {
    window.requestAnimationFrame(function() {
      var height = root.offsetHeight.toString() + 'px';

      iframe.style.height = height;
    });
  }
}
