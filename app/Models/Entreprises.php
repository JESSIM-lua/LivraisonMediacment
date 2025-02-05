<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Entreprises extends Model
{
    use HasFactory;

    protected $table = 'Entreprises';

    protected $fillable = ['nom', 'adresse'];
    public $timestamps = false;
}
