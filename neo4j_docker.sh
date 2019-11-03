#!/bin/bash
currentPath=$PWD
currentNeo4jPath=$currentPath/neo4j
echo $currentNeo4jPath

if [[ ! -e $currentNeo4jPath ]]; then
    mkdir $currentNeo4jPath
fi

if [[ ! -e $currentNeo4jPath/data ]]; then
    mkdir $currentNeo4jPath/data
fi
if [[ ! -e $currentNeo4jPath/logs ]]; then
    mkdir $currentNeo4jPath/logs
fi
if [[ ! -e $currentNeo4jPath/import ]]; then
    mkdir $currentNeo4jPath/import
fi
if [[ ! -e $currentNeo4jPath/conf ]]; then
    mkdir $currentNeo4jPath/conf
fi


docker run --name neo4j  \
           -p7474:7474 -p7687:7687 \
           -d \
           -v $currentNeo4jPath/data:/data \
           -v $currentNeo4jPath/logs:/logs \
           -v $currentNeo4jPath/import:/var/lib/neo4j/import \
           -v $currentNeo4jPath/conf:/conf \
           -v $currentNeo4jPath/plugins:/var/lib/neo4j/plugins \
           --env NEO4J_AUTH=neo4j/password  \
           neo4j:latest