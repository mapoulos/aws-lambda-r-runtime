#!/bin/bash

set -euo pipefail

BUILD_DIR=/var/awspack/
R_DIR=/opt/R/



export R_LIBS=${BUILD_DIR}/R/library
mkdir -p ${R_LIBS}
# ${R_DIR}/bin/Rscript -e 'install.packages("aws.s3", repos="http://cran.r-project.org")'
${R_DIR}/bin/Rscript -e 'options(Ncpus=4) ; install.packages(c("dplyr","elevatr","fasterize","magrittr","sf","smoothr","spex","stars","terra","countrycode"), repos="http://cran.r-project.org")'
# ${R_DIR}/bin/Rscript -e 'options(Ncpus=4) ; install.packages(c("terra","countrycode"), repos="http://cran.r-project.org")'
rm -f /usr/local/lib/libcurl* #copying in libcurl will mess up lambda
cp -rf /usr/local/lib/lib*.so $BUILD_DIR/