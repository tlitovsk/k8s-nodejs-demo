#!/bin/bash -xe
export namespace=example-hello-demo
kubectl create ns ${namespace} || true
rancher namespace associate  ${namespace} $(rancher project ls | grep test | awk '{print $1}')
kubectl create -f hello-2.yaml --namespace=${namespace}
kubectl create -f hello-3-service.yaml --namespace=${namespace}
kubectl create -f test-cert.yaml --namespace=${namespace}
kubectl create -f hello-4-ingress-ssl.yaml --namespace=${namespace}