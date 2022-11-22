<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

/** 
 * @OA\Info(
 *      version="1.0.0",
 *      title="SoftLight_T3 OpenApi Documentation",
 *      description="SoftLight_T3 OpenApi for frontend developers",
 *      @OA\Contact(
 *          email="demo@demo.demo"
 *      ),
 *      @OA\License(
 *          name="Apache 2.0",
 *          url="http://www.apache.org/licenses/LICENSE-2.0.html"
 *      )
 * )
 * 
 * @OA\Server(
 *      url=L5_SWAGGER_CONST_HOST,
 *      description="SoftLight_T3 API Server"
 * )
 * 
 * @OA\Parameter(
 *    in="path",
 *    name="id",
 *    schema={
 *         "type"={"string"}
 *    },
 *    required=true
 * ),
 * 
 * @OA\SecurityScheme(
 *     type="http",
 *     description="Login with email and password to get the authentication token",
 *     name="Token based Based",
 *     in="header",
 *     scheme="bearer",
 *     bearerFormat="JWT",
 *     securityScheme="apiAuth",
 * )
 */

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}
