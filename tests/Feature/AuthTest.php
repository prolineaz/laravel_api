<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Str;
use Tests\TestCase;

class AuthTest extends TestCase
{

    public function test_api_register()
    {
        $username = strtolower(Str::random(10));

        $response = $this->post('/api/auth/register', [
            'name' => 'Test_' . $username,
            'email' => $username . '@gmail.com',
            'password' => '123456789',
            'password_confirmation' => '123456789'
        ], [
            'Accept' => 'application/json',
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'user', 'authorisation'
            ]);
    }
    /**
     * Api Login With Correct Credentials
     *
     * @return mixed
     */
    public function test_api_login_with_correct_credentials()
    {
        $response = $this->post('/api/auth/login', [
            'email' => 'demouser@gmail.com',
            'password' => '123456789'
        ], [
            'Accept' => 'application/json',
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'user', 'authorisation'
            ]);
    }

    /**
     * Api Login With Incorrect Credentials
     *
     * @return mixed
     */
    public function test_api_login_with_incorrect_credentials()
    {
        $response = $this->post('/api/auth/login', [
            'email' => 'demouser@gmail.com',
            'password' => '111'
        ], [
            'Accept' => 'application/json',
        ]);

        $response->assertStatus(401)
            ->assertJsonStructure([
                'status', 'message'
            ]);
    }

    public function test_api_logout()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/auth/logout', [], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'status', 'message'
            ]);
    }

    public function test_api_refresh_jwt_token()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/auth/refresh', [], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'status', 'user', 'authorisation'
            ]);
    }
}
