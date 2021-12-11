PRAGMA foreign_keys=ON;
--import_tables
.mode csv
.import /Users/munzir/Desktop/flight-dataset/flights-small.csv FLIGHTS
.import /Users/munzir/Desktop/flight-dataset/carriers.csv CARRIERS
.import /Users/munzir/Desktop/flight-dataset/months.csv MONTHS
.import /Users/munzir/Desktop/flight-dataset/weekdays.csv WEEKDAYS