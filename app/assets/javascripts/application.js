// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  $('#enterMeds').hide();
  listenForAddMedicine();
  listenForUpdateChart();

  function initializeCostEstimateGraph() {

    var address = window.location.href
    var split_address = address.split('/');
    var event_id = split_address[split_address.length - 1];

    var request = $.ajax({
      url: "/users/"+event_id+"/donut",
      type: 'get'
    })

    request.done(function(response) {
      console.log(response + '888888888888888');
      function getLabels() {
        return [
          "$" + response.graph[1].cost + " January",
          "$" + response.graph[2].cost + " February",
          "$" + response.graph[3].cost + " March",
          "$" + response.graph[4].cost + " April",
          "$" + response.graph[5].cost + " May",
          "$" + response.graph[6].cost + " June",
          "$" + response.graph[7].cost + " July",
          "$" + response.graph[8].cost + " August",
          "$" + response.graph[9].cost + " September",
          "$" + response.graph[10].cost + " October",
          "$" + response.graph[11].cost + " November",
          "$" + response.graph[12].cost + " December"
        ];
      }
      function getDatasetData() {
        return [2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016];
      }
      var colorArray = []
      for (var i = 1; i < 13; i++) {
        if (response.graph[i].in_dh == true){
          colorArray.push("#FF8E8E")
        }
        else {
          colorArray.push("#AFE086")
        }
      }
      console.log(colorArray)
      function getBackgroundColor() {
      console.log(colorArray)
        return colorArray;
      }
      function getHoverBackgroundColor() {
        return colorArray;
      }
      function getOptions() {
        return {
        	onClick: function() {
            // alert('on click');
          },

          // responsiveAnimationDuration: 2000,
          cutoutPercentage: 30,
        };
      }
      function getData() {
        return {
            labels: getLabels(),
            datasets: [{
              data: getDatasetData(),
              backgroundColor: getBackgroundColor(),
              hoverBackgroundColor: getHoverBackgroundColor()
            }]
        };
      }

      function getGraphElement() {
        return document.getElementById("costEstimateGraph");
      }

      var myPieChart = new Chart(getGraphElement(), {
          type: 'pie',
          data: getData(),
          options: getOptions()
      });
    });

    // For a pie chart
  }

// initializeCostEstimateGraph();
//  function loadGraphWhenInView() {
//    // init controller
//  var controller = new ScrollMagic.Controller();
//
// //  // build scene
//  var scene = new ScrollMagic.Scene({triggerElement: ".features", duration: 200, offset: 0})
//  				.addTo(controller)
//         .setPin("#graph")
//  				// .addIndicators() // add indicators (requires plugin)
//  				.on("update", function (e) {
//  					$("#scrollDirection").text(e.target.controller().info("scrollDirection"));
//  				})
//  				.on("enter leave", function (e) {
//            if (e.type == "enter") {
//              initializeCostEstimateGraph();
//            }
//  					$("#state").text(e.type == "enter" ? "inside" : "outside");
//  				})
//  				.on("start end", function (e) {
//  					$("#lastHit").text(e.type == "start" ? "top" : "bottom");
//  				})
//  				.on("progress", function (e) {
//  					$("#progress").text(e.progress.toFixed(3));
//  				});
//  }

 initializeCostEstimateGraph();
  //
  // loadGraphWhenInView();

});

 var listenForAddMedicine = function() {
   $('.add').on('click', function() {
     event.preventDefault();
     $('#enterMeds').show();
   });
 };

var listenForUpdateChart = function() {
  $('#getGenericDrugsButton').on('click', function() {
    event.preventDefault();
  })
}
