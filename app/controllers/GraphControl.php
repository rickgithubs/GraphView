<?php
//require_once("../models/Taxonomy.php");
//require_once('tax_short_list.include.php');

class GraphControl extends BaseController {

	/*
	|--------------------------------------------------------------------------
	| Default Home Controller
	|--------------------------------------------------------------------------
	|
	| You may wish to use controllers instead of, or in addition to, Closure
	| based routes. That's great! Here is an example controller method to
	| get you started. To route to this controller, just add the route:
	|
	|	Route::get('/', 'HomeController@showWelcome');
	|
	*/


	function new_browse($careset_code = '5', $tax_id = ''){
		//$this->_all_browse($careset_code);
	 	//if(isset($_GET['careset_code'])){
                  //      $carset_code = $_GET['careset_code'];
               // }
		//var_export($careset_code);

		$this->view_data['title'] = 'GraphBrowser';
		$this->view_data['careset_code'] = $careset_code;
		return $this->_render('graph_view_back');
		//return View::make('graph_view_back');
	}

	function browsev2($careset_code,$tax_id){
		//var_export($careset_code);
		//var_export($tax_id);
		//exit();
		 return View::make('graph_main.tpl');
	}

/**
 *	Browse provides the basic graph browser interface 
 
        function browse($careset_code = ''){

		$this->_all_browse($careset_code);

		$this->view_data['d3_browser_template'] = 'bubblesd3.javascript.tpl';
		$this->view_data['d3_browser_template'] = 'standard.javascript.tpl';

		return $this->_render('graph_browser');
        }
*/

}
