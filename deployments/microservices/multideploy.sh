#!/bin/bash

BASE_NAME=$1
if [ -z $BASE_NAME ];then
        echo "Base name wasn't provided. Pass it as first argument when executing the script."
        exit -1
fi

NUMBER_OF_DEPLOYMENTS=$2
if [ -z $NUMBER_OF_DEPLOYMENTS ];then
        echo "Number of deployments weren't provided. Pass it as first argument when executing the script."
        exit -1
fi

PROJECT_ID=$(gcloud config get-value core/project)

for i in $(eval echo "{1..$NUMBER_OF_DEPLOYMENTS}")
do
	# Subtitute variables and direct the output to the kubectl command
	kubectl apply -f <(sed "s/#n/$i/g" deployment_base.yaml | sed "s/PROJECT_ID/$PROJECT_ID/g" | sed "s/BASE_IMAGE/$BASE_NAME/g")
done
