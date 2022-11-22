<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\UsersController;
use App\Http\Controllers\API\PostsController;
use App\Http\Controllers\API\CommentsController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['middleware' => 'api', 'prefix' => 'auth'], function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('register', [AuthController::class, 'register']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
});

Route::group(['middleware' => 'api'], function () {
    Route::get('users', [UsersController::class, 'users']);

    Route::get('posts', [PostsController::class, 'index']);
    Route::get('posts/{id}', [PostsController::class, 'show'])->where(['id' => '[0-9]+']);
    Route::post('posts/store', [PostsController::class, 'store']);
    Route::post('posts/{id}/update', [PostsController::class, 'update'])->where(['id' => '[0-9]+']);
    Route::post('posts/{id}/destroy', [PostsController::class, 'destroy'])->where(['id' => '[0-9]+']);

    Route::get('comment', [CommentsController::class, 'index']);
    Route::get('comment/{id}', [CommentsController::class, 'show'])->where(['id' => '[0-9]+']);
    Route::post('comment/store', [CommentsController::class, 'store']);
    Route::post('comment/{id}/update', [CommentsController::class, 'update'])->where(['id' => '[0-9]+']);
    Route::post('comment/{id}/destroy', [CommentsController::class, 'destroy'])->where(['id' => '[0-9]+']);
});
