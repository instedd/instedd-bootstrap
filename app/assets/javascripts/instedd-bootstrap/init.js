(function($){

  $.extend({
    instedd: {
      init_components: function(container) {
        $(".ux-wajbar", container).wajbar();

        jQuery('.features-container ul').jcarousel({
          buttonNextHTML: '<div class="next"><a href="#" onclick="return false;"></a></div>',
          buttonPrevHTML: '<div class="prev"><a href="#" onclick="return false;"></a></div>'
        });

        jQuery('.collapsible_form_for_container a').click(function( event ) {
          event.preventDefault();
        });

        jQuery('.collapsible_form_for_container input.choose').change(function (elem) {
          jQuery(this).closest('form').find('#choose-file').val(this.files[0].name);
        });
      }
    }
  });

  $(function(){
    $.instedd.init_components($(document));
  });

})(jQuery);
