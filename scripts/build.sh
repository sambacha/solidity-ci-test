
#!/bin/sh

docker image build \
  --pull \
  -t $TAG \
  --build-arg SOURCE=$SOURCE \
  --build-arg TAG=$TAG \
  --build-arg COMPILER_URL=$COMPILER_URL \
  $BUILD_CONTEXT

