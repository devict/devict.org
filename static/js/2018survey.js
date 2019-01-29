var ctx = document.getElementById("yearChart").getContext("2d");

var data = {
  labels: ["", "2017", "2018", ""],
  datasets: [{
    label: "25th Percentile",
    backgroundColor: 'rgba(255,99,132,.42)',
    borderColor: 'rgba(255,99,132,1)',
    borderWidth: 1,
    data: [ , 53476.50, 52000.00, ]
  }, {
    label: "50th Percentile",
    backgroundColor: "rgba(54, 162, 235, .42)",
    borderColor: "'rgba(54, 162, 235, 1)'",
    borderWidth: 1,
    data: [ , 66197.00, 77300.00, ]
  },
  {
    label: "Average",
    type: "line",
    borderColor: "rgba(255, 206, 86, 1)",
    borderWidth: 2,
    data: [68637.37 , 68637.37, 77384.44, 77384.44]
  },
    {
    label: "75th Percentile",
    backgroundColor: "rgba(75, 192, 192, .42)",
    borderColor: "rgba(75, 192, 192, 1)",
    borderWidth: 1,
    data: [ , 83274.25, 96500.00, ]
  }, {
    label: "90th Percentile",
    backgroundColor: "rgba(153, 102, 255, .42)",
    borderColor: "rgba(153, 102, 255, 1)",
    borderWidth: 1,
    data: [ , 102153.60, 120000.00, ]
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
              return '$' + value;}
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
    data: [, 53476.50, 66197.00, 83274.25, 102153.60, ]
    // Average value 68942.97,
  }, {
    label: "2017 Avearge",
    // backgroundColor: "rgba(200,200,200,0.6)",
    borderColor: 'rgba(100,100,100,0.8)',
    borderWidth: 3,
    data: [68637.37, 68637.37, 68637.37, 68637.37, 68637.37, 68637.37]
  }, {
    label: "2018",
    backgroundColor: "rgba(54,162,235,0.4)",
    borderColor: "'rgba(54,162,235,1)'",
    borderWidth: 3,
    data: [, 52000.00, 77300.00, 96500.00, 120000.00, ]
  }, {
    label: "2018 Avearge",
    // backgroundColor: "rgba(200,200,200,0.6)",
    borderColor: "'rgba(200,200,200,0.6)'",
    borderWidth: 3,
    data: [77384.44, 77384.44, 77384.44, 77384.44, 77384.44, 77384.44]
  }]
};

var lineChart = new Chart(ctx, {
  type: 'line',
  data: data,
  options: {
    categorySpacing: 20,
    spanGaps: false,
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

// All Data W2 v 1099

var ctx = document.getElementById("w2vs1099").getContext("2d");

var data = {
  labels: ["25th Percentile", "50th Percentile", "75th Percentile", "90th Percentile"],
  datasets: [{
    label: "Employee",
    backgroundColor: 'rgba(255,99,132,0.4)',
    borderColor: 'rgba(255,99,132,1)',
    borderWidth: 3,
    data: [50500, 74000, 95000, 116935.2]
    // Average value 68942.97,
  }, {
    label: "Contractor",
    backgroundColor: "rgba(54,162,235,0.4)",
    borderColor: 'rgba(54,162,235,1)',
    borderWidth: 3,
    data: [72500, 95000, 104500, 133000]
  }]
};

var lineChart = new Chart(ctx, {
  type: 'horizontalBar',
  data: data,
  options: {
    barValueSpacing: 20,
    scales: {
      yAxes: [{
        ticks: {
          min: 0,
        }
      }],
      xAxes: [{
        ticks: {
          beginAtZero: true,
          callback: function(value, index, values) { return '$' + value; },
        }
      }],
    }
  }
});

// All Data Local v Remote

var ctx = document.getElementById("alllocalvsremote").getContext("2d");

var data = {
  labels: ["25th Percentile", "50th Percentile", "75th Percentile", "90th Percentile"],
  datasets: [{
    label: "Local",
    backgroundColor: 'rgba(255,99,132,0.4)',
    borderColor: 'rgba(255,99,132,1)',
    borderWidth: 3,
    data: [43576.00, 65000.00, 82871.00, 98400.00]
    // Average value 68942.97,
  }, {
    label: "Remote  ",
    backgroundColor: "rgba(54,162,235,0.4)",
    borderColor: 'rgba(54,162,235,1)',
    borderWidth: 3,
    data: [80000.00, 96000.00, 117446.00, 129600.00]
  }]
};

var lineChart = new Chart(ctx, {
  type: 'horizontalBar',
  data: data,
  options: {
    barValueSpacing: 20,
    scales: {
      yAxes: [{
        ticks: {
          min: 0,
        }
      }],
      xAxes: [{
        ticks: {
          beginAtZero: true,
          callback: function(value, index, values) { return '$' + value; },
        }
      }],
    }
  }
});
