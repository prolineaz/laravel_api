<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class PostsTest extends TestCase
{
    /**
     * test_create_post
     *
     * @return mixed
     */
    public function test_create_post()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/posts/store', [
            'user_id' => $user->id,
            'title' => 'Any title',
            'description' => 'Any description'
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'status', 'message'
            ]);
    }

    /**
     * test_create_post_with_empty_title
     *
     * @return mixed
     */
    public function test_create_post_with_empty_title()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/posts/store', [
            'user_id' => $user->id,
            'title' => '',
            'description' => 'Any description'
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(422)
            ->assertJsonStructure([
                'message'
            ]);
    }

    /**
     * test_create_post_with_empty_description
     *
     * @return mixed
     */
    public function test_create_post_with_empty_description()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/posts/store', [
            'user_id' => $user->id,
            'title' => 'Any title',
            'description' => ''
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(422)
            ->assertJsonStructure([
                'message'
            ]);
    }

    public function test_show_post_by_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->get('/api/posts/1', [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'status', 'post'
            ]);
    }

    public function test_show_all_post()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->get('/api/posts', [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200);
    }

    public function test_update_post_by_correct_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/posts/1/update', [
            'title' => 'Any title',
            'description' => 'Any description'
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200);
    }

    public function test_update_post_by_correct_with_empty_title_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);
        $post = \App\Models\Posts::pluck('id')->random();

        $response = $this->post('/api/posts/' . $post . '/update', [
            'title' => '',
            'description' => 'Any description'
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(422)
            ->assertJsonStructure([
                'message'
            ]);
    }

    public function test_update_post_by_correct_with_empty_description_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/posts/1/update', [
            'title' => 'Any title',
            'description' => ''
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(422)
            ->assertJsonStructure([
                'message'
            ]);
    }

    public function test_update_post_by_incorrect_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/posts/aa/update', [
            'title' => 'Any title',
            'description' => 'Any description'
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(404);
    }

    public function test_update_post_empty_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/posts//update', [
            'title' => 'Any title',
            'description' => 'Any description'
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(404);
    }

    public function test_destroy_post_by_correct_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);
        $random_post_id = \App\Models\Posts::pluck('id')->random();

        $response = $this->post('/api/posts/' . $random_post_id . '/destroy', [], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200);
    }

    public function test_destroy_post_by_incorrect_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/posts/aa/destroy', [], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(404);
    }
}
