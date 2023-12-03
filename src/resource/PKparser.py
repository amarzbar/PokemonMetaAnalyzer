import requests
from bs4 import BeautifulSoup
import csv

# Send an HTTP GET request to the website
url = "https://www.serebii.net/pokemon/nationalpokedex.shtml"
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Parse the HTML content
    soup = BeautifulSoup(response.text, 'html.parser')

    # Find the table element by its class name
    table = soup.find('table', class_='dextable')

    # Create a CSV file for writing
    csv_filename = 'pokemon_data.csv'
    with open(csv_filename, 'w', newline='', encoding='utf-8') as csvfile:
        csv_writer = csv.writer(csvfile)

        # Extract table headers
        headers = [header.text.strip() for header in table.find_all('th')]
        csv_writer.writerow(headers)

        # Extract table rows
        rows = table.find_all('tr')
        for row in rows[1:]:  # Skip the first row (header row)
            data = [cell.text.strip() for cell in row.find_all(['td', 'th'])]
            csv_writer.writerow(data)

    print(f"CSV data has been written to {csv_filename}")

else:
    print(f"Failed to retrieve data. Status code: {response.status_code}")
