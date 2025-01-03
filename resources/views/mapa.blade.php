@extends('layouts.app')

@section('styles')
    <style>
        .map-container {
            position: relative;
            width: 100%;
            max-width: 800px;
            margin: auto;
            border: 1px solid #ddd;
        }

        .map-container img {
            width: 100%;
            height: auto;
        }

        .overlay {
            position: absolute;
            background-color: rgba(255, 255, 255, 0.9);
            border: 1px solid #333;
            border-radius: 5px;
            padding: 10px;
            font-size: 12px;
            text-align: center;
            color: #333;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .overlay:hover {
            transform: scale(1.1);
            background-color: rgba(255, 255, 255, 1);
            border-color: #007bff;
            color: #007bff;
        }

        .dias-semana {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            gap: 10px;
        }

        .dias-semana button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #f8f9fa;
            cursor: pointer;
        }

        .dias-semana button.active {
            background-color: #dc3545;
            color: white;
        }
    </style>
@endsection

@section('content')
<div class="container mt-4">
    <h1 class="text-center mb-4">Pronóstico del Clima en Arequipa</h1>

    <!-- Días de la semana -->
    <div class="dias-semana">
        @foreach ($fechas as $index => $fecha)
            <a href="{{ url('/mapa/' . \Carbon\Carbon::createFromFormat('d M', $fecha)->format('d-m-Y')) }}">
                <button class="{{ \Carbon\Carbon::parse($fechaSeleccionada)->format('d-m-Y') === \Carbon\Carbon::createFromFormat('d M', $fecha)->format('d-m-Y') ? 'active' : '' }}">
                    {{ $fecha }}
                </button>
            </a>
        @endforeach
    </div>

    <!-- Mapa con datos -->
    <div class="map-container">
        <img src="{{ asset('images/mapa-arequipa.jpg') }}" alt="Mapa de Arequipa">
        
        <!-- Cuadrados superpuestos -->
        @foreach ($regionesArr as $region)
            <a href="{{ $region['route'] }}" class="overlay" style="top: {{ $region['top'] }}; left: {{ $region['left'] }};">
                <strong>{{ $region['label'] }}</strong><br>
                T: {{ $region['temp'] }}°C<br>
                H: {{ $region['hum'] }}%
            </a>
        @endforeach
    </div>

    <!-- Botón de administrar lugares solo para admin -->
    @if (auth()->check() && auth()->user()->rol == 'admin')
        <div class="container mt-4 text-center">
            <a href="{{ url('/lugares') }}" class="btn btn-primary btn-lg">Administrar Lugares</a>
            <br><br>
        </div>
    @endif
</div>
@endsection