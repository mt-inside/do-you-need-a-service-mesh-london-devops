set -o errexit
set -o errtrace
set -o pipefail
set -o nounset
shopt -s nullglob

export ISTIO_VERSION=1.1.0-snapshot.3

export Z=europe-west1-b
export C=londondevops

export HELM_VERSION=2.11.0
export HELM=./darwin-amd64/helm
