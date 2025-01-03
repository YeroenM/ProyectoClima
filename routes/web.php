<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MapaController;
use App\Http\Controllers\LugarController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProvinciaController;

Route::get('/', function () {
    return view('home');
});

Auth::routes();

//Route::get('/mapa/{fecha}', [MapaController::class, 'index']);
Route::get('/mapa/{fecha?}', [MapaController::class, 'index'])->name('mapa.index');
Route::get('/perfil', [UserController::class, 'show'])->name('perfil')->middleware('auth');

Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/lugares', [LugarController::class, 'index'])->name('lugares.index');
    Route::post('/lugares/{id}/update-estado', [LugarController::class, 'updateEstado'])->name('lugares.updateEstado');
});

// Rutas para cada provincia
//Route::get('/region/{provincia}', [ProvinciaController::class, 'mostrar'])->name('provincia.mostrar');
Route::get('/region/{provincia}/{fecha?}', [ProvinciaController::class, 'mostrar'])->name('provincia.mostrar');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
