<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TaskModal;
use Illuminate\Support\Carbon;
use Tymon\JWTAuth\Facades\JWTAuth;

class TaskController extends Controller
{
    public function Create(Request $request)
    {

        $user = JWTAuth::parseToken()->authenticate();
        $userId = $user->id;

        TaskModal::create([
            'user_id' => $userId,
            'name' => $request->name,
            'description' => $request->description,
        ]);

        return response()->json([
            'message' => 'task submitted successfully',
            'user_id' => $user->id
        ]);
    }
    public function getAllTasks()
    {
        // Retrieve the authenticated user
        $user = auth()->user();

        // Retrieve all tasks associated with the logged-in user
        $tasks = TaskModal::where('user_id', $user->id)->get();

        return response()->json(['tasks' => $tasks]);
    }

    public function UpdateTask(Request $request, $id)
    {
        $task_id = $id;

        $user = JWTAuth::parseToken()->authenticate();
        $userId = $user->id;

        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
        ]);

        TaskModal::findOrFail($task_id)->update([
            'name' => $request->name,
            'description' => $request->description,
            'updated_at' => Carbon::now(),
        ]);

        return response()->json([
            'message' => 'task updated successfully',
            'user_id' => $user->id
        ]);
    }
    public function distroy($id)
    {

        $task = TaskModal::findOrFail($id);
        $task->delete();

        return response()->json(['message' => 'Task deleted successfully']);
    }
}
