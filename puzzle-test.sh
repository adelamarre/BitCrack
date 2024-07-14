#!/bin/bash
PUZZLE_INDEX=66+
# 1A838B13505B26867
START="1A838B13505B20000"
END="1A838B13505B2FFFF"

TARGET="18ZMbwUFLMHoZBbfpCjUJQTCMCbktshgpe"


# Obtenir la sous-plage correspondante
KEYSPACE=${START}:${END}

# Afficher les informations de la plage pour vérification
echo "Keyspace: $KEYSPACE"
echo "Target: $TARGET"
# Lancer clbitcrack avec les paramètres appropriés
OUTPUT_FILE="wip_${PUZZLE_INDEX}_${START}_${END}.txt"
./bin/clbitcrack --list-devices
./bin/clbitcrack -c --keyspace "$KEYSPACE" -o "keys.txt" --continue "$OUTPUT_FILE" $TARGET
