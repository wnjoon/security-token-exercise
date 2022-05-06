#!/bin/bash

echo "============================="
echo "Reset Quorum local network"
echo "============================="

NODE_COUNT=3

echo "Stop Quorum docker containers"
for ((i=1; i<=$NODE_COUNT; i++)); do 
    CONTAINER_ID=`docker inspect quorum_node${i}_1 --format "{{.ID}}"`   
    docker stop $CONTAINER_ID
    echo "Container: quorum_node${i}_1 => stopped"
done
echo "============================="

echo "Remove Quorum docker containers"
for ((i=1; i<=$NODE_COUNT; i++)); do 
    CONTAINER_ID=`docker inspect quorum_node${i}_1 --format "{{.ID}}"`   
    docker rm $CONTAINER_ID
    echo "Container: quorum_node${i}_1 => removed"
done
echo "============================="



