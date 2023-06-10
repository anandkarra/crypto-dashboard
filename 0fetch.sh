#!/bin/bash

CYAN='\033[0;36m'
NC='\033[0m' # No Color

DATA_DIR="/home/ak/crypto-dashboard/data"

mkdir temp
cd temp

for i in {1..12}
do
    idx=""
    if [[ ${#i} -eq 1 ]]
    then
        idx="0${i}"
    else
        idx="${i}"
    fi

    filename="BTCUSDT-1d-2021-${idx}"
        
    echo -e "${CYAN}Fetching & unzipping ${filename} ...${NC}"
    wget "https://data.binance.vision/data/spot/monthly/klines/BTCUSDT/1d/${filename}.zip"
    unzip "${filename}.zip"
    echo
    mv -v "${filename}.csv" $DATA_DIR
    echo
    rm -v "${filename}.zip"
    echo
done

cd ..
rmdir temp