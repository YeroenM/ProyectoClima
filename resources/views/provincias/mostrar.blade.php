@extends('layouts.app')

@section('content')
<div class="container">
<h1 class="text-center mb-4">Datos de {{ ucfirst($provincia) }} - {{ \Carbon\Carbon::parse($fechaSeleccionada)->format('d/m/Y') }}</h1>

    <!-- Cuadro de temperatura -->
    @if($ultimaTemperatura)
        <div class="temp-box" style="animation: pulse 2s infinite;">
            <h2>Última Temperatura: {{ $ultimaTemperatura->temperatura }} °C</h2>
            <p>Hora: {{ \Carbon\Carbon::parse($ultimaTemperatura->fecha_hora)->format('H:i') }}</p>
            <div class="weather-icon">
                @if($ultimaTemperatura->temperatura > 25)
                    <img src="{{ asset('images/sunny.gif') }}" alt="GIF soleado" style="width: 10%; height: auto; border-radius: 10px;">
                    <p><strong>Caluroso:</strong> Sensación intensa de calor, especialmente en verano.</p>
                @elseif($ultimaTemperatura->temperatura >= 15)
                    <img src="{{ asset('images/tempered.png') }}" alt="imagen templado" style="width: 15%; height: auto; border-radius: 10px;">
                    <p><strong>Templado:</strong> Clima moderado, agradable durante el día, fresco por la noche.</p>
                @elseif($ultimaTemperatura->temperatura >= 10)
                    <img src="{{ asset('images/cold.gif') }}" alt="imagen frio" style="width: 15%; height: auto; border-radius: 10px;">
                    <p><strong>Fresco:</strong> Sensación ligeramente fría, con vientos o neblina ocasional.</p>
                @elseif($ultimaTemperatura->temperatura >= 0)
                    <img src="{{ asset('images/nevar.gif') }}" alt="imagen mucho frio" style="width: 15%; height: auto; border-radius: 10px;">
                    <p><strong>Frío:</strong> Sensación notablemente fría, puede haber heladas o escarcha.</p>
                @else
                    <img src="{{ asset('images/nevar.gif') }}" alt="Gélido o helado" />
                    <p><strong>Gélido o helado:</strong> Frío extremo, riesgo de congelación o nieve.</p>
                @endif
            </div>
        </div>
    @endif

    <!-- Botones para alternar vistas -->
    <div class="text-center mb-4">
        <button class="btn btn-primary mx-2" onclick="mostrarTabla()">Ver en Tabla</button>
        <button class="btn btn-success mx-2" onclick="mostrarGrafico()">Ver en Gráfica</button>
    </div>

    <!-- Contenedor de la tabla -->
    <div id="tabla" class="mb-4">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Fecha y Hora</th>
                    <th>Temperatura (°C)</th>
                    <th>Humedad (%)</th>
                </tr>
            </thead>
            <tbody>
                @foreach($datos as $dato)
                <tr>
                    <td>{{ $dato->fecha_hora }}</td>
                    <td>{{ $dato->temperatura }}</td>
                    <td>{{ $dato->humedad }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <!-- Contenedor del gráfico -->
    <div id="grafico" style="display:none;">
        <canvas id="chart" height="100"></canvas>
    </div>
</div>

<!-- Estilos para el cuadro de temperatura -->
<style>
.temp-box {
    border: 1px solid #007bff;
    background-color: rgba(0, 123, 255, 0.1);
    padding: 20px;
    border-radius: 5px;
    text-align: center;
    margin-bottom: 20px;
}

.weather-icon img {
    width: 100px;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}
</style>

<!-- Librerías -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment"></script>

<script>
const datos = @json($datos);

// Mostrar tabla
function mostrarTabla() {
    document.getElementById('tabla').style.display = 'block';
    document.getElementById('grafico').style.display = 'none';
}

// Mostrar gráfico
function mostrarGrafico() {
    document.getElementById('tabla').style.display = 'none';
    document.getElementById('grafico').style.display = 'block';

    const ctx = document.getElementById('chart').getContext('2d');
    const temperaturas = datos.map(d => d.temperatura);
    const humedades = datos.map(d => d.humedad);
    const fechas = datos.map(d => new Date(d.fecha_hora)); // Convertir a objetos Date

    // Configuración del gráfico
    if (window.myChart) {
        window.myChart.destroy();
    }

    window.myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: fechas,
            datasets: [
                {
                    label: 'Temperatura (°C)',
                    data: temperaturas,
                    borderColor: 'rgba(255, 99, 132, 1)',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderWidth: 2,
                    pointRadius: 5,
                    pointHoverRadius: 7,
                    tension: 0.4,
                },
                {
                    label: 'Humedad (%)',
                    data: humedades,
                    borderColor: 'rgba(54, 162, 235, 1)',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderWidth: 2,
                    pointRadius: 5,
                    pointHoverRadius: 7,
                    tension: 0.4,
                }
            ]
        },
        options: {
            responsive: true,
            plugins: {
                title: {
                    display: true,
                    text: 'Evolución de Temperatura y Humedad',
                    font: {
                        size: 18
                    },
                    color: '#333',
                },
                legend: {
                    labels: {
                        color: '#555',
                        font: {
                            size: 14
                        }
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(0, 0, 0, 0.8)',
                    titleFont: {
                        size: 16
                    },
                    bodyFont: {
                        size: 14
                    },
                    footerFont: {
                        size: 12
                    }
                }
            },
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'hour',
                        tooltipFormat: 'HH:mm',
                        displayFormats: {
                            hour: 'HH:mm'
                        }
                    },
                    title: {
                        display: true,
                        text: 'Hora',
                        color: '#333',
                        font: {
                            size: 14,
                            weight: 'bold'
                        }
                    },
                    ticks: {
                        color: '#555',
                        font: {
                            size: 12
                        }
                    },
                    grid: {
                        color: 'rgba(200, 200, 200, 0.3)'
                    }
                },
                y: {
                    beginAtZero: false,
                    title: {
                        display: true,
                        text: 'Valores (°C / %)',
                        color: '#333',
                        font: {
                            size: 14,
                            weight: 'bold'
                        }
                    },
                    ticks: {
                        color: '#555',
                        font: {
                            size: 12
                        }
                    },
                    grid: {
                        color: 'rgba(200, 200, 200, 0.3)'
                    }
                }
            }
        }
    });
}
</script>
@endsection