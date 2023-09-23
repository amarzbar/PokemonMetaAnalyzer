import csv

# Open the original CSV file for reading
original_csv_filename = 'pokemon_data.csv'
with open(original_csv_filename, 'r', newline='', encoding='utf-8') as original_csvfile:
    csv_reader = csv.reader(original_csvfile)
    
    # Create a new CSV file for writing the modified data
    modified_csv_filename = 'pokemon_data_modified.csv'
    with open(modified_csv_filename, 'w', newline='', encoding='utf-8') as modified_csvfile:
        csv_writer = csv.writer(modified_csvfile)

        # Loop through the rows in the original CSV file
        for i, row in enumerate(csv_reader):
            # Skip every second row (even-indexed rows)
            if i % 2 != 0:
                csv_writer.writerow(row)

print(f"Modified CSV data has been written to {modified_csv_filename}")
