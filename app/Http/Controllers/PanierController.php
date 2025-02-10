<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PanierProduit;
use App\Models\Entreprises;
use App\Models\Panier;

class PanierController extends Controller
{
    public function ajouterAuPanier(Request $request)
    {
        $produit_id = $request->input('produit_id');
        $quantite = $request->input('quantite', 1);
        $entrepriseId = $request->user()->entreprise_id;
        
        $panier = Panier::firstOrCreate([
            'entreprise_id' => $entrepriseId,
            'date_creation' => now(),
        ], [
            'montant_total' => 0
        ]);

        PanierProduit::updateOrCreate(
            ['panier_id' => $panier->id, 'produit_id' => $produit_id],
            ['quantite' => \DB::raw("quantite + $quantite")]
        );

        return response()->json(['message' => 'Produit ajouté au panier']);
    }

    public function index(Request $request)
    {
        $entrepriseId = $request->user()->entreprise_id;
        // $panier = Panier::where('entreprise_id', $entrepriseId)->first();
        // $produits = PanierProduit::where('panier_id', $panier->id)->get();

        $entreprise = Entreprises::find($entrepriseId);

        $panier = Panier::where('entreprise_id', $entrepriseId)->first();

        $produits = \DB::table('users as u')
            ->join('Paniers as p', 'u.entreprise_id', '=', 'p.entreprise_id')
            ->join('Panier_Produits as pp', 'pp.panier_id', '=', 'p.id')
            ->join('Produits as pr', 'pr.id', '=', 'pp.produit_id')
            ->where('u.entreprise_id', $entrepriseId)
            ->select('pr.*')
            ->get();

        

        return view('panier-index', ['produits' => $produits, 'paniers' => $panier, 'entrepriseId' => $entrepriseId, 'entreprise' => $entreprise]);
    }

}

