#!/bin/bash -xe
export namespace=example-hello-demo
kubectl create ns ${namespace} || true
kubectl create -f hello-2.yaml --namespace=${namespace}
kubectl create -f hello-3-service.yaml --namespace=${namespace}
kubectl create -f test-cert.yaml --namespace=${namespace}
kubectl create -f hello-4-ingress-ssl.yaml --namespace=${namespace}