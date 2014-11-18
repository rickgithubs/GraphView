<?php
//require_once("../models/Taxonomy.php");
require_once('tax_short_list.include.php');
require_once('functions.php');

class GraphController extends BaseController {


	function browsev1($careset_code = ''){
//		$this->_all_browse($careset_code);
		return $this->_render('graph_main');
	}


/**
 *	_all_browse provides the core browser setup functions for all browser views...
 *	This is a place for all shared codes...
 */

/*
	function _all_browse($careset_code = ''){


                $this->view_data['title'] = 'Graph Browser';

	
		if(isset($_GET['careset_code'])){
			$carset_code = $_GET['careset_code'];
		}

		if(strlen($careset_code) > 0){


			$tax_id = Input::get('tax_id', 47);

			$this->view_data['tax_id'] = $tax_id;		

			$this->view_data['data_url'] = "/data/patch_json.php?careset_code=$careset_code&tax_id=$tax_id";

			$tax_short_list = get_tax_short_list();
			asort($tax_short_list);
			$this->view_data['tax_name'] = $tax_short_list[$tax_id];

			$this->view_data['tax_list'] = $tax_short_list;
			$this->view_data['careset_code'] = $careset_code;


			if(strlen($careset_code) == 10 && is_numeric($careset_code)){
				//this is the shortcut to treat an npi as a careset...

                     		$this->view_data['careset_name'] = $careset_code;	
                     		$this->view_data['careset_note'] = "Dynamic Careset from <br> NPI:$careset_code";	

			}else{
			                $sql = " 
SELECT * 
FROM  patch.caresets
LEFT JOIN patch.npi_to_caresets ON patch.caresets.id = patch.npi_to_caresets.careset_id
WHERE  caresets.code = '$careset_code'
";

					

		    	$results = DB::select( DB::raw($sql));
                     	foreach($results as $row){    
                                        //there is only one result...   
                    	}

                     	$this->view_data['careset_name'] = make_slug($row->name);	
                     	$this->view_data['careset_note'] = $row->notes;	
			}

		}

	}

*/

}
