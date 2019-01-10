source 00-common.sh

yq d -i istio-*/install/kubernetes/helm/istio/requirements.yaml 'dependencies[15]' # remove istio-cni in >=snapshot.3
$HELM dep update istio-*/install/kubernetes/helm/istio

set -x
$HELM install \
    --wait \
    --name istio \
    --namespace istio-system \
    istio-*/install/kubernetes/helm/istio \
    --set tracing.enabled=true \
    --set grafana.enabled=true \
    --set prometheus.enabled=true \
    --set servicegraph.enabled=true
    #--set global.mTLS.enabled=true
    #--set kiali.enabled=true \

kubectl label namespace default istio-injection=enabled
