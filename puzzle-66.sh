#!/bin/bash
PUZZLE_INDEX=66

START="20000000000000000"
END="3ffffffffffffffff"
RANGES=()

TARGET="13zb1hQbWVsc2S7ZTZnP2G4undNNpdh5so"

# Vérifier les paramètres d'entrée
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <range_index>"
    exit 1
fi

RANGE_INDEX=$1

# Script Python intégré pour diviser la plage en 20 morceaux
RANGES=($(python3 - <<END
def divide_range(start_hex, end_hex, parts):
    start_dec = int(start_hex, 16)
    end_dec = int(end_hex, 16)

    total_size = end_dec - start_dec + 1
    segment_size = total_size // parts

    current_start = start_dec
    ranges = []

    for i in range(parts):
        current_end = current_start + segment_size - 1

        # Ensure the last segment ends correctly at END
        if i == parts - 1:
            current_end = end_dec

        start_hex_str = format(current_start, 'x')
        end_hex_str = format(current_end, 'x')
        ranges.append(f"{start_hex_str}:{end_hex_str}")

        current_start = current_end + 1

    return ranges

start = "$START"
end = "$END"
parts = 20

ranges = divide_range(start, end, parts)

for r in ranges:
    print(r)
END
))

# Vérifier que l'index est dans les limites
if [ "$RANGE_INDEX" -lt 0 ] || [ "$RANGE_INDEX" -ge ${#RANGES[@]} ]; then
    echo "Index hors limites. Veuillez choisir un index entre 0 et $((${#RANGES[@]} - 1))."
    exit 1
fi

# Show all ranges
for i in "${!RANGES[@]}"; do
    echo "Range $i: ${RANGES[$i]}"
done

# Obtenir la sous-plage correspondante
KEYSPACE=${RANGES[$RANGE_INDEX]}

# Afficher les informations de la plage pour vérification
echo "Scanning range $RANGE_INDEX"
echo "Keyspace: $KEYSPACE"

# Lancer clbitcrack avec les paramètres appropriés
OUTPUT_FILE="wip_${PUZZLE_INDEX}_${RANGE_INDEX}.txt"
./bin/clbitcrack --list-devices
./bin/clbitcrack -c --keyspace "$KEYSPACE" -o "keys.txt" --continue "$OUTPUT_FILE" $TARGET
