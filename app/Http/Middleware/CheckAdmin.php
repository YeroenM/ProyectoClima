<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class CheckAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Verifica si el usuario está autenticado y tiene el rol 'admin'
        if (Auth::check() && Auth::user()->rol === 'admin') {
            return $next($request);
        }

        // Si no es admin, retorna un error 403
        abort(403, 'Acceso denegado: Solo administradores pueden acceder.');
    }
}
