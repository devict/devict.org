$(function() {

  // Our recurring costs. Amount is in cents.
  var payments = [
    {name: "Pizza", amount: 10000}, // $50 Dominos for Level Up x 2 per month
    {name: "The Labor Party", amount: 7500},
    {name: "Meetup.com", amount: 1500},
    {name: "Servers", amount: 3000},
  ];
  var paymentSum = 0;
  payments.forEach(function(v) { paymentSum += v.amount; });
  $("#payments-sum").text(fmtMoney(paymentSum));


  // The count and amount of recurring paypal donations (in cents). We
  // are not pushing for people to do this so this is basically static.
  var paypal = [
    500,
    500,
    500,
    1000,
    500,
    200,
    2500
  ];
  var paypalSum = 0;
  paypal.forEach(function(v) { paypalSum += v});

  $.get("https://devict-patreon.herokuapp.com/campaign", function(d) {
    $("#donations-sum").text(fmtMoney(d.data.pledge_sum + paypalSum));
    $("#donations-count").text(d.data.patron_count + paypal.length);

    $("#details").removeClass("hidden");
  });
});

function fmtMoney(v) {
  return "$" + v/100;
}
