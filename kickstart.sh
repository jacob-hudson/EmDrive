#!/usr/bin/env bash

ACCESS_KEY=$(cat ~/.aws/credentials | awk -F "=" '/aws_access_key_id/ {print $2}'| tr -d '[:space:]')
SECRET_KEY=$(cat ~/.aws/credentials | awk -F "=" '/aws_secret_access_key/ {print $2}' | tr -d '[:space:]')

echo $ACCESS_KEY
echo $SECRET_KEY

packer validate aws_centos.json
packer build -var "access_key=$ACCESS_KEY" -var "secret_key=$SECRET_KEY" aws_centos.json 
