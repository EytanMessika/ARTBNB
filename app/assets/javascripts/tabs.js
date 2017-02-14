$(document).ready(function() {
    $('.tab').click(
      function(){

        $('.active').removeClass('active');

        $(this).addClass('active');

        $('.tab-content').addClass("hidden");

        var content = $('.active').data("target");

        $(content).removeClass("hidden");

      });
});
