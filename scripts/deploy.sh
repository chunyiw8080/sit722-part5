set -u
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$DB_URL"

envsubst < ./scripts/kubernetes/configmap.yaml | kubectl apply -f -
envsubst < ./scripts/kubernetes/service.yaml | kubectl apply -f -
envsubst < ./scripts/kubernetes/deployment.yaml | kubectl apply -f -
