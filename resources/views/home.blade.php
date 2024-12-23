@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header text-center" style="background-color: #007bff; color: white;text-shadow: 2px 2px 4px rgba(0,0,0,0.7);">
                    <h2 style="margin: 0; font-weight: bold;">Bienvenido al clima de Arequipa</h2>
                </div>
                <div class="card-body text-center" style="position: relative;">
                    <!-- GIF -->
                    <img src="{{ asset('images/animation2.gif') }}" alt="GIF Animado" style="width: 100%; height: auto; border-radius: 10px;">
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
