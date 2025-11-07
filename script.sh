#!/bin/bash

echo "Où voulez-vous créer ou utiliser votre dossier ? (entrez le chemin complet)"
read emplacement

cd "$emplacement" || { echo "Chemin invalide"; exit 1; }

echo "Nom du dossier à utiliser ou créer :"
read dossier
mkdir -p "$dossier"
cd "$dossier" || exit

# Vérification de l'existence du fichier collection.txt
if [ ! -f collection.txt ]; then
  echo "Le fichier collection.txt n'existe pas, création..."
  touch collection.txt
else
  echo "Le fichier collection.txt existe déjà."
fi

# Demande à l'utilisateur s’il veut ajouter un nouveau film
echo "Souhaitez-vous ajouter un nouveau film à la collection ? (oui/non)"
read reponse

if [ "$reponse" = "oui" ]; then
  echo "Entrez le nom du film à ajouter :"
  read film
  echo "$film" >> collection.txt
  echo "Le film '$film' a été ajouté à la collection."
else
  echo "Aucun film n'a été ajouté."
fi
