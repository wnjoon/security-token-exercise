#!/bin/bash

NODE=$1
docker exec -it quorum_node${NODE}_1 geth attach ./qdata/dd/geth.ipc