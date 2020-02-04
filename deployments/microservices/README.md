To do multiple deployments, execute the `multideploy.sh` script. 

Usage:

`./multideploy.sh  BASE_IMAGE_NAME  NUMBER_OF_DEPLOYMENTS`

or

`./multideploy.sh  my_base_image_name  3`

The script will create the containers with the format `gcr.io/"$PROJECT_ID"/"$BASE_IMAGE_NAME"_N` using the gcloud command configuration on the environment.

The script will create N deployments with the following values, for **N=1, 2, ...NUMBER_OF_DEPLOYMENTS**:

```
metadata.name:    microservice-N-deployment

metadata.name.labels.app:    microservice-N

spec.replicas.selector.matchLabels.app:    microservice-N

spec.template.metadata.labels.app:     	   microservice-N

spec.template.spec.containers[].image: 	   gcr.io/PROJECT_ID/BASE_IMAGE_nN
```

To quickly create test images, see (this folder in this same repository)[https://github.com/joangro/kubernetes/tree/master/images/microservices/multiple-images], which I used in combination with this.
