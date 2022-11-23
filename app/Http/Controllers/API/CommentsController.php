<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Comments\CreateCommentRequest;
use App\Http\Requests\Comments\UpdateCommentRequest;
use App\Services\CommentsService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * @OA\Get(
     *   tags={"Comments"},
     *   path="/api/comment",
     *   summary="Return all comments",
     *   @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent()
     *       ),
     *   @OA\Response(
     *          response=401,
     *          description="Unauthorized",
     *          @OA\JsonContent()
     *      ),
     *      security={{ "apiAuth": {} }}
     * )
     */
    public function index(CommentsService $service)
    {
        return ['status' => 'success', 'comments' => $service->getAllComments()];
    }
    /**
     * @OA\Post(
     *   tags={"Comments"},
     *   path="/api/comment/store",
     *   summary="Add new comment",
     *      @OA\Parameter(
     *         description="Post ID",
     *         in="query",
     *         name="post_id",
     *         required=true,
     *         @OA\Schema(type="integer"),
     *     ),
     *     @OA\Parameter(
     *         description="Comment",
     *         in="query",
     *         name="comment",
     *         required=true,
     *         @OA\Schema(type="string"),
     *     ),

     *   @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent()
     *       ),
     *   @OA\Response(
     *          response=401,
     *          description="Unauthorized",
     *          @OA\JsonContent()
     *      ),
     *      security={{ "apiAuth": {} }}
     * )
     */
    public function store(CreateCommentRequest $request, CommentsService $service)
    {
        $service->createComment($request);

        return ['status' => 'success', 'message' => 'Comment created'];
    }

    /**
     * @OA\Get(
     *   tags={"Comments"},
     *   path="/api/comment/{id}",
     *   summary="Show comment by id",
     * @OA\Parameter(
     *        name="id", in="path",required=true, @OA\Schema(type="integer")
     *     ),
     *   @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent()
     *       ),
     *   @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *          @OA\JsonContent()
     *      ),
     *   @OA\Response(
     *          response=404,
     *          description="Post not found",
     *          @OA\JsonContent()
     *   ),
     *      security={{ "apiAuth": {} }}
     * )
     */
    public function show(CommentsService $service, $id)
    {
        if ($post = $service->getCommentById($id)) {
            return ['status' => 'success', 'comment' => $post];
        } else {
            return response()->json(['status' => 'error', 'message' => 'Comment not found'], 404);
        }
    }

    /**
     * @OA\Post(
     *   tags={"Comments"},
     *   path="/api/comment/{id}/update",
     *   summary="Update comment by id",
     * @OA\Parameter(
     *        name="id", in="path",required=true, @OA\Schema(type="integer")
     *     ),
     *      @OA\Parameter(
     *         description="Comment",
     *         in="query",
     *         name="comment",
     *         required=true,
     *         @OA\Schema(type="string"),
     *     ),
     *    
     *   @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent()
     *       ),
     *   @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *          @OA\JsonContent()
     *      ),
     *   @OA\Response(
     *          response=404,
     *          description="Post not found",
     *          @OA\JsonContent()
     *   ),
     *      security={{ "apiAuth": {} }}
     * )
     */
    public function update(UpdateCommentRequest $request, CommentsService $service, $id)
    {
        if ($service->updateCommentById($request, $id)) {
            return ['status' => 'success', 'message' => 'Comment updated'];
        } else {
            return ['status' => 'error', 'message' => 'Restricted'];
        }
    }

    /**
     * @OA\Post(
     *   tags={"Comments"},
     *   path="/api/comment/{id}/destroy",
     *   summary="Delete comment by id",
     * @OA\Parameter(
     *        name="id", in="path",required=true, @OA\Schema(type="integer")
     *     ),
     *   @OA\Response(
     *          response=200,
     *          description="Successful operation",
     *          @OA\JsonContent()
     *       ),
     *   @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *          @OA\JsonContent()
     *      ),
     *   @OA\Response(
     *          response=404,
     *          description="Post not found",
     *          @OA\JsonContent()
     *   ),
     *      security={{ "apiAuth": {} }}
     * )
     */
    public function destroy(CommentsService $service, $id)
    {
        if ($service->destroyPostById($id)) {
            return ['status' => 'success', 'message' => 'Comment deleted'];
        } else {
            return ['status' => 'error', 'message' => 'Restricted'];
        }
    }
}
