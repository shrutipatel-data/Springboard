import urllib.request

#Download Taxi zone lookup data
urllib.request.urlretrieve("https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv", "C:\\SpringBoard\\CapstoneProject\\Project_1\\NYC_Taxi\\RawData\\taxi_zone_lookup.csv")

# Download the Trip Record Data
for month in range(1,7):
    urllib.request.urlretrieve("https://s3.amazonaws.com/nyc-tlc/trip+data/"+ \
                               "yellow_tripdata_2020-{0:0=2d}.csv".format(month), 
                               "C:\\SpringBoard\\CapstoneProject\\Project_1\\NYC_Taxi\\RawData\\nyc.2020-{0:0=2d}.csv".format(month))