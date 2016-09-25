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

  function initializeCostEstimateGraph() {
    function getLabels() {
      return [
          "January $20",
          "February $20",
          "March $20",
          "April $20",
          "May $20",
          "June $20",
          "July $20",
          "August $500",
          "September $500",
          "October $500",
          "November $20",
          "December $20"
      ];
    }
    function getDatasetData() {
      return [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    }
    function getBackgroundColor() {
      return [
          "#AFE086",
          "#AFE086",
          "#AFE086",
          "#AFE086",
          "#AFE086",
          "#AFE086",
          "#AFE086",
          "#FF8E8E",
          "#FF8E8E",
          "#FF8E8E",
          "#AFE086",
          "#AFE086"
      ];
    }
    function getHoverBackgroundColor() {
      return [
          "#C6F0A3",
          "#C6F0A3",
          "#C6F0A3",
          "#C6F0A3",
          "#C6F0A3",
          "#C6F0A3",
          "#C6F0A3",
          "#FFC3BC",
          "#FFC3BC",
          "#FFC3BC",
          "#C6F0A3",
          "#C6F0A3"
      ];
    }
    function getOptions() {
      return {
      	onClick: function() {
          // alert('on click');
        },
        // responsiveAnimationDuration: 2000,
        cutoutPercentage: 30
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

    // For a pie chart
    var myPieChart = new Chart(getGraphElement(), {
        type: 'pie',
        data: getData(),
        options: getOptions()
    });
  }

  initializeCostEstimateGraph();

  // function loadGraphWhenInView() {
  //   // init controller
	// var controller = new ScrollMagic.Controller();
  //
	// // build scene
	// var scene = new ScrollMagic.Scene({triggerElement: ".features", duration: 200, offset: 0})
	// 				.addTo(controller)
  //         .setPin("#graph")
	// 				// .addIndicators() // add indicators (requires plugin)
	// 				.on("update", function (e) {
	// 					$("#scrollDirection").text(e.target.controller().info("scrollDirection"));
	// 				})
	// 				.on("enter leave", function (e) {
  //           if (e.type == "enter") {
  //             initializeCostEstimateGraph();
  //           }
	// 					$("#state").text(e.type == "enter" ? "inside" : "outside");
	// 				})
	// 				.on("start end", function (e) {
	// 					$("#lastHit").text(e.type == "start" ? "top" : "bottom");
	// 				})
	// 				.on("progress", function (e) {
	// 					$("#progress").text(e.progress.toFixed(3));
	// 				});
  // }
  //
  // loadGraphWhenInView();


});

 var listenForAddMedicine = function() {
   $('.add').on('click', function() {
     event.preventDefault();
     $('#enterMeds').show();
   })
 };
