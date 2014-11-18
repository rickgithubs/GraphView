<!doctype html>
<html>
  <head>
    	<title>CareSet Spider Alpha</title>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta name="description" content="">
    	<meta name="author" content="">


 <!-- using locally served javascript and css -->

    	<!-- standard styles -->
    	<link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
    	<link type="text/css" rel="stylesheet" href="/css/font-awesome.css">
    	<link type="text/css" rel="stylesheet" href="/css/colors.css">
    	<link type="text/css" rel="stylesheet" href="/css/case.css">
        <link type="text/css" rel="stylesheet" href="/css/tablesorter.css"/>
        <link type="text/css" rel="stylesheet" href="/css/theme.bootstrap.css"/>
    	<link type="text/css" rel="stylesheet" href="/css/nv.d3.css">
        <link type="text/css" rel="stylesheet" href="/css/leftlist.css"/>
        <link type="text/css" rel="stylesheet" href="/css/bootstrap-dialog.css"/>
        <link rel="stylesheet" href="http://cdn.graphalchemist.com/alchemy.css">





    	<!-- standard javascript -->
    	<script type="text/javascript" language="javascript" src="/js/jquery.min.js"></script>
    	<script type='text/javascript' language="javascript" src="/js/jquery.tablesorter.min.js"></script>
    	<script type='text/javascript' language="javascript" src="/js/jquery.tablesorter.widgets.min.js"></script>
	<script type='text/javascript' language="javascript" src='/js/d3.v3.js'></script>
	<script type='text/javascript' language="javascript" src='/js/dust-core-2.2.0.js'></script>
	<script type="text/javascript" language="javascript" src="/js/dust-helpers-1.1.1.js"></script>
    	<script type="text/javascript" language="javascript" src="/js/bootstrap.min.js"></script>
    	<script type="text/javascript" language="javascript" src="/js/jqBootstrapValidation.js"></script>
    	<script type="text/javascript" language="javascript" src="/js/bootstrap-dialog.js"></script>
	<script type="text/javascript" language="javascript" src="/js/cycle.js"></script>	
	<script type="text/javascript" language="javascript" src="//cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.js"></script>	
 
	<script type="text/javascript" src="http://cdn.graphalchemist.com/alchemy.min.js">
        <!-- custom javascript -->
	<script type="text/javascript" src="/js/util.js"></script>
	<script type="text/javascript" src="/js/careset_api.js"></script>
	
        <!-- custom css -->
        <link type="text/css" rel="stylesheet" href="/css/colors.css"/>

	<!-- load our dust templates -->
	<script src='/dust/npi_panel_dust.js'></script>
	<script src='/dust/header_dust.js'></script>
	<script src='/dust/breadcrumbs_dust.js'></script>


    	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    	<!--[if lt IE 9]>
      		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    	<![endif]-->

    	<!-- Fav and touch icons -->
    	<link rel="shortcut icon" href="favicon.ico">


	<style type="text/css">

      		body {
        		padding-top: 50px;
        		padding-bottom: 20px;
      			}



		svg {
			background: white;
		}

		hidden{
			color: red;
		}

		.edge {

			stroke: black,
			fill: red;
		}
    	</style>
  </head>  
  <body>
	<div id ="dust_header">
	</div>

		  <div class="row">
      <!-- Example row of columns -->
      <div class="col-md-2">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4> <a href="http://patch.ft1.us/data/patch_json.php?careset_code=48171347&tax_id=47">json datasource</a></h4>
		<p>	 </p>
          </div>
          <div class="panel-body">
              <br>
<!--
              <div class="btn-group-verticali hidden-sm hidden-xs">
<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="This button downloads a zoomable SVG image of the graph, as it is currently laid out!">
<a class='btn btn-primary' id='down_svg_link' onclick='downloadSVG();'>Download diagram </a>
</button>
               </div>
--> 
<h1> Side Stuff </h1>

<p>{$title}</p>
            <hr>
            <div class="panel-group hidden-sm hidden-xs" id="accordion">
  <div class="panel panel-default" id='left-panel'>
 		<br>Freeze Display<br>
              <button type="button" class="btn  btn-danger btn-sm" onclick="true_freeze();">
                <span class="glyphicon glyphicon-pause"></span>
              </button>
              <button type="button" class="btn  btn-success btn-sm" onclick="true_unfreeze();">
                <span class="glyphicon glyphicon-play"></span>
              </button><br>


<div id="npi_left_panel">


</div>


  </div> <!-- end left panel -->
</div>
</div>
</div>

</div>
<!-- resuming the bootstrap parts -->

<div id="dust_breadcrumbs">
</div>
<div class='col-md-10'>

<div id="alchemy" class="alchemy"></div>
</div>
</div>

<!-- including javascript file here -->


<script>
var        rightEdge = 10;


  var widthScale = d3.scale.linear()
                        .domain([10,50000])
                        .range([50,1000]);


function randomIntFromInterval(min,max)
{
    return Math.floor(Math.random()*(max-min+1)+min);
}

var header_data = {
   title:"WebGraph",
   logout_link:"http://patch.ft1.us/logout.php",
   username: "rick.trotter@gmail.com",
   home_link: "http://patch.ft1.us",
   data:[
      {
         caption:"CAYENNE (84)",
         id:1013964519
      }
   ]
};
console.log(header_data);

  
            dust.render('header.dust',header_data, function(err, out){
                                                         $('#dust_header').html(out);
                                                                                    });


//var myNodeColors = d3.scale.category10();

var config = {
            dataSource: 'http://patch.ft1.us/data/patch_alchemy_json.php?careset_code=e41812d6&tax_id=47',
            graphHeight: function() { return window.innerHeight - 60; },
            graphWidth: function() { return window.innerWidth -210;},
            forceLocked: true,
	    cluster: false,		
	    nodeCaptionsOnByDefault: true,
	  // theme: "white",
	    //search: true,   
	    directedEdges: false,
	    edgeCaption: false,
	    initialScale: ".6",
	    nodeTypes: { "type": 
                ["1", "2"] 
            }, 
          
	    nodeClick: function(node) { 
		//	var d = node.self; 
//			console.log(node.getProperties());

		$.getJSON(node.self.getProperties('data_url'), function(data) {
                                        dust.render('npi_panel.dust', data, function(err, out){
                                                         $('#npi_left_panel').html(out);
                                                                                    });
                                                      });
	

				      },
	/*
	    nodeClick: function(d){
		console.log(d);
		var data_url ='http://patch.ft1.us/data/npi_json.php?npi=' + d.id;

		$.getJSON(data_url, function(data) {
                                        dust.render('npi_panel.dust', data, function(err, out){
                                                         $('#npi_left_panel').html(out);
                                                 				    });
                                         	      });

				},

*/

	     nodeStyle: {
                "all": {
                    "borderColor": "#127DC1",
                    "borderWidth": function(d, radius) {
                        return radius / 4
                    },

                    "color": function(d) { 
                        return "rgba(104, 185, 254, " + 
                        (d.getProperties().zip / 100) + " )" 
                    }, 

                    "radius": function(d) {
                        return (d.getProperties().size)
                         
                    }, 
                },
                "1":{
                    "color": "#000067",
                    "selected": {
                        "color": "#ffffff",
                    },                    
                    "2": {
                        "color": "#b4dcff"
                    }
                }
            },
            edgeStyle: {
              "hidden": {
		   "opacity": .3  
		},
	      "all": {
		  "opacity": .35,
		  "width": function(d) {
                     return (d.getProperties().value) *.012
		    }
                }
            }

        };

    alchemy.begin(config)



</script>






  </body>

</html>
