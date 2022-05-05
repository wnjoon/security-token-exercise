#!/bin/bash

OPTION=$1
ISEXIST=`docker ps -a | grep ganache`
ACCOUNT=3
PORT=8545

if [ $OPTION == "start" ]; then
	if [ "$ISEXIST" == "" ]; then
		docker run -d -p $PORT:$PORT --name ganache trufflesuite/ganache-cli --accounts=$ACCOUNT --deterministic
	else 
		docker start ganache
	fi
elif [ $OPTION == "stop" ]; then
	docker stop ganache
elif [ $OPTION == "restart" ]; then
	docker stop ganache
	docker rm ganache
	docker run -d -p $PORT:$PORT --name ganache trufflesuite/ganache-cli --accounts=$ACCOUNT --deterministic
elif [ $OPTION == "log" ]; then	
	docker logs -f ganache
else 
	echo "WRONG COMMAND! USE [start / stop / restart]"
fi

