<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;


/*Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');*/

//Register
Route::post("register", [ApiController::class, "register"]);

//Login
Route::post('login', [ApiController::class, 'login'])->name('login');

Route::group([
    "middleware"=>["auth:sanctum"]
],function(){
    //User Profile
    Route::get("profile", [ApiController::class, "profileApi"]);
    Route::get("profile", [ApiController::class, "profile"]);


    //Logout
    Route::get("logout", [ApiController::class, "logout"]);
});
