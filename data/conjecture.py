def hex_to_int(hex_str):
    return int(hex_str, 16)

def int_to_hex(int_val):
    return hex(int_val)[2:].upper()

def calculate_average_difference(hex_seq):
    differences = []
    
    for group in hex_seq:
        if len(group) < 2:
            continue
        first_value = hex_to_int(group[0])
        second_value = hex_to_int(group[1])
        difference = second_value - first_value
        differences.append(difference)
    
    average_difference = sum(differences) // len(differences)
    return average_difference

hex_seq = [
    ["1", "3", "7", "8"],
    ["15", "31", "4C", "E0"],
    ["1D3", "202", "483", "A7B"],
    ["1460", "2930", "68F3", "C936"],
    ["1764F", "3080D", "5749F", "D2C55"],
    ["1BA534", "2DE40F", "556E52", "DC2A04"],
    ["1FA5EE5", "340326E", "6AC3875", "D916CE8"],
    ["17E2551E", "3D94CD64", "7D4FE747", "B862A62E"],
    ["1A96CA8D8", "34A65911D", "4AED21170", "9DE820A7C"],
    ["1757756A93", "22382FACD0", "4B5F8303E9", "E9AE4933D6"],
    ["153869ACC5B", "2A221C58D8F", "6BD3B27C591", "E02B35A358F"],
    ["122FCA143C05", "2EC18388D544", "6CD610B53CBA", "ADE6D7CE3B9B"],
    ["174176B015F4D", "22BD43C2E9354", "75070A1A009D4", "EFAE164CB9E3C"],
    ["180788E47E326C", "236FB6D5AD1F43", "6ABE1F9B67E114", "9D18B63AC4FFDF"],
    ["1EB25C90795D61C", "2C675B852189A21", "7496CBB87CAB44F", "FC07A1825367BBE"],
    ["13C96A3742F64906", "363D541EB611ABEE", "7CCE5EFDACCF6808", "F7051F27B09112D4"],
    ["1A838B13505B26867"]
]

# Calculer la différence moyenne
average_difference = calculate_average_difference(hex_seq)

# afficher la différence moyenne en int et en hex
print(f"La différence moyenne est : {average_difference} ({int_to_hex(average_difference)})")

# Utiliser cette moyenne pour prédire le prochain deuxième nombre
last_group = hex_seq[-1]
next_first_value = hex_to_int(last_group[0])
predicted_next_second_value = next_first_value + average_difference
predicted_next_second_value_hex = int_to_hex(predicted_next_second_value)

# Vérifier que la valeur est dans la plage
start_range = "20000000000000000"
end_range = "3ffffffffffffffff"

if hex_to_int(start_range) <= predicted_next_second_value <= hex_to_int(end_range):
    print(f"La prochaine valeur prédite est : {predicted_next_second_value_hex}")
else:
    print(f"La valeur prédite {predicted_next_second_value_hex} est hors de la plage spécifiée.")
