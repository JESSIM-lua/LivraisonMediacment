<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PanierProduit;
use App\Models\Entreprises;
use App\Models\Panier;

class EntrepriseController extends Controller
{

    
    public function index(Request $request)
    {
        
        $entreprises = Entreprises::all();

        return view('entreprise-index', ['entreprises' => $entreprises]);
        

    }

}