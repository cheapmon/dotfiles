#!/usr/bin/env bash
gopass show inaudito/infrastructure/kubernetes/staging/kubeconfig > /dev/shm/kubeconfig-staging
gopass show inaudito/infrastructure/kubernetes/production/kubeconfig > /dev/shm/kubeconfig-production
export KUBECONFIG=/dev/shm/kubeconfig-staging:/dev/shm/kubeconfig-production

kubectx digitalocean-production
kubens core-production
kubectl get pods
cd
zsh -i

