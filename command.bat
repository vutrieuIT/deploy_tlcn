:: add cert-manager to k8s minikube local
kubectl apply --validate=false -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml
:: add ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
