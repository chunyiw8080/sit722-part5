echo "Current directory: $(pwd)"

set -u
: $CONTAINER_REGISTRY
: $VERSION

docker build -t $CONTAINER_REGISTRY/book-catalog:$VERSION --file ./book_catalog/Dockerfile . > /dev/null 2>&1
echo "Book-catalog image build complete"

docker build -t $CONTAINER_REGISTRY/inventory:$VERSION --file ./inventory_management/Dockerfile . > /dev/null 2>&1
echo "Inventory_management image build complete"
