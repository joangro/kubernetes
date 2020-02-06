#!/bin/bash

NUMBER_OF_DEPLOYMENTS=$1
if [ -z $NUMBER_OF_DEPLOYMENTS ];then
        echo "Number of deployments weren't provided. Pass it as first argument when executing the script."
        exit -1
fi

cp ingress-dynamic.yaml ingress-dynamic.old

for i in $(eval echo "{1..$NUMBER_OF_DEPLOYMENTS}")
do
        PORT_TO_EXPOSE=$(( $i + 8000 ))
	cat <<EOF >> ingress-dynamic.yaml
         - path: /service$i
           backend:
             serviceName: microservice-$i
             servicePort: $PORT_TO_EXPOSE
EOF

done

echo "Applying configuration..."
kubectl apply -f ingress-dynamic.yaml

echo -e "Applied ingress configuration:\n"
cat ingress-dynamic.yaml

echo -e "\nResetting ingress-dynamic.yaml to its original contents..."
mv ingress-dynamic.old ingress-dynamic.yaml

echo "Done!"
