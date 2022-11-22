<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthService
{
    /**
     * Login
     *
     * @param  mixed $credentials
     * @return array
     */
    public function login($credentials)
    {
        $token = Auth::attempt($credentials);
        if (!$token) {
            return [
                'responseBody' => [
                    'status' => 'error',
                    'message' => 'Unauthorized',
                ],
                'responseCode' => 401
            ];
        }

        $user = Auth::user();

        return [
            'responseBody' => [
                'status' => 'success',
                'user' => $user,
                'authorisation' => [
                    'token' => $token,
                    'type' => 'bearer',
                ]
            ],
            'responseCode' => 200
        ];
    }
    
    /**
     * Register
     *
     * @param  mixed $credentials
     * @return array
     */
    public function register($credentials)
    {
        $user = User::create([
            'name' => $credentials->name,
            'email' => $credentials->email,
            'password' => Hash::make($credentials->password),
        ]);

        $token = Auth::login($user);
        return [
            'responseBody' => [
                'status' => 'success',
                'message' => 'User created successfully',
                'user' => $user,
                'authorisation' => [
                    'token' => $token,
                    'type' => 'bearer',
                ]
            ],
            'responseCode' => 200
        ];
    }

    public function logout()
    {
        Auth::logout();
    }
}
