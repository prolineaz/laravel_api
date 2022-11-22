<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Services\UsersService;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * @OA\Get(
     *   tags={"Users"},
     *   path="/api/users",
     *   summary="Return all users with posts and all comments which the current user left under any post",
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
    public function users(UsersService $service)
    {
        return ['status' => 'success', 'users' => $service->getAllUsersPosts()];
    }
}
