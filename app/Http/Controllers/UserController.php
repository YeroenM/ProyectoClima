<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function show()
    {
        // Obtén los datos del usuario autenticado
        $user = Auth::user();
        return view('perfil', compact('user'));
    }
}
