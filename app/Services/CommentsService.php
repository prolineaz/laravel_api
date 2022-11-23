<?php

namespace App\Services;

use App\Http\Requests\Comments\CreateCommentRequest;
use App\Http\Requests\Comments\UpdateCommentRequest;
use App\Http\Resources\CommentsResource;
use App\Models\Comments;
use Illuminate\Support\Facades\Auth;
use DB;

class CommentsService
{
    /**
     * Get all comments
     *
     * @return mixed
     */
    public function getAllComments()
    {
        $comments = Comments::with(['user'])->get();
        return CommentsResource::collection($comments);

        /** Example of native SQL */
        // $comments = Comments::select(
        //     'comments.id',
        //     DB::raw("json_build_object(
        //         'id', users.id,
        //         'name', users.name,
        //         'email', users.email
        //     ) AS user"),
        //     'comments.comment',
        //     'comments.created_at',
        // )
        //     ->join('users', 'users.id', '=', 'comments.user_id')
        //     ->get()->toArray();

        // return array_map(function ($comment) {
        //     $comment['user'] = json_decode($comment['user'], true);
        //     return $comment;
        // }, $comments);
    }

    /**
     * Create Comment
     *
     * @param  mixed $request
     * @return void
     */
    public function createComment(CreateCommentRequest $request)
    {
        Comments::create([
            'user_id' => Auth::user()->id,
            'post_id' => $request->post_id,
            'comment' => $request->comment,
        ]);
    }

    /**
     * Get comment by Id
     *
     * @param  mixed $id
     * @return mixed
     */
    public function getCommentById($id)
    {
        $comment = Comments::with(['user'])->find($id);
        return new CommentsResource($comment);

        /** Example of native SQL */
        // $comment = Comments::select(
        //     'comments.id',
        //     DB::raw("json_build_object(
        //         'id', users.id,
        //         'name', users.name,
        //         'email', users.email
        //     ) AS user"),
        //     'comments.comment',
        //     'comments.created_at',
        // )
        //     ->join('users', 'users.id', '=', 'comments.user_id')
        //     ->find($id);

        // if (!empty($comment)) {
        //     $comment = $comment->toArray();
        //     $comment['user'] = json_decode($comment['user'], true);
        // }
        // return $comment;
    }

    /**
     * Update comment by Id
     *
     * @param  mixed $request
     * @param  mixed $id
     * @return void
     */
    public function updateCommentById(UpdateCommentRequest $request, $id)
    {
        return Comments::where('user_id', Auth::user()->id)
            ->where('id', $id)
            ->update([
                'comment' => $request->comment
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
        return Comments::where('user_id', Auth::user()->id)
            ->where('id', $id)
            ->delete();
    }
}
