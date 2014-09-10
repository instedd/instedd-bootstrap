(function($){

  $.extend({
    instedd: {
      init_components: function(container) {
        $(".ux-wajbar", container).wajbar();

        jQuery('.features-container ul').jcarousel({
          buttonNextHTML: '<div class="next"><a href="#" onclick="return false;"></a></div>',
          buttonPrevHTML: '<div class="prev"><a href="#" onclick="return false;"></a></div>'
        });
      }
    }
  });

  $(function(){
    $.instedd.init_components($(document));
  });

})(jQuery);
