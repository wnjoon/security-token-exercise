#!/bin/bash

NODE_COUNT=3

for ((i=1; i<=$NODE_COUNT; i++)); do 
    CONTAINER_ID=`docker inspect quorum_node${i}_1 --format "{{.ID}}"`   
    docker stop $CONTAINER_ID
    echo "Container: quorum_node${i}_1 => stopped"
    echo ""
done
