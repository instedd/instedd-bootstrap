(function($){
  
  $.extend({
    instedd: {
      init_components: function(container) {
        $(".ux-wajbar", container).wajbar();
      }
    }
  });

  $(function(){
    $.instedd.init_components($(document));
  });
  
})(jQuery);