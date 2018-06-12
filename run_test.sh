#!/bin/bash
FORK="https://github.com/holland-backup/holland.git"
BRANCH="master"

if [ $1 ]; then
    docker run --env FORK=$FORK --env BRANCH=$BRANCH $1
    exit
fi    

if [ $2 ]; then
    FORK=$2
fi    

if [ $3 ]; then
    BRANCH=$3
fi    

for dir in `ls containers`
do
 echo ${dir}:
 docker run --env FORK=$FORK --env BRANCH=$BRANCH $dir
done
