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

    $(document).on('hidden', '.ibs-xor-collapse .collapse', function (e) {
      var xor_context = $(e.target).closest('.ibs-xor-collapse');
      $('.collapse', xor_context).each(function(i, other_collapse){
        if (other_collapse != e.target) {
          $(other_collapse).collapse('show')
        }
      });
    });

    $(document).on('click', '[data-ibs-clickable]', function(e) {
      var elem = $(e.target);
      $(elem.data('ibs-clickable'), elem).click();
      e.preventDefault();
      e.stopPropagation();
    });

    $(document).on('mouseenter', '[data-ibs-clickable]', function(e) {
      var elem = $(e.target);
      $(elem.data('ibs-clickable'), elem).addClass('hover');
    });

    $(document).on('mouseleave', '[data-ibs-clickable]', function(e) {
      var elem = $(e.target);
      $(elem.data('ibs-clickable'), elem).removeClass('hover');
    });

  });

})(jQuery);
