<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;

//Registration Page
Route::get('/', function () {
    return view('register');
});

//Login Page
Route::view('/login', 'login')->name('login');

// Profile Page
// Route::middleware('auth:sanctum')->get('/profile', [ApiController::class, 'profile'])->name('profile');
Route::view('/profile', 'profile')->name('profile');
