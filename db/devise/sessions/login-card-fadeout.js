$(function () {
  var $card = $('[data-js-login-fade-in]');
  if (!$card.length) return;

  setTimeout(function () {
    $('.card').removeClass('card-hidden');
  }, 700);
});
