<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;

//Registration Page
Route::post('/', function () {
    return view('register');
});

//Login Page
Route::view('/login', 'login');

// Profile Page
Route::middleware('auth:sanctum')->get('/profile', [ApiController::class, 'profile'])->name('profile');
