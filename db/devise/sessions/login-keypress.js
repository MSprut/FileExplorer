$(function () {
  var $card = $('[data-js-login-fade-in]');
  if (!$card.length) return;

  $('[data-js-login-fade-in]').keypress(function () {
    $('.alert').fadeOut('1000');
  });
});
