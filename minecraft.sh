#!/bin/bash↲

##################################################################################
### First argument : start, restart, stop                                      ###
### Second argument : Directory_name                                           ###
###                                                                            ###
### *Directory_name: Specify the directory name where the server is installed. ###
##################################################################################

start=start.sh # Replace with server start script
base=/directory # Replace with directory path

case $1 in
    "start")
    for ((i=15;i>0;i--))
    do
    echo Wait for $i second...
    sleep 1s
    done
    echo Run $base/$2/$start...
    sleep 5s
    cd $base/$2 && ./$start
    echo Complete.
    ;;

    "restart")
    for ((i=3;i>0;i--))
    do
    screen -r $2 -p0 -X stuff "broadcast Restart the server after $((5*i)) minutes.\015"
    sleep 5m
    done

    for ((i=3;i>0;i--))
    do
    screen -r $2 -p0 -X stuff "broadcast Restart the server after $((10*i)) seconds.\015"
    sleep 10s
    done

    for ((i=10;i>0;i--))
    do
    screen -r $2 -p0 -X stuff "broadcast Restart the server after $i seconds.\015"
    sleep 1s
    done
    screen -r $2 -p0 -X stuff "broadcast Restarting...\015"
    sleep 1s
    screen -r $2 -p0 -X stuff "restart"
    ;;

    "stop")
    screen -r $2 -p0 -X stuff "broadcast stopping...\015"
    sleep 1s
    screen -r $2 -p0 -X stuff "stop"
    ;;
esac