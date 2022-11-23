<?php

namespace App\Services;

use App\Http\Resources\UsersResource;
use App\Models\User;
use DB;

class UsersService
{
    /**
     * Get all users posts
     *
     * @return mixed
     */
    public function getAllUsersPosts()
    {
        $users = User::with(['posts', 'posts.user', 'posts.comments', 'posts.comments.user'])->get();
        return UsersResource::collection($users);

        /** Example of native SQL */
        // $posts = User::select(
        //     'users.id',
        //     'users.name',
        //     'users.email',
        //     'users.created_at',
        //     DB::raw("(SELECT json_agg(json_build_object(
        //         'id', p.id,     
        //         'title', p.title, 
        //         'description', p.description, 
        //         'created_at', p.created_at, 
        //         'comments', (SELECT json_agg(json_build_object(
        //             'id', c.id, 
        //             'comment', c.comment, 
        //             'created_at', c.created_at
        //             )) FROM comments c 
        //                         WHERE c.user_id = users.id AND c.post_id = p.id)
        //         )) FROM posts AS p WHERE p.user_id = users.id) AS posts")
        // )
        //     ->get()->toArray();


        // return array_map(function ($post) {
        //     $post['posts'] = json_decode($post['posts'], true);
        //     return $post;
        // }, $posts);
    }
}
