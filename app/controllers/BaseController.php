<?php

class BaseController extends Controller {

	var $view_data = array(); ///where we store the view data!!
	var $is_admin; // is this user an administrator
	var $is_chrome; //is the user working with a chrome browser..
	var $is_ie; //the dreaded browser from microsoft	

	function __construct(){


		//Browser version detection...
		$this->is_ie = false;
		$this->view_data['is_ie'] = false;
		$this->is_chrome = false;
		$this->view_data['is_chrome'] = false;

		if (strpos($_SERVER['HTTP_USER_AGENT'], 'Chrome') !== false)
		{
			$this->is_chrome = true;
			$this->view_data['is_chrome'] = true;
    			// User agent is not Google Chrome
		}else{

			if(preg_match('/(?i)msie [1-9]/',$_SERVER['HTTP_USER_AGENT']))
			{
				$this->is_ie = true;
				$this->view_data['is_ie'] = true;
		
			}

		}

	

	}

	/**
	 * Catch-all method for requests that can't be matched.
	 *
	 * @param  string    $method
	 * @param  array     $parameters
	 * @return Response
	 */
	public function __call($method, $parameters)
	{
		return Response::error('404');
	}

	//NOD custom code...

/**
 *   This internal _render function is what makes Smarty work with Laravel.
 */
        public function _render($template_name){

                $base_url = URL::to('/');
                $this->view_data['base_url'] = $base_url;

                $this->view_data['title'] = Config::get('app.site_name');
                $this->view_data['copyright'] = Config::get('app.copyright');
		
		$menu = Config::get('app.menu');
                $this->view_data['menu'] = $menu;
		
                $menu_contents = View::make('menu',$this->view_data);
		$this->view_data['menu_contents'] = $menu_contents;

                $view_contents = View::make($template_name,$this->view_data);
                $this->view_data['view_contents'] = $view_contents;

                $return_me = View::make('html',$this->view_data);
	
		return($return_me);
		
        }

/**
 *   This internal _render function is what makes Smarty work with Laravel.
 * 	This version does not render any menu items...
 */
        public function _renderonly($template_name){

                $base_url = URL::to('/');
                $this->view_data['base_url'] = $base_url;

                $this->view_data['title'] = Config::get('app.site_name');
                $this->view_data['copyright'] = Config::get('app.copyright');
		
                $view_contents = View::make($template_name,$this->view_data);
                $this->view_data['view_contents'] = $view_contents;

                $return_me = View::make('html',$this->view_data);
	
		return($return_me);
		
        }



}
