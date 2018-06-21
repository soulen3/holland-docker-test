#!/bin/bash
FORK="https://github.com/holland-backup/holland.git"
BRANCH="master"
DEBUG="False"

if [ $1 ]; then
    docker run --env FORK=$FORK --env BRANCH=$BRANCH --env DEBUG=$DEUBG --env NAME=$1 $1
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
 docker run --env FORK=$FORK --env BRANCH=$BRANCH --env DEBUG=$DEBUG  --env NAME=$dir $dir &
done
wait
