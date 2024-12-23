<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Lugar;

class LugarController extends Controller
{
    // Mostrar los datos de la tabla lugares
    public function index()
    {
        // Obtener todos los registros de la tabla lugares
        $lugares = Lugar::all();

        // Retornar la vista con los datos
        return view('lugares.index', compact('lugares'));
    }

    // Método para actualizar el estado
    public function updateEstado(Request $request, $id)
    {
        $lugar = Lugar::findOrFail($id);

        // Actualizar el estado (0 o 1)
        $lugar->estado = $request->estado;
        $lugar->save();

        return redirect()->route('lugares.index')->with('success', 'Estado actualizado correctamente.');
    }
}
