<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Posts\CreatePostRequest;
use App\Models\Posts;
use App\Services\PostsService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * @OA\Get(
     *   tags={"Posts"},
     *   path="/api/posts",
     *   summary="Return all posts belong to current user and all comments of each user",
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
    public function index(PostsService $service)
    {
        return ['status' => 'success', 'posts' => $service->getAllPosts()];
    }
    /**
     * @OA\Post(
     *   tags={"Posts"},
     *   path="/api/posts/store",
     *   summary="Add new post",
     *      @OA\Parameter(
     *         description="Post title",
     *         in="query",
     *         name="title",
     *         required=true,
     *         @OA\Schema(type="string"),
     *     ),
     *     @OA\Parameter(
     *         description="Post description",
     *         in="query",
     *         name="description",
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
    public function store(CreatePostRequest $request, PostsService $service)
    {
        $service->createPost($request);

        return ['status' => 'success', 'message' => 'Post created'];
    }

    /**
     * @OA\Get(
     *   tags={"Posts"},
     *   path="/api/posts/{id}",
     *   summary="Show post by id",
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
    public function show(PostsService $service, $id)
    {
        if ($post = $service->getPostById($id)) {
            return ['status' => 'success', 'post' => $post];
        } else {
            return response()->json(['status' => 'error', 'message' => 'Post not found'], 404);
        }
    }

    /**
     * @OA\Post(
     *   tags={"Posts"},
     *   path="/api/posts/{id}/update",
     *   summary="Update post by id",
     * @OA\Parameter(
     *        name="id", in="path",required=true, @OA\Schema(type="integer")
     *     ),
     *      @OA\Parameter(
     *         description="Post title",
     *         in="query",
     *         name="title",
     *         required=true,
     *         @OA\Schema(type="string"),
     *     ),
     *     @OA\Parameter(
     *         description="Post description",
     *         in="query",
     *         name="description",
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
    public function update(CreatePostRequest $request, PostsService $service, $id)
    {
        if ($service->updatePostById($request, $id)) {
            return ['status' => 'success', 'message' => 'Post updated'];
        } else {
            return ['status' => 'error', 'message' => 'Restricted'];
        }
    }

    /**
     * @OA\Post(
     *   tags={"Posts"},
     *   path="/api/posts/{id}/destroy",
     *   summary="Delete post by id",
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
    public function destroy(PostsService $service, $id)
    {
        if ($service->destroyPostById($id)) {
            return ['status' => 'success', 'message' => 'Post deleted'];
        } else {
            return ['status' => 'error', 'message' => 'Restricted'];
        }
    }
}
