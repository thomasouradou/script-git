#!/bin/bash

# 1. Demander à l'utilisateur où créer le dossier
echo "Où voulez-vous créer votre dossier ? (entrez le chemin complet)"
read emplacement

# 2. Vérifier si le chemin existe
if [ ! -d "$emplacement" ]; then
    echo "Le chemin n'existe pas. Veuillez le créer avant de continuer."
    read -p "Appuyez sur Entrée pour quitter..."
    exit 1
fi

# 3. Se déplacer dans l'emplacement
cd "$emplacement" || {
    echo "Impossible de se déplacer dans le dossier."
    read -p "Appuyez sur Entrée pour quitter..."
    exit 1
}

# 4. Créer un dossier
echo "Entrez le nom du dossier à créer :"
read dossier
mkdir -p "$dossier"

# 5. Créer un fichier collection.txt dans le dossier
cd "$dossier" || exit
touch collection.txt

# 6. Demander le nom du film à ajouter
echo "Entrez le nom du film à ajouter à la collection :"
read film

# 8. Ajouter le nom du film dans le fichier collection.txt
echo "$film" >> collection.txt

echo "✅ Le film '$film' a été ajouté à $PWD/collection.txt"

# Empêche la fermeture du terminal
read -p "Appuyez sur Entrée pour fermer..."
