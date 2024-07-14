#!/bin/bash
PUZZLE_INDEX=66+

START="363FFFFFFFFFFFFF"
END="36FFFFFFFFFFFFFF"

TARGET="13zb1hQbWVsc2S7ZTZnP2G4undNNpdh5so"


# Obtenir la sous-plage correspondante
KEYSPACE=${START}:${END}

# Afficher les informations de la plage pour vérification
echo "Keyspace: $KEYSPACE"

# Lancer clbitcrack avec les paramètres appropriés
OUTPUT_FILE="wip_${PUZZLE_INDEX}_${START}_${END}.txt"
./bin/clbitcrack --list-devices
./bin/clbitcrack -c --keyspace "$KEYSPACE" -o "keys.txt" --continue "$OUTPUT_FILE" $TARGET
