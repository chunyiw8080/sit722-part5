set -u
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$DB_URL"

envsubst < ./scripts/kubernetes/deployment.yaml | kubectl delete -f -
envsubst < ./scripts/kubernetes/service.yaml | kubectl delete -f -
envsubst < ./scripts/kubernetes/configmap.yaml | kubectl delete -f -