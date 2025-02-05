<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Panier extends Model
{
    use HasFactory;

    protected $table = 'Paniers';

    protected $fillable = ['entreprise_id', 'date_creation', 'montant_total'];
    public $timestamps = false;
}

