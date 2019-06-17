<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('user_list',"MainController@user_list");
Route::post('insert_user',"MainController@insert_user");
Route::post('update_location',"MainController@update_location");
Route::post('get_location',"MainController@get_location");
////////////////////// Original ///////////////////////////////////
Route::post('signup_post',"UserAuthRegController@signup_post");
Route::get('select_supervisor',"UserAuthRegController@select_supervisor");
Route::get('select_group',"UserAuthRegController@select_group");