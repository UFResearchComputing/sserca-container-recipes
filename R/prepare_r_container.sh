#!/bin/bash

function help(){
    echo "Usage: sh prepare_r_container.sh BASE_DIR OLD_VER NEW_VER."
    echo "E.g.: ./prepare_r_container.sh /apps/R 4.0 4.1"
    echo "The arguments:"
    echo "  1: Base path e.g. /apps/R"
    echo "  2: Old R version, e.g. 4.0"
    echo "  3: New R version, e.g. 4.1"
    exit 0
}

if [[ $# -eq 0 ]]; then
    help
fi

if [[ $# -ne 3 ]]; then
    help
else
    basedir=$1
    old_r_ver=$2
    new_r_ver=$3
    old_container="${basedir}/${old_r_ver}/container"
    new_container="${basedir}/${new_r_ver}/container"
fi

module load singularity

mkdir -p tmp

singularity exec -C --bind /tmp "${old_container}" R -e 'packages<-installed.packages()[,"Package"];save(packages, file="/tmp/Rpackages")'
cp /tmp/Rpackages "Rpackages_${old_r_ver}"
cp /tmp/Rpackages tmp
singularity exec -C --bind /tmp "${old_container}" dpkg --get-selections > /tmp/deb_packages
cp /tmp/deb_packages "deb_packages_${old_r_ver}"
cp /tmp/deb_packages tmp

singularity build --fakeroot --sandbox "${new_container}" recipe
