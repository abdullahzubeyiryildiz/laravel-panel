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



/* Route::prefix('admin')->name('admin.')->middleware('isLogin')->group(function(){
    Route::get('giris','Back\AuthController@login')->name('login');
    Route::post('giris','Back\AuthController@loginPost')->name('login.post');
  });
  */
  
  Route::prefix('admin')->name('admin.')->middleware('isLogin')->group(function(){
    Route::get('giris','Back\AuthController@login')->name('login');
    Route::post('giris','Back\AuthController@loginPost')->name('login.post');
  });

  Route::prefix('admin')->name('admin.')->middleware('isAdmin')->group(function(){
    Route::get('/panel', 'Back\Dashboard@index')->name('dashboard');
      // PRODUCT ROUTE'S
    Route::get('urunler/silinenler','Back\ProductController@trashed')->name('trashed.product');
    Route::resource('urunler','Back\ProductController');
    Route::get('/switch', 'Back\ProductController@switch')->name('switch');
    Route::get('/deleteproduct/{id}', 'Back\ProductController@delete')->name('delete.product');
    Route::get('/harddeleteproduct/{id}','Back\ProductController@hardDelete')->name('hard.delete.product');
    Route::get('/recoverproduct/{id}','Back\ProductController@recover')->name('recover.product');

    // CATEGORY ROUTE'S
  Route::get('/kategoriler','Back\CategoryController@index')->name('category.index');
  Route::post('/kategoriler/create','Back\CategoryController@create')->name('category.create');
  Route::post('/kategoriler/update','Back\CategoryController@update')->name('category.update');
  Route::post('/kategoriler/delete','Back\CategoryController@delete')->name('category.delete');
  Route::get('/kategori/status','Back\CategoryController@switch')->name('category.switch');
  Route::get('/kategori/getData','Back\CategoryController@getData')->name('category.getdata');

    Route::get('cikis', 'Back\AuthController@logout')->name('logout');
  });



Route::get('/', 'Back\AuthController@login')->name('login');