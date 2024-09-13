echo "Current directory: $(pwd)"

set -u
: $CONTAINER_REGISTRY
: $VERSION

docker build -t $CONTAINER_REGISTRY/book-catalog:$VERSION --file ./book_catalog/Dockerfile .

docker build -t $CONTAINER_REGISTRY/inventory:$VERSION --file ./inventory_management/Dockerfile .
