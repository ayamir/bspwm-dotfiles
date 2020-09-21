#!/bin/bash

if [ "$1" == "code" ]
then
    code
    exit 0
elif [ "$1" == "idea" ]
then
    sh ~/jetbrains/idea-IU-201.7846.76/bin/idea.sh
    exit 0
elif [ "$1" == "clion" ]
then
    sh ~/jetbrains/clion-2020.1.2/bin/clion.sh
    exit 0
elif [ "$1" == "pycharm" ]
then
    sh ~/jetbrains/pycharm-2020.1.2/bin/pycharm.sh
    exit 0
elif [ "$1" == "webstorm" ]
then
    sh ~/jetbrains/WebStorm-202.6948.73/bin/webstorm.sh
    exit 0
elif [ "$1" == "datagrip" ]
then
    sh ~/jetbrains/DataGrip-2020.1.4/bin/datagrip.sh
    exit 0
elif [ "$1" == "phpstorm" ]
then
    sh ~/jetbrains/PhpStorm-201.8538.41/bin/phpstorm.sh
    exit 0
elif [ "$1" == "android" ]
then
    flatpak run android-studio
    exit 0
elif [ "$1" == "rider" ]
then
    sh ~/jetbrains/Rider-2020.2.2/bin/rider.sh
    exit 0
fi
