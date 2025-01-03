<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ProvinciaController extends Controller
{
    public function mostrar(Request $request, $provincia, $fecha)
    {
        // Convertir la fecha en el formato correcto
        $fechaSeleccionada = Carbon::createFromFormat('Y-m-d', $fecha)->format('Y-m-d');
     
        // Obtener los datos de temperatura y humedad
        $datos = DB::table('registros')
            ->join('lugares', 'registros.idLugares', '=', 'lugares.idLugares')
            ->where('lugares.ubicacion', '=', $provincia)
            ->whereDate('registros.fecha_hora', $fechaSeleccionada)
            ->select('registros.temperatura', 'registros.humedad', 'registros.fecha_hora')
            ->orderBy('registros.fecha_hora', 'desc')
            ->get();
     
        // Obtener la última temperatura
        $ultimaTemperatura = $datos->first();
        
        return view('provincias.mostrar', compact('datos', 'provincia', 'fechaSeleccionada', 'ultimaTemperatura'));
    }
}
