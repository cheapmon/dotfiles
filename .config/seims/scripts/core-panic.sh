#!/usr/bin/env zsh
source $HOME/.zshrc

kc
kubectx digitalocean-production
kubens core-production
kubectl get pods
cd
zsh -i

