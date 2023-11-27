#!/bin/bash

INCLUDES="-I=./proto/tron -I/usr/lib -I./proto/googleapis"
FLAGS="--go_opt=module=github.com/tronprotocol/grpc-gateway,paths=import --go-grpc_out=./pkg/proto --go-grpc_opt=module=github.com/tronprotocol/grpc-gateway,paths=import"

protoc ${INCLUDES} ${FLAGS} ./proto/tron/core/*.proto ./proto/tron/core/contract/*.proto ./proto/tron/api/*.proto
mkdir -p ./pkg/proto/util
protoc ${INCLUDES} -I=./proto/util --go_out=./pkg/proto/util --go_opt paths=source_relative ./proto/util/*.proto