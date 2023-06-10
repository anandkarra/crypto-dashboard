#!/bin/bash
for i in {1..11}
do
   echo "Unzipping BTCUSDT-1d-2021-0${i}.zip ..."
   unzip "BTCUSDT-1d-2021-0${i}.zip"

   echo "Moving BTCUSDT-1d-2021-0${i}.csv ..."
   mv -v "BTCUSDT-1d-2021-0${i}.csv" "/home/ak/crypto-dashboard/data"
done