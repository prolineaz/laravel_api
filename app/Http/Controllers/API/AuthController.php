<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Services\AuthService;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegisterRequest;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    /**
     * @OA\Post(
     * path="/api/auth/login",
     * summary="Login",
     * description="Login by email, password",
     * operationId="authLogin",
     * tags={"Auth"},
     * @OA\RequestBody(
     *    required=true,
     *    description="Enter user credentials",
     *    @OA\JsonContent(
     *       required={"email","password"},
     *       @OA\Property(property="email", type="string", format="email", example="demouser@gmail.com"),
     *       @OA\Property(property="password", type="string", format="password", example="123456789"),
     *    ),
     * ),
     * @OA\Response(
     *    response=422,
     *    description="Wrong credentials response",
     *    @OA\JsonContent()
     *     )
     * )
     */
    public function login(LoginRequest $request, AuthService $service)
    {
        $credentials = $request->only('email', 'password');

        $sRes = $service->login($credentials);

        return response()->json($sRes['responseBody'], $sRes['responseCode']);
    }

    /**
     * @OA\Post(
     * path="/api/auth/register",
     * summary="Register",
     * description="Register by name, email, password",
     * operationId="authRegister",
     * tags={"Auth"},
     * @OA\RequestBody(
     *    required=true,
     *    description="Enter user credentials",
     *    @OA\JsonContent(
     *       required={"name", "email","password"},
     *       @OA\Property(property="name", type="string", example="Myname"),
     *       @OA\Property(property="email", type="string", format="email", example="demouser@gmail.com"),
     *       @OA\Property(property="password", type="string", format="password", example="123456789"),
     *    ),
     * ),
     * @OA\Response(
     *    response=422,
     *    description="Wrong credentials response",
     *    @OA\JsonContent()
     *     )
     * )
     */
    public function register(RegisterRequest $request, AuthService $service)
    {

        $sRes = $service->register($request);

        return response()->json($sRes['responseBody'], $sRes['responseCode']);
    }

    /**
     * @OA\Post(
     *   tags={"Auth"},
     *   path="/api/auth/logout",
     *   summary="Logout",
     *     @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             @OA\Property(property="status", type="string", example="success"),
     *             @OA\Property(property="message", type="string", example="Successfully logged out"),
     *         ),
     *     ),
     *     @OA\Response(
     *    response=422,
     *    description="Unauthorized",
     *    @OA\JsonContent()
     *     ),
     *     security={{ "apiAuth": {} }}
     * ),
     */
    public function logout(AuthService $service)
    {
        $service->logout();

        return response()->json([
            'status' => 'success',
            'message' => 'Successfully logged out',
        ]);
    }

    /**
     * @OA\Post(
     *   tags={"Auth"},
     *   path="/api/auth/refresh",
     *   summary="Refresh token",
     *     @OA\Response(
     *       response=200, 
     *       description="OK", 
     *       @OA\JsonContent()),
     *     @OA\Response(
     *       response=422, 
     *       description="Unauthorized", 
     *       @OA\JsonContent()),
     *     security={{ "apiAuth": {} }}
     * ),
     * )
     */
    public function refresh()
    {
        return response()->json([
            'status' => 'success',
            'user' => Auth::user(),
            'authorisation' => [
                'token' => Auth::refresh(),
                'type' => 'bearer',
            ]
        ]);
    }
}
