import csv
import json

# Assuming the JSON data is stored in a file named "smogontiering.json"
with open("smogontiering", "r") as file:
    data = json.load(file)

# Open a CSV file for writing
with open("pokemon_data_smogon.csv", "w", newline='') as csvfile:
    # Define the CSV writer
    csv_writer = csv.writer(csvfile)

    # Write the header row
    header = [
        "Dex Number","Name", "HP", "Attack", "Defense", "Special Attack", "Special Defense",
        "Speed", "Weight", "Height", "Primary Type", "Secondary Type", "Abilities", "Formats"
    ]
    csv_writer.writerow(header)

    # Write data for each Pokémon
    for pokemon in data["pokemon"]:
        primary_type = pokemon.get("types", [""])[0]  # Get the first type, default to empty string
        secondary_type = pokemon.get("types", [""])[1] if len(pokemon.get("types", [])) > 1 else "NA"
        oob_info = pokemon.get('oob', {})
        dexNum = "NA"
        try:
            dexNum = oob_info['dex_number'] 
        except:
            pass
    # Check if the keys are present before accessing them
        
        row = [
            dexNum,
            pokemon.get("name", ""),
            pokemon.get("hp", ""),
            pokemon.get("atk", ""),
            pokemon.get("def", ""),
            pokemon.get("spa", ""),
            pokemon.get("spd", ""),
            pokemon.get("spe", ""),
            pokemon.get("weight", ""),
            pokemon.get("height", ""),
            primary_type,
            secondary_type,
            ', '.join(pokemon.get("abilities", [])),
            ', '.join(pokemon.get("formats", [])),
        ]
        csv_writer.writerow(row)

print("CSV file 'pokemon_data.csv' created successfully.")
