# Third-party libraries
import pandas as pd

# Standard libraries
import json
import subprocess
from multiprocessing import Pool, Queue

CU_DIRECTORY_PATH = './directory.json'
CSV_OUTPUT_PATH = './cu_data.csv'
SCRAPER_PATH = './scrape-individual.sh'


class Scraper:
    def __init__(self):
        self.cu_directory = self._load_cu_directory()

    @property
    def cu_ids(self) -> list:
        return [cu['charterNumber'] for cu in self.cu_directory['results']]

    def retrieve_cu_info(self, cu_id: int) -> str:
        print(f'retrieving data for charter number: {cu_id}')
        cu_process = subprocess.run([SCRAPER_PATH, str(cu_id)], capture_output=True)
        return cu_process.stdout.decode('utf-8')

    def _load_cu_directory(self):
        with open(CU_DIRECTORY_PATH, 'r') as f:
            cu_data = f.read()
            return json.loads(cu_data)


def main():
    scraper = Scraper()
    print('Scraping all CU data will take a long time.')
    if input('Do you wish to continue? ').lower().startswith('y'):
        with Pool() as p:
            cu_data = p.map(scraper.retrieve_cu_info, scraper.cu_ids)
            df = pd.DataFrame(cu_data)
            df.to_csv(CSV_OUTPUT_PATH)

if __name__ == '__main__':
    main()
