<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PanierProduit extends Model
{
    use HasFactory;

    protected $table = 'Panier_Produits';

    protected $fillable = ['panier_id', 'produit_id', 'quantite', 'statut'];
    public $timestamps = false;
}
