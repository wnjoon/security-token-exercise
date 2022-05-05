#!/bin/bash

TOKEN=$1
BASE_DIR=/Users/wnjoon/Workspace/github.com
BIND_DIR=$BASE_DIR/security-token-exercise/client/contract

echo "Generate .abi, .bin files from input parameter(token)"
if [ ! -d abigenBindings ]; then
    mkdir -p abigenBindings
fi
truffle run abigen $TOKEN

sleep 1

echo "Generate .go file from abi, bin -> to go project"

GOFILENAME="erc1400"
if [ ${TOKEN} == "ERC20Token" ]; then
    GOFILENAME="erc20"
elif [ ${TOKEN} == "ERC721Token" ]; then
    GOFILENAME="erc721"
else
    echo "NOT CORRECT TOKEN NAME"
    exit
fi

if [ ! -d $BIND_DIR/${GOFILENAME} ]; then
    mkdir -p $BIND_DIR/${GOFILENAME}
fi

abigen --bin=abigenBindings/bin/$TOKEN.bin --abi=abigenBindings/abi/$TOKEN.abi --pkg=$GOFILENAME --out=$BIND_DIR/${GOFILENAME}/${GOFILENAME}.go