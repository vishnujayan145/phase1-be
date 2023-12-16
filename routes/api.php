<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\TaskController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/register', [RegisterController::class, 'create']);
 Route::post('/login', [RegisterController::class, 'login'])->middleware('jwt.auth');
 Route::post('/logut', [RegisterController::class, 'Authlogout'])->middleware('jwt.auth');
//  Route::post('/tasks', [TaskController::class, 'create']);
// routes/api.php

Route::middleware('auth:api')->group(function () {
    Route::get('/tasks', [TaskController::class, 'getAllTasks']);
    Route::post('/tasks', [TaskController::class, 'create']);
    Route::put('/tasks/{id}', [TaskController::class, 'UpdateTask']);
    Route::delete('/tasks/{id}', [TaskController::class, 'distroy']);

});