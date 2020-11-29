#!/bin/bash

if [ "$1" == "code" ]
then
    code
    exit 0
elif [ "$1" == "idea" ]
then
    sh ~/.local/bin/idea
    exit 0
elif [ "$1" == "clion" ]
then
    sh ~/.local/bin/clion
    exit 0
elif [ "$1" == "pycharm" ]
then
    
    exit 0
elif [ "$1" == "webstorm" ]
then
    
    exit 0
elif [ "$1" == "datagrip" ]
then
    
    exit 0
elif [ "$1" == "phpstorm" ]
then
    
    exit 0
elif [ "$1" == "android" ]
then
    sh ~/.local/bin/android-studio
    exit 0
elif [ "$1" == "rider" ]
then
    sh ~/jetbrains/Rider-2020.2.2/bin/rider.sh
    exit 0
elif [ "$1" == "goland" ]
then
    sh ~/.local/bin/goland
    exit 0
fi
fi
