# NCUA Retriever

This is a suite of scripts to retrieve Credit Union data from the [National Credit Union Administration](https://www.ncua.gov/) website.

# Requirements
1. Python 3
1. Pandas
1. CURL

# Pre-requisites
```
pip3 install -r requirements.txt
```

# Usage
```
# Create the directory of credit unions and write to file `directory.json`
./scrape-directory.sh
# Retrieve additional information about each credit union
python3 scrape_all.py
```
You will now have a CSV file containing all the credit union data.
