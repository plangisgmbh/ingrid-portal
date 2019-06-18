$(function() {

  $(document).foundation();

  initSelect2();

  //show and hide header menu
  $('.header-menu-open button').click(function() {
    $('.header-menu').show();
  });
  $('.header-menu-close button').click(function() {
    $('.header-menu').hide();
  });

  //custom scrollbar for header burger menu
  $('.header-menu').niceScroll({
    cursorcolor:"#f6f6f6",
    cursorwidth:"8px",
    cursorborderradius: "6px",
  });

  //custom scrollbar in contact form textarea
  $('.custom-scrollbar').niceScroll({
    cursorcolor:"#c6cfe2",
    cursorwidth:"8px",
    cursorborderradius: "6px",
    railpadding: { top: 25, right: 0, left: 0, bottom: 5 }
  });

  //toggle social media links
  $('button.social.share').click(function() {
    $('footer .footer-buttons-bar .social-buttons a.social').fadeToggle( "slow", "linear" ).css("display","inline-block");
  });

});

$(window).resize(function() {
  initSelect2();
});

function initSelect2() {
  $('select.select2').select2({
    minimumResultsForSearch: Infinity, // no search box for single selects
  });

  $('select.location_select').select2({
    placeholder: "PLZ oder Ort eingeben",
  });
}