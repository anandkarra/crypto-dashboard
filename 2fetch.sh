#!/bin/bash

CYAN='\033[0;36m'
NC='\033[0m' # No Color

DATA_DIR="/home/ak/crypto-dashboard/data"

mkdir temp
cd temp

for y in {2021..2018}
do
    mkdir "${DATA_DIR}/${y}"
    for m in {1..12}
    do
        idx=""
        if [[ ${#m} -eq 1 ]]
        then
            idx="0${m}"
        else
            idx="${m}"
        fi

        filename="BTCUSDT-1d-${y}-${idx}"
        # echo $filename
            
        echo -e "${CYAN}Fetching & unzipping ${filename} ...${NC}"
        wget "https://data.binance.vision/data/spot/monthly/klines/BTCUSDT/1d/${filename}.zip"
        
        if [[ $? -eq 0 ]]
        then
            unzip "${filename}.zip"
            echo
            mv -v "${filename}.csv" "${DATA_DIR}/${y}"
            echo
            rm -v "${filename}.zip"
        else
            echo -e "${RED}>>> WARN: Failed to fetch ${filename}${NC}"
        fi
        echo
    done
done

cd ..
rm -rf temp