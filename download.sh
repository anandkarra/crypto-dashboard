#!/bin/bash
for i in {1..11}
do
   echo "Downloading BTCUSDT-1d-2021-0${i} ..."
   wget "https://data.binance.vision/data/spot/monthly/klines/BTCUSDT/1d/BTCUSDT-1d-2021-0${i}.zip"
done