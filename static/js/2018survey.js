var ctx = document.getElementById("yearChart").getContext("2d");

var data = {
  labels: ["", "2017", "2018", ""],
  datasets: [{
    label: "25th Percentile",
    backgroundColor: 'rgba(255,99,132,.42)',
    borderColor: 'rgba(255,99,132,1)',
    borderWidth: 1,
    data: [ , 53250.00, 52000.00, ]
  }, {
    label: "50th Percentile",
    backgroundColor: "rgba(54, 162, 235, .42)",
    borderColor: "'rgba(54, 162, 235, 1)'",
    borderWidth: 1,
    data: [ , 68150.00, 68455.00, ]
  },
  {
    label: "Average",
    type: "line",
    borderColor: "rgba(255, 206, 86, 1)",
    borderWidth: 2,
    data: [68942.97 , 68942.97, 69764.50, 69764.50]
  },
    {
    label: "75th Percentile",
    backgroundColor: "rgba(75, 192, 192, .42)",
    borderColor: "rgba(75, 192, 192, 1)",
    borderWidth: 1,
    data: [ , 80272.25, 87875.50, ]
  }, {
    label: "90th Percentile",
    backgroundColor: "rgba(153, 102, 255, .42)",
    borderColor: "rgba(153, 102, 255, 1)",
    borderWidth: 1,
    data: [ , 99200.00, 99800.00, ]
  }]
};

var lineChart = new Chart(ctx, {
  type: 'line',
  data: data,
  options: {
    barValueSpacing: 20,
    scales: {
      yAxes: [{
        ticks: {
          min: 0,
        }
      }]
    }
  }
});

var ctx = document.getElementById("percentileChart").getContext("2d");

var data = {
  labels: ["", "25th Percentile", "50th Percentile", "75th Percentile", "90th Percentile", ""],
  datasets: [{
    label: "2017",
    backgroundColor: 'rgba(255,99,132,0.4)',
    borderColor: 'rgba(255,99,132,1)',
    borderWidth: 3,
    data: [, 53250.00, 68150.00, 80272.25, 99200.00, ]
    // Average value 68942.97,
  }, {
    label: "2017 Avearge",
    // backgroundColor: "rgba(200,200,200,0.6)",
    borderColor: "'rgba(100,100,100,0.8)'",
    borderWidth: 3,
    data: [68942.97, 68942.97, 68942.97, 68942.97, 68942.97, 68942.97]
  }, {
    label: "2018",
    backgroundColor: "rgba(54,162,235,0.4)",
    borderColor: "'rgba(54,162,235,1)'",
    borderWidth: 3,
    data: [, 52000.00, 68455.00, 87875.50, 99800.00, ]
  }, {
    label: "2018 Avearge",
    // backgroundColor: "rgba(200,200,200,0.6)",
    borderColor: "'rgba(200,200,200,0.6)'",
    borderWidth: 3,
    data: [69764.50, 69764.50, 69764.50, 69764.50, 69764.50, 69764.50]
  }]
};

var lineChart = new Chart(ctx, {
  type: 'line',
  data: data,
  options: {
    barValueSpacing: 20,
    scales: {
      yAxes: [{
        ticks: {
          min: 0,
          callback: function(value, index, values) {
              return '$' + value;
            }
        }
      }]
    }
  }
});
