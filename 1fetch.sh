#!/bin/bash

CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

DATA_DIR="/home/ak/crypto-dashboard/data"
YEAR="2021"

mkdir temp
cd temp

mkdir "${DATA_DIR}/${YEAR}"

for i in {1..12}
do
    idx=""
    if [[ ${#i} -eq 1 ]]
    then
        idx="0${i}"
    else
        idx="${i}"
    fi

    filename="BTCUSDT-1d-${YEAR}-${idx}"
        
    echo -e "${CYAN}Fetching & unzipping ${filename} ...${NC}"
    wget "https://data.binance.vision/data/spot/monthly/klines/BTCUSDT/1d/${filename}.zip"
    
    if [[ $? -eq 0 ]]
    then
        unzip "${filename}.zip"
        echo
        mv -v "${filename}.csv" "${DATA_DIR}/${YEAR}"
        echo
        rm -v "${filename}.zip"
    else
        echo -e "${RED}>>> WARN: Failed to fetch ${filename}${NC}"
    fi
    echo
done

cd ..
rm -rf temp