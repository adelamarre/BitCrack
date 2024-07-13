#!/bin/bash
PUZZLE_INDEX=101

START="10000000000000000000000000"
END="1fffffffffffffffffffffffff"
# Définir les valeurs de départ et de fin en hexadécimal pour chaque sous-plage
RANGES=(
    "10000000000000000000000000:105e6fc2e6bf25c00000000000"
    "105e6fc2e6bf25c00000000001:10bdcf85cd7e4b800000000000"
    "10bdcf85cd7e4b800000000001:111d2f48b43d71500000000000"
    "111d2f48b43d71500000000001:117c8f0b9afc96c00000000000"
    "117c8f0b9afc96c00000000001:11db8ece81bcbc200000000000"
    "11db8ece81bcbc200000000001:123c8e91589be2200000000000"
    "123c8e91589be2200000000001:129b8e542f7b07a00000000000"
    "129b8e542f7b07a00000000001:12fa8e17065a2d800000000000"
    "12fa8e17065a2d800000000001:135a8ddaed3953000000000000"
    "135a8ddaed3953000000000001:13b98d9dc41878000000000000"
    "13b98d9dc41878000000000001:14188d60aaf79e000000000000"
    "14188d60aaf79e000000000001:14788d2391d6c3e00000000000"
    "14788d2391d6c3e00000000001:14d78ce678b5e9e00000000000"
    "14d78ce678b5e9e00000000001:15378ca95f950fe00000000000"
    "15378ca95f950fe00000000001:15978c6c467435c00000000000"
    "15978c6c467435c00000000001:15f78c2f2d535b800000000000"
    "15f78c2f2d535b800000000001:16578bf2143281800000000000"
    "16578bf2143281800000000001:16b78bb4fb1187800000000000"
    "16b78bb4fb1187800000000001:17178b77e1f0aee00000000000"
    "17178b77e1f0aee00000000001:1fffffffffffffffffffffffff"
)

TARGET="1CKCVdbDJasYmhswB6HKZHEAnNaDpK7W4n"

# Vérifier les paramètres d'entrée
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <range_index>"
    exit 1
fi

RANGE_INDEX=$1

# Vérifier que l'index est dans les limites
if [ "$RANGE_INDEX" -lt 0 ] || [ "$RANGE_INDEX" -ge ${#RANGES[@]} ]; then
    echo "Index hors limites. Veuillez choisir un index entre 0 et $((${#RANGES[@]} - 1))."
    exit 1
fi

# Obtenir la sous-plage correspondante
KEYSPACE=${RANGES[$RANGE_INDEX]}

# Afficher les informations de la plage pour vérification
echo "Scanning range $RANGE_INDEX"
echo "Keyspace: $KEYSPACE"

# Lancer clbitcrack avec les paramètres appropriés
OUTPUT_FILE="wip_${PUZZLE_INDEX}_${RANGE_INDEX}.txt"
./bin/clbitcrack --list-devices
./bin/clbitcrack -c --keyspace "$KEYSPACE" -o "keys.txt" --continue "$OUTPUT_FILE" $TARGET
