#!/bin/bash
# Make a request for 99999 results, which gives us all the credit unions (22385 at time of writing).
curl 'https://mapping.ncua.gov/api/ResearchCreditUnion/GetQuickSearch' \
  -H 'authority: mapping.ncua.gov' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: en-US,en;q=0.9,es-CL;q=0.8,es;q=0.7' \
  -H 'content-type: application/json' \
  -H 'dnt: 1' \
  -H 'origin: https://mapping.ncua.gov' \
  -H 'referer: https://mapping.ncua.gov/ResearchCreditUnion' \
  -H 'sec-ch-ua: "Google Chrome";v="107", "Chromium";v="107", "Not=A?Brand";v="24"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36' \
  --data-raw '{"charter":null,"skip":0,"take":99999}' \
  --compressed > directory.json