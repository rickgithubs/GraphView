{literal}
<script>
var        rightEdge = 10;


  var widthScale = d3.scale.linear()
                        .domain([10,50000])
                        .range([50,1000]);


function randomIntFromInterval(min,max)
{
    return Math.floor(Math.random()*(max-min+1)+min);
}

//var myNodeColors = d3.scale.category10();

var config = {
            dataSource: 'http://patch.ft1.us/data/patch_alchemy_json.php?careset_code=e41812d6&tax_id=47',
            graphHeight: function() { return window.innerHeight - 150; },
            graphWidth: function() { return window.innerWidth -300;},
            forceLocked: false,
	    cluster: false,		
	    nodeCaptionsOnByDefault: true,
	  // theme: "white",   
	    directedEdges: false,
	    edgeCaption: false,
	    initialScale: ".6",
	    nodeTypes: { "type": 
                ["1", "2"] 
            }, 
/*           
	    nodeClick: function(node) { 
		//	var d = node.self; 
//			console.log(node.getProperties());

		$.getJSON(node.self.getProperties('data_url'), function(data) {
                                        dust.render('npi_panel.dust', data, function(err, out){
                                                         $('#npi_left_panel').html(out);
                                                                                    });
                                                      });
	

				      },
	*/
	    nodeClick: function(d){
		console.log(d);
		var data_url ='http://patch.ft1.us/data/npi_json.php?npi=' + d.id;

		$.getJSON(data_url, function(data) {
                                        dust.render('npi_panel.dust', data, function(err, out){
                                                         $('#npi_left_panel').html(out);
});
                                         	      });

				},



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
alchemy.begin(config);
</script>
{/literal}
