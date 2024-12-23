<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Lugar extends Model
{
    use HasFactory;

    protected $table = 'lugares'; // Nombre de la tabla en la base de datos
    protected $primaryKey = 'idLugares'; // Clave primaria
    public $timestamps = false; // Desactiva timestamps si no se usan

    protected $fillable = ['ubicacion', 'estado', 'idSensores']; // Campos permitidos
}
