set -u
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$REGISTRY_UN"
: "$REGISTRY_PW"

echo $REGISTRY_PW | docker login $CONTAINER_REGISTRY --username $REGISTRY_UN --password-stdin

docker push $CONTAINER_REGISTRY/book-catalog:$VERSION > /dev/null 2>&1
echo "$CONTAINER_REGISTRY/book-catalog:$VERSION has been push to the registry"

docker push $CONTAINER_REGISTRY/inventory:$VERSION > /dev/null 2>&1
echo "$CONTAINER_REGISTRY/inventory:$VERSION has been push to the registry"
