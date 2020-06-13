#!/bin/bash

if [ "$1" == "code" ]
then
    code
    exit 0
elif [ "$1" == "idea" ]
then
    sh ~/JetBrains/idea-IU-201.7846.76/bin/idea.sh
    exit 0
elif [ "$1" == "clion" ]
then
    sh ~/JetBrains/clion-2020.1.2/bin/clion.sh
    exit 0
elif [ "$1" == "pycharm" ]
then
    sh ~/JetBrains/pycharm-2020.1.2/bin/pycharm.sh
    exit 0
elif [ "$1" == "webstorm" ]
then
    sh ~/JetBrains/WebStorm-201.7846.79/bin/webstorm.sh
    exit 0
elif [ "$1" == "datagrip" ]
then
    sh ~/JetBrains/DataGrip-2020.1.4/bin/datagrip.sh
    exit 0
fi
