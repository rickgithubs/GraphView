	  <div class="row">
      <!-- Example row of columns -->
      <div class="col-md-2">
        <div class="panel panel-default">
          <div class="panel-body">
            <form method="GET">

{include file='taxonomy_dropdown.tpl'}

		<br><br>
              <input type="submit" class="btn  btn-primary" value="Reload Graph">
              <br>
<div class='hidden-sm hidden-xs'>
              Attraction (Links)<br>
              <input id="attractionSlider" type="range" onchange="updateForce();" min="-200" max="2000" step="1" value="50">
              <input type="hidden" id="attractionInput" value="50">Charge (Nodes)<br>
              <input id="repulsionSlider" type="range" onchange="updateForce();" min="-5000" max="0" step="1" value="-60">
              <input type="hidden" id="repulsionInput" value="-60">
              <br>
              Freeze Display<br>
              <button type="button" class="btn  btn-danger btn-sm" onclick="true_freeze();">
                <span class="glyphicon glyphicon-pause"></span>
              </button>
              <button type="button" class="btn  btn-success btn-sm" onclick="true_unfreeze();">
                <span class="glyphicon glyphicon-play"></span>
              </button><br>

              Gravity Shift<br>
              <button type="button" class="btn  btn-info btn-sm" onclick="currentFoci = -1; force.start();">
                <span class="glyphicon glyphicon-chevron-left"></span>
              </button>
              <button type="button" class="btn  btn-info btn-sm" onclick="currentFoci = 0; force.start();">
                <span class="glyphicon glyphicon-chevron-down"></span>
              </button>
              <button type="button" class="btn  btn-info btn-sm" onclick="currentFoci = 1; force.start();">
                <span class="glyphicon glyphicon-chevron-right"></span>
              </button><br>
</div>
              <br>
              <div class="btn-group-verticali hidden-sm hidden-xs">
<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="This button downloads a zoomable SVG image of the graph, as it is currently laid out!">
<a class='btn btn-primary' id='down_svg_link' onclick='downloadSVG();'>Download diagram </a>
</button>
                </div>
            </form>
            <hr>
            <div class="panel-group hidden-sm hidden-xs" id="accordion">
  <div class="panel panel-default" id='left-panel'>
<div id="npi_left_panel">



</div>

  </div> <!-- end left panel -->
<a href="{$data_url}">.</a>
</div>
</div>
</div>

</div>
<!-- resuming the bootstrap parts -->

<div class='col-md-10'>
      			<div class="col-md-6">
        			<ol class="breadcrumb">
         				<li><a href="/careset/list">All Caresets </a></li>
  					<li><a href="/careset/show/{$careset_code}">{$careset_name}</a></li>
  					<li class="active">Graph Browser</li>
          			</ol>   
        		</div>
      			<div class="col-md-4">
      			</div>

</div>

<div class='col-md-10'>
{if $is_chrome}
		<div class id='viz'> </div>
		{include file='graph_js.tpl'}

{else}
<br>
	<h3> This interface is only supported on chrome browsers </h3>

<!-- including javascript file here -->


{/if}

</div>
</div>

