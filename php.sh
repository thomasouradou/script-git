#!/bin/bash

# =====================================================
# Script d’installation et de configuration PHP local
# =====================================================

# 1. Vérifier si PHP est installé
if command -v php >/dev/null 2>&1; then
    echo "✅ PHP est déjà installé sur votre système."
else
    echo "⚠️  PHP n'est pas installé. Installation en cours..."
    # Installation via curl selon le système
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt update
        sudo apt install -y php
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install php
    else
        echo "❌ Système non supporté pour l'installation automatique de PHP."
        exit 1
    fi
fi

# 2. Vérifier si Composer est installé
if command -v composer >/dev/null 2>&1; then
    echo "✅ Composer est déjà installé sur votre système."
else
    echo "⚠️  Composer n'est pas installé. Installation en cours..."
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    echo "✅ Composer a été installé avec succès."
fi

# 3. Créer un fichier index.php
echo "Création du fichier index.php..."
cat << 'EOF' > index.php
<?php
    phpinfo();
?>
EOF

echo "✅ Fichier index.php créé avec succès."

# 4. Lancer le serveur PHP local
echo "🚀 Démarrage du serveur PHP sur http://127.0.0.1:8000 ..."
php -S 127.0.0.1:8000
