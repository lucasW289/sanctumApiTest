<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class ApiController extends Controller
{
    //Registration
    public function register(Request $request)
    {
        try {
            $validateUser = Validator::make(
                $request->all(),
                [
                    'name' => 'required',
                    'email' => 'required|email|unique:users,email',
                    'password' => 'required'
                ]
            );

            if ($validateUser->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'The Email has been used to register. Please Login instead',
                    'errors' => $validateUser->errors()
                ], 401);
            }

            // Create the user
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);

            // Simulate a failure scenario (for example)
            if (!$user) {
                throw new \Exception('Failed to create user.');
            }

            return response()->json([
                'status' => true,
                'message' => 'Registration Success',
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
                'message' => 'Authorized\nWelcome Back!',
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
    // File Upload
    public function uploadFile(Request $request)
    {
        $request->validate([
            'file' => 'required|file|max:2048',
        ]);

        $user = Auth::user();
        $file = $request->file('file');
        $filePath = $file->store('uploads', 'public');

        $fileModel = new File();
        $fileModel->user_id = $user->id;
        $fileModel->file_name = $file->getClientOriginalName();
        $fileModel->file_path = $filePath;
        $fileModel->save();

        return response()->json([
            'status' => true,
            'message' => 'File uploaded successfully',
            'file' => $fileModel,
        ], 200);
    }

    // File Download
    public function downloadFile($id)
    {
        $file = File::findOrFail($id);
        $user = Auth::user();

        if ($file->user_id != $user->id) {
            return response()->json([
                'status' => false,
                'message' => 'Unauthorized access',
            ], 403);
        }

        return Storage::disk('public')->download($file->file_path, $file->file_name);
    }

    public function listFiles()
    {
        $user = Auth::user();
        $files = $user->files()->get();

        return response()->json([
            'status' => true,
            'files' => $files,
        ], 200);
    }
    public function shareFiles(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => 'required|email',
                'fileIds' => 'required|array',
                'fileIds.*' => 'exists:files,id,user_id,' . auth()->id(), // Ensure user owns the file
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validation error',
                    'errors' => $validator->errors()
                ], 400);
            }

            $targetUser = User::where('email', $request->email)->first();

            if (!$targetUser) {
                return response()->json([
                    'status' => false,
                    'message' => 'The target user does not exist.'
                ], 404);
            }

            foreach ($request->fileIds as $fileId) {
                $file = File::findOrFail($fileId);
                // Duplicate the file for the target user
                $newFile = $file->replicate();
                $newFile->user_id = $targetUser->id; // Assign ownership to the target user
                $newFile->save();
            }

            return response()->json([
                'status' => true,
                'message' => 'Files shared successfully',
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }
}

    //login, register, profile, logout
