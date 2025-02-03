<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class Produits extends Controller
{
    public function index()
    {
        $produits = DB::table('Produits')->get();

        return view('produit-index', ['produits' => $produits]);
    }

}
