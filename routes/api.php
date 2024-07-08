<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;


/*Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');*/

//Register
Route::post("register", [ApiController::class, "register"])->name('registerApi');

//Login
Route::post('login', [ApiController::class, 'login'])->name('login');

Route::group([
    "middleware"=>["auth:sanctum"]
],function(){
    //User Profile
    Route::get("profile", [ApiController::class, "profileApi"])->name('profileApi');

    // File Upload
    Route::post('upload-file', [ApiController::class, 'uploadFile'])->name('uploadFile');

    // File Download
    Route::get('download-file/{id}', [ApiController::class, 'downloadFile'])->name('downloadFile');

    Route::get('files', [ApiController::class, 'listFiles'])->name('listFiles');


});
