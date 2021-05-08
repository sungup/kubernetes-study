#!/bin/bash

if [[ $1 == install ]]; then
  kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
  kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
  kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
  kubectl apply -f metallb-configmap.yaml
elif [[ $1 == remove ]]; then
  kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
  kubectl delete -f metallb-configmap.yaml
  kubectl delete secret memberlist 
  kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
fi
