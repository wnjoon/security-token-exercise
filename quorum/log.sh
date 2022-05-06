#!/bin/bash

NODE=$1
CONTAINER_ID=`docker inspect quorum_node${NODE}_1 --format "{{.ID}}"`   
docker logs -f $CONTAINER_ID