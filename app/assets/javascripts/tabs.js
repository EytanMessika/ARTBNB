$(function(){

  $(".tab").on("click", function(e){
    $(".tab").removeClass('active');
    $(this).addClass('active');
    $(".tab-content").addClass('hidden');
    $($(this).data('target')).removeClass('hidden');
  });

});
