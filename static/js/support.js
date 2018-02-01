$(function() {

  // Our recurring costs. Amount is in cents.
  var costs = [
    {name: "The Labor Party", amount: 7500}, // $75 / month
    {name: "Meetup.com", amount: 2000},      // $20 / month
    {name: "Servers", amount: 600},          // $6 ict-food-circle
  ];
  var costSum = 0;
  costs.forEach(function(v) { costSum += v.amount; });
  $("#costs-sum").text(fmtMoney(costSum));

  // The count and amount of recurring paypal donations (in cents). We
  // are not pushing for people to do this so this is basically static.
  var paypal = [
    500, // BF
    200, // BB
  ];
  var paypalSum = 0;
  paypal.forEach(function(v) { paypalSum += v});

  $.get("https://devict-proxy.herokuapp.com/campaign", function(d) {
    $("#donations-sum").text(fmtMoney(d.data.attributes.pledge_sum + paypalSum));
    $("#donations-count").text(d.data.attributes.patron_count + paypal.length);

    var myChart = new Chart($("#chart"), {
      type: 'horizontalBar',
      data: {
        labels: ["Costs", "Donations"],
        datasets: [{
          label: "",
          data: [costSum/100, (d.data.attributes.pledge_sum + paypalSum)/100],
          backgroundColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)'
          ],
          borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        title: {display: false},
        legend: {display: false},
        scales: {
          xAxes: [{
            ticks: {
              beginAtZero:true
            }
          }]
        }
      }
    });

    $("#loading").addClass("hidden");
    $("#details").removeClass("hidden");
  });
});

function fmtMoney(v) {
  return "$" + v/100;
}
