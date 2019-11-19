#!/bin/bash

GREEN='\033[00;32m'
LRED='\033[01;31m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'

function initRollup {
    echo -n "
    ${CYAN} Vamos a lanzar base Rollup d3 ¿ya has creado una carpeta? (s/n): "

    function launch {
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
    }

    read -r answer
        if echo "$answer" | grep -iq "^s" ;
    then
        echo -e "
        ${GREEN} Perfecto, vamos a comenzar con Base Rollup d3"
        launch;
    else
        echo -n "
        ${PURPLE}Pues elige el nombre de tu proyecto: "
        read -r var_name &&
        mkdir "$var_name" &&
        cd "$var_name" &&
        launch
    fi
}
