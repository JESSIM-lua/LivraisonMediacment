<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Produits;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PanierController;
use App\Http\Controllers\EntrepriseController;


Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get('/produits', [Produits::class, 'index'])->name('produits.index');
    Route::post('/ajouter-panier', action: [PanierController::class, 'ajouterAuPanier'])->name('ajouter.panier');
    Route::get('/panier', action: [PanierController::class, 'index'])->name('panier.index');
});

Route::get('/entreprises', [EntrepriseController::class, 'index'])->name('entreprises.index');





require __DIR__.'/auth.php';
