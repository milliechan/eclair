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
  // listenForShowDonutButton();

  function initializeCostEstimateGraph() {

        var address = window.location.href
    var split_address = address.split('/');
    var event_id = split_address[split_address.length - 2];

    var request = $.ajax({
      url: "/users/"+event_id+"/donut",
      type: 'get'
    })

    request.done(function(response) {

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
 function loadGraphWhenInView() {
   // init controller
 var controller = new ScrollMagic.Controller();

//  // build scene
 var scene = new ScrollMagic.Scene({triggerElement: ".features", duration: 200, offset: 0})
 				.addTo(controller)
         .setPin("#graph")
 				// .addIndicators() // add indicators (requires plugin)
 				.on("update", function (e) {
 					$("#scrollDirection").text(e.target.controller().info("scrollDirection"));
 				})
 				.on("enter leave", function (e) {
           if (e.type == "enter") {
             initializeCostEstimateGraph();
           }
 					$("#state").text(e.type == "enter" ? "inside" : "outside");
 				})
 				.on("start end", function (e) {
 					$("#lastHit").text(e.type == "start" ? "top" : "bottom");
 				})
 				.on("progress", function (e) {
 					$("#progress").text(e.progress.toFixed(3));
 				});
 }

  loadGraphWhenInView();

var redirectToGraph = function() {
  // var address = window.location.href
  // var split_address = address.split('/');
  // var event_id = split_address[split_address.length - 2];
  // window.location = "/users/"+event_id
  window.location = 'www.google.com'
}


});

 var listenForAddMedicine = function() {
   $('.add').on('click', function() {
     event.preventDefault();
     $('#enterMeds').show();
   });
 };

 // var listenForShowDonutButton = function() {
 //  $('.show_donut_button').on('click', function(event) {
 //    event.preventDefault();

 //    var address = window.location.href
 //    var split_address = address.split('/');
 //    var event_id = split_address[split_address.length - 2];

 //    var request = $.ajax({
 //      url: "/users/"+event_id+"/donut",
 //      type: 'get'
 //    })

 //    request.done(function(response) {
 //      console.log("Request successful");
 //      console.log(response);
 //      var obj = response;
 //      var labels = [
 //              "$" + obj.graph[1].cost + " January",
 //              "$" + obj.graph[2].cost + " February",
 //              "$" + obj.graph[3].cost + " March",
 //              "$" + obj.graph[4].cost + " April",
 //              "$" + obj.graph[5].cost + " May",
 //              "$" + obj.graph[6].cost + " June",
 //              "$" + obj.graph[7].cost + " July",
 //              "$" + obj.graph[8].cost + " August",
 //              "$" + obj.graph[9].cost + " September",
 //              "$" + obj.graph[10].cost + " October",
 //              "$" + obj.graph[11].cost + " November",
 //              "$" + obj.graph[12].cost + " December"
 //              ];
 //      var data = {
 //        datasets: [{
 //            data: [2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016],
 //            backgroundColor: [
 //              "#AFE086",
 //              "#AFE086",
 //              "#AFE086",
 //              "#AFE086",
 //              "#AFE086",
 //              "#AFE086",
 //              "#AFE086",
 //              "#FF8E8E",
 //              "#FF8E8E",
 //              "#FF8E8E",
 //              "#AFE086",
 //              "#AFE086"
 //            ]
 //        }]
 //      };


 //      function Redirect(data) {
 //        window.location.href = "/users/"+event_id;
 //        function loadGraphWhenInView(data)
 //        function getGraphElement() {
 //          return document.getElementById("costEstimateGraph");
 //        }
 //        function getOptions() {
 //          return {
 //           onClick: function() {
 //              // alert('on click');
 //            },

 //            // responsiveAnimationDuration: 2000,
 //            cutoutPercentage: 30,
 //          };
 //        }

 //        new Chart(getGraphElement(), {
 //            type: 'pie',
 //            labels: labels,
 //            data: data,
 //            options: getOptions()
 //        });
 //      }

 //      Redirect(data);

 //      // debugger;
 //      // var context = document.getElementById('costEstimateGraph');

     



 //      // window.location = 'www.google.com'
 //      // redirectToGraph(); 
 //      // console.log(obj.graph[1].cost)
 //    })

 //  })
 // }



