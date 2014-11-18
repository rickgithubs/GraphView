<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	return View::make('index.html');
});

//Route::get("graph/{careset_code}/{tax_id}", "GraphControl@browsev2");
Route::get("graph/{careset_code}/{tax_id}", "GraphControl@new_browse");
//Route::get("graph_old/{careset_code}", "GraphController@browsev1");
