source 00-common.sh

wget https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-darwin-amd64.tar.gz
tar xvzf helm-v${HELM_VERSION}-darwin-amd64.tar.gz

set -x
kubectl create -f istio-*/install/kubernetes/helm/helm-service-account.yaml
$HELM init --service-account tiller
while true; do if ! $HELM --tiller-connection-timeout=1 version; then sleep 1; else exit 0; fi; done
