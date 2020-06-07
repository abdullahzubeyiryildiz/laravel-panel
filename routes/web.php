<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Auth::routes();

/*Route::get('/', function () {
    return view('front.homepage');
});*/

Route::get('/', 'Back\Dashboard@index')->name('admin.dashboard');

/* Route::prefix('admin')->name('admin.')->middleware('isLogin')->group(function(){
    Route::get('giris','Back\AuthController@login')->name('login');
    Route::post('giris','Back\AuthController@loginPost')->name('login.post');
  });
  */
  
  Route::get('admin/panel', 'Back\Dashboard@index')->name('admin.dashboard');
  Route::get('admin/giris', 'Back\Auth@login')->name('admin.login');


/*Route::get('/home', 'HomeController@index')->name('home');*/