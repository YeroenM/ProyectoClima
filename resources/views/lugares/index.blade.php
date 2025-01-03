@extends('layouts.app')

@section('content')
<div class="container mt-5">
    <h1 class="text-center mb-4">Administración de Lugares</h1>

    <!-- Mostrar mensaje de éxito -->
    @if (session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Ubicación</th>
                <th>Estado</th>
                <th> </th>
            </tr>
        </thead>
        <tbody>
            @foreach ($lugares as $lugar)
            <tr>
                <td>{{ $lugar->idLugares }}</td>
                <td>{{ $lugar->ubicacion }}</td>
                <td>
                    <!-- Mostrar estado como texto -->
                    {{ $lugar->estado ? 'Activo' : 'Desactivado' }}
                </td>
                <td>
                    <!-- Formulario para actualizar el estado con el botón -->
                    <form action="{{ route('lugares.updateEstado', $lugar->idLugares) }}" method="POST">
                        @csrf
                        <input type="hidden" name="estado" value="{{ $lugar->estado ? 0 : 1 }}">
                        <button type="submit" class="btn btn-sm btn-primary">
                            {{ $lugar->estado ? 'Desactivar' : 'Activar' }}
                        </button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection