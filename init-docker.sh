#!/bin/bash -e

#=-----------------------------=#
# Docker Immage Releasing Script
#=-----------------------------=#
# parameterising to make it more obvious how hypervisor image is constructed
REGISTRY_URL=${AWS_ACCOUNT_ID}.dkr.ecr.${EB_REGION}.amazonaws.com


# namespaced repo name
SOURCE_IMAGE="${DOCKER_REPO}"
# using it as there will be 2 versions published
TARGET_IMAGE="${REGISTRY_URL}/${DOCKER_REPO}"
# lets make sure we always have access to latest image
TARGET_IMAGE_LATEST="${TARGET_IMAGE}:latest"
TIMESTAMP=$(date '+%Y%m%d%H%M%S')

#=-----------------------------=#
# Date and Time
#=-----------------------------=#
# using datetime as part of a version for versioned image
VERSION="${TIMESTAMP}-${TRAVIS_COMMIT}"
TARGET_IMAGE_VERSIONED="${TARGET_IMAGE}:${VERSION}"

#=-----------------------------=#
# Non hub.docker registry
#=-----------------------------=#
# making sure correct region is set
aws configure set default.region ${EB_REGION}


#=-----------------------------=#
# Push image to ECR
#=-----------------------------=#
$(aws ecr get-login --no-include-email)

#=-----------------------------=#
# Docker image versioning 
#=-----------------------------=#
# update latest version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_LATEST}
docker push ${TARGET_IMAGE_LATEST}

# push new version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_VERSIONED}
docker push ${TARGET_IMAGE_VERSIONED}
#=-----------------------------=#

exit 0
