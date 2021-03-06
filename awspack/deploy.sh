#!/bin/bash

set -euo pipefail

# if [[ -z ${1+x} ]];
# then
#     echo 'version number required'
#     exit 1
# else
#     VERSION=$1
# fi

# BASE_DIR=$(pwd)
# BUILD_DIR=${BASE_DIR}/build/

# cd ${BUILD_DIR}/layer/
# zip -r -q awspack-${VERSION}.zip .
# mkdir -p ${BUILD_DIR}/dist/
# mv awspack-${VERSION}.zip ${BUILD_DIR}/dist/
# version_="${VERSION//\./_}"
# aws lambda publish-layer-version \
#     --layer-name r-awspack-${version_} \
#     --zip-file fileb://${BUILD_DIR}/dist/awspack-${VERSION}.zip

TIMESTAMP="`date +%Y%m%d_%H%M%S`"
LIB_FILE="Rlibs-${TIMESTAMP}.tar"
LIB_FILE_COMPRESSED="${LIB_FILE}.gz"
tar cvvf $LIB_FILE build/layer/R
gzip $LIB_FILE