<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class UsersTest extends TestCase
{    
    /**
     * test_get_all_users_psots_comments
     *
     * @return void
     */
    public function test_get_all_users_psots_comments()
    {
        $user = \App\Models\User::first();
        $post = \App\Models\Posts::pluck('id')->random();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->get('/api/users', [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'status', 'users'
            ]);
    }
}
