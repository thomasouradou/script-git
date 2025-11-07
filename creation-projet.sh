#!/bin/bash

# 1. Demander à l'utilisateur le nom du projet à créer
echo "Entrez le nom du projet à créer :"
read projet

# 2. Récupérer la valeur saisie par l'utilisateur dans une variable
# (déjà fait ci-dessus : $projet)

# 3. Demander à l'utilisateur l'emplacement du projet
echo "Entrez l'emplacement où le projet doit être créé (chemin complet) :"
read emplacement

# 4. Se déplacer dans le répertoire
cd "$emplacement" || {
    echo "Erreur : impossible de se déplacer dans '$emplacement'."
    read -p "Appuyez sur Entrée pour quitter..."
    exit 1
}

# 5. Créer le dossier du projet
mkdir -p "$projet"
cd "$projet" || exit

# 6. Créer un dossier 'site'
mkdir -p site

# 7. Ajouter dans 'site' les fichiers demandés
cd site
touch index.html script.js main.css img.png

# 8. Initialiser le dossier du projet avec git
cd ..
git init > /dev/null 2>&1

# 9. Lister le contenu du dossier du projet
echo
echo "📁 Contenu du dossier '$projet' :"
ls -R

# 10. Afficher un message de succès
echo
echo "✅ Le projet '$projet' a été créé avec succès dans : $emplacement/$projet"

# Empêcher la fermeture immédiate du terminal (utile si double-clic)
read -p "Appuyez sur Entrée pour fermer..."
