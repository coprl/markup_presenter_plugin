window.voom = window.voom || {};
window.voom.markup = window.voom.markup || (function() {
  function setHeight(element, height) {
    if (height < 60) {
      height = '10em';
    } else {
      height = String(height) + 'px';
    }

    window.requestAnimationFrame(function() {
      console.debug('markup: set %s height to %s', element.nodeName, height);
      element.style.height = height;
    });
  }

  function hasIntersectionObserver() {
    return typeof window['IntersectionObserver'] === 'function';
  }

  var onLoad = function onLoad(iframe) {
    if (!(iframe && iframe.hasAttribute('data-auto-height'))) {
      return;
    }

    var observer = new IntersectionObserver(function(entries) {
      if (entries.length < 1) {
        return;
      }

      var height = entries[0].boundingClientRect.height;

      // This callback can ABSOLUTELY run before the iframe's document has been
      // laid out, and thus before it has any height at all.
      if (height < 1) {
        return;
      }

      setHeight(iframe, height);
      observer.disconnect();
    });

    observer.observe(iframe.contentDocument.body);
  };

  var iframeAutoSize = function iframeAutoSize(iframe) {
    var doc = iframe.contentDocument.scrollingElement;

    if (!doc) {
      return;
    }

    var height = doc.offsetHeight;

    if (height < 1) {
      return;
    }

    setHeight(iframe, height);
  };

  window.addEventListener('resize', function() {
    var iframes = document.querySelectorAll('iframe[data-auto-height]');

    for (var i = 0; i < iframes.length; i++) {
      iframeAutoSize(iframes[i]);
    }
  }, {passive: true});

  return {
    onLoad: onLoad,
    iframeAutoSize: iframeAutoSize
  };
}());
