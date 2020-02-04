#!/bin/bash

BASE_NAME=$1
if [ -z $BASE_NAME ];then
	echo "Base name wasn't provided. Pass it as first argument when executing the script."
	exit -1
fi

NUMBER_OF_IMAGES=$2
if [ -z $NUMBER_OF_IMAGES ];then
	echo "Number of images weren't provided. Pass it as first argument when executing the script."
	exit -1
fi

PROJECT_ID=$(gcloud config get-value core/project)

# Build and push every image
# Doing this instead of just building one and tagging, because I'm passing a different env
# variable to the build each time.
for i in $(eval echo "{1..$NUMBER_OF_IMAGES}")
do
	echo "Building image $i..."
	docker build --build-arg SERVICE_ID="Hello from service $i!" -t gcr.io/$PROJECT_ID/"$BASE_NAME"_n"$i" .
	docker push gcr.io/$PROJECT_ID/"$BASE_NAME"_n"$i"
done

echo "Done!"

