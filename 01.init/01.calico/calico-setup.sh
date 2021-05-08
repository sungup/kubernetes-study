#!/bin/bash

if [[ $1 == install ]]; then
  kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
  kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml
  kubectl taint nodes --all node-role.kubernetes.io/master-

elif [[ $1 == remove ]]; then
fi
