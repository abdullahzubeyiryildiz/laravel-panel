<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Auth extends Controller
{
    public function index()
    {
        return view('auth.login');
    }
    
    public function logout(Request $request) {
        Auth::logout();
        return redirect('/login');
      }
}
