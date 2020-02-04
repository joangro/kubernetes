To do multiple deployments, run the `multideploy.sh` script. 

Example:

`./multideploy.sh  BASE_IMAGE_NAME  NUMBER_OF_DEPLOYMENTS`

The script will create N deployments with the following values, for N=1, 2, ...NUMBER_OF_DEPLOYMENTS:

```
metadata.name:    microservice-N-deployment

metadata.name.labels.app:    microservice-N

spec.replicas.selector.matchLabels.app:    microservice-N

spec.template.metadata.labels.app:     	   microservice-N

spec.template.spec.containers[].image: 	   gcr.io/PROJECT_ID/BASE_IMAGE_nN
```

To quickly create test images, see (this folder in this same repository)[https://github.com/joangro/kubernetes/tree/master/images/microservices/multiple-images], which I used in combination with this.
