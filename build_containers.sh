#!/bin/bash

for dir in containers/*
do
 docker build -t $dir containers/$dir
done
