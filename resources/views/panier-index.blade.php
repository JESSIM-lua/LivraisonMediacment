<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produits</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #343a40;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .produit {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .counter {
            display: flex;
            align-items: center;
            gap: 10px;
        }
    </style>
    <meta name="csrf-token" content="{{ csrf_token() }}">
</head>

<body
    <p>Entreprise : {{$entreprise->nom}}</p><br>
    <p>Adresse : {{$entreprise->adresse}}</p><br>
    <p>Les produits du panier</p>
    @php $PrixTotal = 0; @endphp
    @foreach ($produits as $produit)
        <li class="produit" data-id="{{ $produit->id }}">
            <span>id : {{ $produit->id }} - {{ $produit->libelle }}  -  prix {{$produit->prix}} €</span>
            <button class="btn">Supprimer du panier</button>
            @php $PrixTotal += $produit->prix; @endphp
        </li>

    

    @endforeach

    <p>Prix Total: {{$PrixTotal}}</p>
</body