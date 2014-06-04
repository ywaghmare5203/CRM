/**
 * Live search - jQuery Plugin
 * Enhance text input element with AJAX search form functionality.
 */
 
(function($) {

  // List of methods provided by the plugin.
  var methods = {
    // Initialize plugin.
    init: function(options) {
      
      $this = this;
      
      // Set default options and override.
      options = $.extend({
        url: null,
        minChar: 1,
        typeDelay: 500
      }, options);
      
      // Save options as HTML attribute
      $this.data('options.livesearch', options);
      
      // Assign key up event.
      $this.keypress(function(event) {
        
        var delayTimeoutID = $this.data('delayTimeoutID');
        clearTimeout(delayTimeoutID);
        
        // Set type delay timeout and metadata.
        var delayTimeoutID = setTimeout(function() {
          
          // If character number less than minimum, don't search. 
          if ($this.val().length < $this.data('options.livesearch').minChar) return;
          // If current value is same as last value, don't search.
          if ($this.val() == $this.data('lastValue')) return;
        
          $this.data('lastValue', $this.val());
        
          // Submit AJAX search.
          methods.submit.call($this);

        }, options.typeDelay);
        
        $this.data('delayTimeoutID', delayTimeoutID);
      });

      return $this;
    },
    
    // Submit search input
    submit: function(query) {

      $this = this;

      if (! query) query = this.val();
      var url = this.data('options.livesearch').url;
      
      this.trigger('progress');
      
      var jqxhr = $.get(url, {query: query});
      jqxhr.success(function() { $this.trigger('success', arguments); });
      jqxhr.error(function() { $this.trigger('error', arguments); });
      jqxhr.complete(function() { $this.trigger('complete', arguments); });

      return this;
    }
  }

  $.fn.livesearch = function(method) {  
    // Method selection logic
    if (methods[method])
      return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
    else if (typeof method != 'string' || ! method)
      return methods.init.apply(this, arguments);
    else
      console.error('Method ' + method + ' does not exists on jquery.livesearch');
      
    return this;
  }

})(jQuery);
