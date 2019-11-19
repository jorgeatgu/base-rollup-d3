#!/bin/bash

GREEN='\033[00;32m'
LRED='\033[01;31m'

mkdir css src js img &&
curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup-d3/master/{.stylelintrc,.gitignore,.stylelintignore,package.json,rollup.config.js,index.html}" &&
cd src &&
mkdir css img js &&
cd css &&
curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup-d3/master/{_variables.css,styles.css}" &&
cd ../js &&
curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup-d3/master/src/{d3.js,index.js}" &&
cd .. &&
cd .. &&
git init &&
git add . &&
git commit -m 'init' &&
echo -e "
${LRED} Esto va a costar un pocor 🚨🚨" &&
yarn install &&
echo -e "
${GREEN} El script ha terminado. Es hora de picar código! \U0001f913\n" &&
afplay /System/Library/Sounds/Submarine.aiff
