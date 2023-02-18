echo "Setting up argocd..."
echo "Cluster details"
echo "********************"
kubectl config get-clusters
echo "********************"
echo "Creating argocd namespace"
kubectl create namespace argocd
echo "Installing argocd from https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl get svc -n argocd

echo "port forwarding to argocd-server service"

echo "Intial Password for argocd admin user:"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d 
echo "\n"
kubectl port-forward svc/argocd-server -n argocd 8080:443
