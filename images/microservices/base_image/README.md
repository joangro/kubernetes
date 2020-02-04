
To run the script just pass it the base name to give the image and the number of images as arguments. 

Example:

`./build-base-image.sh MY_BASE_IMAGE_NAME NUMBER_OF_IMAGES`

or

`./build-base-image.sh hello_world 3`


It will upload the images to [gcr.io](https://cloud.google.com/container-registry/), it will use the default gcloud config project to upload the images there.
