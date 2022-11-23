<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class CommentsTest extends TestCase
{
    /**
     * test_create_comment
     *
     * @return void
     */
    public function test_create_comment()
    {
        $user = \App\Models\User::first();
        $post = \App\Models\Posts::pluck('id')->random();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/comment/store', [
            'user_id' => $user->id,
            'post_id' => $post,
            'comment' => 'Any comment',
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
     * test_create_comment_with_emmpty_comment
     *
     * @return void
     */
    public function test_create_comment_with_emmpty_comment()
    {
        $user = \App\Models\User::first();
        $post = \App\Models\Posts::pluck('id')->random();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/comment/store', [
            'user_id' => $user->id,
            'post_id' => $post,
            'comment' => '',
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
     * test_show_comment_by_id
     *
     * @return void
     */
    public function test_show_comment_by_id()
    {
        $user = \App\Models\User::first();
        $comment = \App\Models\Comments::pluck('id')->random();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->get('/api/comment/' . $comment, [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'status', 'comment'
            ]);
    }

    /**
     * test_show_all_comments
     *
     * @return void
     */
    public function test_show_all_comments()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->get('/api/comment', [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200);
    }
    
    /**
     * test_update_comment_by_correct_id
     *
     * @return void
     */
    public function test_update_comment_by_correct_id()
    {
        $comment = \App\Models\Comments::pluck('id')->random();
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/comment/' . $comment . '/update', [
            'comment' => 'Any comment'
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200);
    }
    
    /**
     * test_update_comment_by_correct_id_with_empty_title
     *
     * @return void
     */
    public function test_update_comment_by_correct_id_with_empty_title()
    {
        $comment = \App\Models\Comments::pluck('id')->random();
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/comment/'.$comment.'/update', [
            'comment' => '',
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
     * test_update_comment_by_incorrect_id
     *
     * @return void
     */
    public function test_update_comment_by_incorrect_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/comment/aa/update', [
            'comment' => 'Any title',
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(404);
    }

    public function test_update_comment_empty_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/posts//update', [
            'comment' => 'Any comment',
        ], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(404);
    }
    
    /**
     * test_destroy_comment_by_correct_id
     *
     * @return void
     */
    public function test_destroy_comment_by_correct_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);
        $random_comment_id = \App\Models\Comments::pluck('id')->random();

        $response = $this->post('/api/comment/' . $random_comment_id . '/destroy', [], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(200);
    }

    public function test_destroy_comment_by_incorrect_id()
    {
        $user = \App\Models\User::first();
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);

        $response = $this->post('/api/comment/aa/destroy', [], [
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token,
        ]);

        $response->assertStatus(404);
    }
}
