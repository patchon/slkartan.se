#!/bin/bash

IFS=$'\n'

for station in $(cat stations); do
  echo -n "${station},"
  station=$(echo ${station} | sed 's/ /%20/')
  curl -s 'https://api.sl.se/api2/typeahead.json?key=bd1863f9d4c447aaa2ea5c251a1b3a90&searchstring='${station}'&maxresults=1&StationsOnly=1' | jq .ResponseData[0].SiteId | sed 's/"//g'
  sleep 3
done

