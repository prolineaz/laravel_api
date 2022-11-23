<?php

namespace App\Services;

use App\Http\Requests\Posts\CreatePostRequest;
use App\Http\Resources\PostsResource;
use App\Models\Comments;
use App\Models\Posts;
use Illuminate\Support\Facades\Auth;
use DB;

class PostsService
{
    /**
     * Get all posts
     *
     * @return mixed
     */
    public function getAllPosts()
    {
        $posts = Posts::with(['user', 'comments', 'comments.user'])->get();
        return PostsResource::collection($posts);

        /** Example of native SQL */
        // $posts = Posts::select(
        //     'posts.id',
        //     DB::raw("json_build_object(
        //         'id', users.id,
        //         'name', users.name,
        //         'email', users.email
        //     ) AS user"),
        //     'posts.title',
        //     'posts.description',
        //     'posts.created_at',
        //     DB::raw("(SELECT json_agg(json_build_object(
        //         'id', c.id, 
        //         'user', json_build_object(
        //             'id', users.id,
        //             'name', users.name,
        //             'email', users.email
        //         ),
        //         'comment', c.comment, 
        //         'created_at', c.created_at
        //         )) FROM comments c 
        //                 LEFT JOIN users ON c.user_id = users.id 
        //                 WHERE c.post_id = posts.id) AS comments")
        // )
        //     ->join('users', 'users.id', '=', 'posts.user_id')
        //     ->get()->toArray();

        // return array_map(function ($post) {
        //     $post['user'] = json_decode($post['user'], true);
        //     $post['comments'] = json_decode($post['comments'], true);
        //     return $post;
        // }, $posts);
    }

    /**
     * Create post
     *
     * @param  mixed $request
     * @return void
     */
    public function createPost(CreatePostRequest $request)
    {
        Posts::create([
            'user_id' => Auth::user()->id,
            'title' => $request->title,
            'description' => $request->description,
        ]);
    }

    /**
     * Get post by Id
     *
     * @param  mixed $id
     * @return mixed
     */
    public function getPostById($id)
    {
        $post = Posts::with(['user', 'comments', 'comments.user'])->find($id);
        return new PostsResource($post);

        /** Example of native SQL */
        // $post = Posts::select(
        //     'posts.id',
        //     DB::raw("json_build_object(
        //         'id', users.id,
        //         'name', users.name,
        //         'email', users.email
        //     ) AS user"),
        //     'posts.title',
        //     'posts.description',
        //     'posts.created_at'
        // )
        //     ->join('users', 'users.id', '=', 'posts.user_id')
        //     ->find($id);

        // if (!empty($post)) {
        //     $post = $post->toArray();
        //     $post['user'] = json_decode($post['user'], true);
        // }
        // return $post;
    }

    /**
     * Update post by Id
     *
     * @param  mixed $request
     * @param  mixed $id
     * @return void
     */
    public function updatePostById(CreatePostRequest $request, $id)
    {
        return Posts::where('user_id', Auth::user()->id)
            ->where('id', $id)
            ->update([
                'title' => $request->title,
                'description' => $request->description
            ]);
    }

    /**
     * Destroy post by Id
     *
     * @param  mixed $id
     * @return void
     */
    public function destroyPostById($id)
    {
        return Posts::where('user_id', Auth::user()->id)
            ->where('id', $id)
            ->delete();
    }
}
