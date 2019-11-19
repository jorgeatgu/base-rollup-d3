#!/bin/bash

function initCSS() {
    echo -n "\e[94m\e[1mVamos a lanzar base ¿ya has creado una carpeta? (s/n): "
    read answer
        if echo "$answer" | grep -iq "^s" ;
    then
        echo "Perfecto, vamos a comenzar con Base"
        initConCarpeta;
    else
        echo -n "Pues elige el nombre de tu proyecto: "
        read var_name &&
        mkdir $var_name &&
        cd $var_name &&
        mkdir css src js img &&
        curl -O "https://raw.githubusercontent.com/jorgeatgu/base/master/{.stylelintrc,.gitignore,.stylelintignore,package.json,gulpfile.js,index.html}" &&
        cd src &&
        mkdir css img js &&
        cd css &&
        curl -O "https://raw.githubusercontent.com/jorgeatgu/base/master/{_variables.css,styles.css}" &&
        cd ../js &&
        touch index.js &&
        cd .. &&
        cd .. &&
        git init &&
        git add . &&
        git commit -m 'estructura creada' &&
        echo -e '\e[94m\e[1mEsto va a costar un poco' &&
        npm i &&
        echo -e '\e[94m\e[1mEl script ha terminado. Es hora de picar código! \U0001f913\n' &&
        afplay /System/Library/Sounds/Submarine.aiff &&
        say El script ha terminado. Es hora de picar código!
    fi
}
