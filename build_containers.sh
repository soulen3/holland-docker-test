#!/bin/bash

for dir in `ls containers`
do
 docker build -t $dir containers/$dir
done
