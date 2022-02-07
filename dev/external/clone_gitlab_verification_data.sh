#!/bin/bash
#
# clone or update the verification documents
#
TDIR=$(pwd)

pull_or_clone()
{
    if [[ -e "$1" ]]; then
        cd "$1" || exit
        git pull
        cd "${TDIR}" || exit
    else
        git clone git@gitlab.cta-observatory.org:cta-science/simulations/simulation-model/"${2}"
    fi
}

echo "Model configuration"

# pull_or_clone "simulation-model-description" "simulation-model-description.git"

echo "Verification process"

mkdir -p verification-process
cd verification-process || exit

FF=( lst mst-structure mst-flashcam mst-nectarcam sites sst-1m sst-2m-astri sst-2m-gct-s sst-2m-gct-structure sst-structure sst-camera sct )
FF=( sst-structure sst-camera sct )
for F in "${FF[@]}"
do
    echo "Checking $F"
    # pull_or_clone "$F" "verification/verification-process/${F}.git"
done
cd "$TDIR" || exit

echo "Data from instrument teams"

## MST structure
MSTS=( single-mirror-psf shadowing mirror-layout )

TELSYS="mst-structure"
mkdir -p data-from-instrument-teams/"$TELSYS"
cd data-from-instrument-teams/"$TELSYS" || exit
for F in "${MSTS[@]}"
do
    echo "Checking $F"
    pull_or_clone "${F}" "verification/data-from-instrument-teams/$TELSYS/${F}"
done
cd "$TDIR" || exit

## MST NectarCam
TELSYS="mst-nectarcam"
MSTS=( trigger single-pe pulse-shape pixel-layout night-sky-backround light-cones )
mkdir -p data-from-instrument-teams/"$TELSYS"
cd data-from-instrument-teams/"$TELSYS" || exit
for F in "${MSTS[@]}"
do
    echo "Checking $F"
    pull_or_clone "$F" "verification/data-from-instrument-teams/$TELSYS/${F}"
done
cd "$TDIR" || exit

## MST FlashCam 
TELSYS="mst-flashcam"
MSTS=( trigger single-pe pulse-shape lightguide quantum-efficiency )
mkdir -p data-from-instrument-teams/"$TELSYS"
cd data-from-instrument-teams/"$TELSYS" || exit
for F in "${MSTS[@]}"
do
    echo "Checking $F"
    pull_or_clone "$F" "verification/data-from-instrument-teams/$TELSYS/${F}"
done
cd "$TDIR" || exit
