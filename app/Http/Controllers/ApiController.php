<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ApiController extends Controller
{
    //Registration
    public function register(Request $request)
    {
        try {
            $validateUser = validator::make(
                $request->all(),
                [
                    'name' => 'required',
                    'email' => 'required|email|unique:users,email',
                    'password' => 'required'

                ]
            );

            if ($validateUser->fails()) {
                return response()->json(
                    [
                        'status' => false,
                        'message' => 'validation error',
                        'errors' => $validateUser->errors()
                    ],
                    401
                );
            }
            $user = User::create(
                [
                    'name' => $request->name,
                    'email' => $request->email,
                    'password' => $request->password
                ]
            );
            return response()->json(
                [
                    'status' => true,
                    'message' => 'Registration Success',
                    'token' => $user->createToken("API TOKEN")->plainTextToken,
                ],
                200
            );
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }


    //Login
    public function login(Request $request)
    {
        try {
            $validateUser = validator::make(
                $request->all(),
                [
                    'email' => 'required|email',
                    'password' => 'required'
                ]
            );

            if ($validateUser->fails()) {
                return response()->json(
                    [
                        'status' => false,
                        'message' => 'validation error',
                        'errors' => $validateUser->errors()
                    ],
                    401
                );
            }

            if (!Auth::attempt($request->only(['email', 'password']))) {
                return response()->json(
                    [
                        'status' => false,
                        'message' => 'Unauthorized Access',
                    ],
                    401
                );
            }
            $user = User::where('email', $request->email)->first();

            return response()->json([
                'status' => true,
                'message' => 'Login Success',
                'token' => $user->createToken("API TOKEN")->plainTextToken,
                'redirect' => route('profile')
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    //Profile
    public function profileApi()
    {
        $userData = auth()->user();
        return response()->json([
            'status' => true,
            'message' => 'Profile Success',
            'user' => $userData,
        ], 200);
    }




}

//login, register, profile, logout
