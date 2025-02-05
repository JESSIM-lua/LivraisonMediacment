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
<body>
    <div class="container">
        <h1>Produits</h1>
        <ul>
            @foreach($produits as $produit)
                    <li class="produit" data-id="{{ $produit->id }}">

                    <span>{{ $produit->libelle }} - {{ $produit->prix }}€</span>
                    <button class="btn">Ajouter au panier</button>
                    <div class="counter">
                        <button class="btn btn-moins">-</button>
                        <span class="count">0</span>
                        <button class="btn btn-plus">+</button>
                    </div>
                </li>
            @endforeach
        </ul>
    </div>
    <script>
        document.querySelectorAll('.produit').forEach(produit => {
            let count = 0;
            let countElement = produit.querySelector('.count');
            let btnCountMoins = produit.querySelector('.btn-moins');
            let btnCountPlus = produit.querySelector('.btn-plus');
            
            btnCountMoins.addEventListener('click', function() {
                if (count > 0) count--;
                countElement.innerText = count;
            });
            
            btnCountPlus.addEventListener('click', function() {
                count++;
                countElement.innerText = count;
            });
        });
    </script>
    <script>
        document.querySelectorAll('.produit').forEach(produit => {
            let countElement = produit.querySelector('.count');
            let btnCountMoins = produit.querySelector('.btn-moins');
            let btnCountPlus = produit.querySelector('.btn-plus');
            let btnAjouter = produit.querySelector('.btn');
            let produitId = produit.getAttribute('data-id');
    
            let count = 0;
            
            btnCountMoins.addEventListener('click', function() {
                if (count > 0) count--;
                countElement.innerText = count;
            });
            
            btnCountPlus.addEventListener('click', function() {
                count++;
                countElement.innerText = count;
            });
    
            btnAjouter.addEventListener('click', function() {
                if (count > 0) {
                    fetch("{{ route('ajouter.panier') }}", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            "X-CSRF-TOKEN": "{{ csrf_token() }}"
                        },
                        body: JSON.stringify({
                            produit_id: produitId,
                            quantite: count
                        })
                    })
                    .then(response => response.json())
                    .then(data => alert(data.message))
                    .catch(error => console.error("Erreur:", error));
                } else {
                    alert("Ajoutez au moins un produit");
                }
            });
        });
    </script>
    
</body>
</html>
