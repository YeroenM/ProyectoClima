<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class MapaController extends Controller
{
    public function index($fecha = null)
    {
        // Si no se proporciona una fecha, se toma la fecha actual
        $fechaSeleccionada = $fecha ? Carbon::createFromFormat('d-m-Y', $fecha)->format('Y-m-d') : now()->format('Y-m-d');
        
        // Convertir la fecha seleccionada
        //$fechaBase = Carbon::createFromFormat('d-m-Y', $fecha);

        // Obtener las fechas para el selector (última semana) a partir de la fecha seleccionada
        $fechas = [];
        for ($i = 6; $i >= 0; $i--) {
            //$fechas[] = $fechaBase->copy()->subDays($i)->format('d M');
            $fechas[] = now()->copy()->subDays($i)->format('d M');
        }
        
        // Obtener las regiones activas y sus datos para la fecha seleccionada
        $regiones = DB::table('registros')
            ->join('lugares', 'registros.idLugares', '=', 'lugares.idLugares')
            ->whereDate('registros.fecha_hora', $fechaSeleccionada)
            ->where('lugares.estado', 1)
            ->select('registros.idLugares', 'registros.temperatura', 'registros.humedad', 'registros.fecha_hora', 'lugares.ubicacion')
            ->orderBy('registros.fecha_hora', 'desc')
            ->get()
            ->unique('idLugares');
    
        // Definir los valores fijos de 'top' y 'left' para cada lugar
        $regionesArr = $regiones->map(function ($region) use ($fechaSeleccionada) {
            $ubicacion = $region->ubicacion;
            $top = 0;
            $left = 0;
    
            switch ($ubicacion) {
                case 'camana':
                    $top = '70%';
                    $left = '50%';
                    break;
                case 'arequipa':
                    $top = '55%';
                    $left = '78%';
                    break;
                case 'condesuyos':
                    $top = '35%';
                    $left = '44.5%';
                    break;
                case 'caraveli':
                    $top = '37%';
                    $left = '26%';
                    break;
                case 'castilla':
                    $top = '19%';
                    $left = '63.8%';
                    break;
                case 'caylloma':
                    $top = '25%';
                    $left = '78%';
                    break;
                case 'islay':
                    $top = '81%';
                    $left = '76%';
                    break;
                case 'union':
                    $top = '5%';
                    $left = '50%';
                    break;
                default:
                    $top = '0%';
                    $left = '0%';
                    break;
            }
    
            return [
                'top' => $top,
                'left' => $left,
                'label' => ucfirst($region->ubicacion),
                'route' => '/region/' . strtolower(str_replace(' ', '', $region->ubicacion)) . '/' . $fechaSeleccionada,
                'temp' => $region->temperatura,
                'hum' => $region->humedad,
            ];
        });
    
        // Pasar las regiones a la vista
        return view('mapa', compact('regionesArr', 'fechas', 'fechaSeleccionada'));
    }
}