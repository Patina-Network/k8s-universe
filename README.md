# `k8s-universe`

## How to setup Flux on a new cluster

1. Update `./environments/flux-system/gotk-sync.yaml` to point to your public repository link.

1. Authenticate into your cluster (test with `k get pods` to ensure that authentication succeeded)

1. Run `kubectl apply -k ./environments/flux-system` to kick off Flux
