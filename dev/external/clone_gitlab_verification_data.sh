#!/bin/bash
#
# clone or update verification documents
# and data from instruments
#
TDIR=$(pwd)

pull_or_clone()
{
    if [[ -e "$1" ]]; then
        PDIR=$(pwd)
        cd "$1" || exit
        git pull
        cd "${PDIR}" || exit
    else
        git clone git@gitlab.cta-observatory.org:cta-science/simulations/simulation-model/"${2}"
    fi
}

# (appendices)
clone_verification_process()
{
    mkdir -p verification-process
    cd verification-process || exit

    FF=( lst mst-structure mst-flashcam mst-nectarcam sites sst-1m sst-2m-astri sst-2m-gct-s sst-2m-gct-structure sst-structure sst-camera sct )
    for F in "${FF[@]}"
    do
        echo "Checking $F"
        pull_or_clone "$F" "verification/verification-process/${F}.git"
    done
    cd "$TDIR" || exit
}

clone_data_project()
{
    DIRLIST=("$@")
    TELSYS="${DIRLIST[0]}"
    mkdir -p data-from-instrument-teams/"$TELSYS"
    cd data-from-instrument-teams/"$TELSYS" || exit
    echo
    echo "---------------------------------"
    echo "TELESCOPE SYSTEM $TELSYS"
    for F in "${DIRLIST[@]:1}"
    do
        echo "Checking $F"
        pull_or_clone "$F" "verification/data-from-instrument-teams/$TELSYS/${F}"
    done
    cd "$TDIR" || exit
}

clone_lst_optics()
{
    MSTS=( psf-lst-1 window-transmission psf mirror-lists focal-lengths single-mirror-psf psf-and-focal-lengths-slides mirror-reflectivity lightguide budget )
    clone_data_project "lst/optics" "${MSTS[@]}"
}

clone_lst_camera()
{
    MSTS=( transit-time pde spe pulse-shape pedestals collection-efficiency )
    clone_data_project "lst/camera" "${MSTS[@]}"
}

clone_lst_trigger()
{
    MSTS=( documentation )
    clone_data_project "lst/trigger" "${MSTS[@]}"
}

clone_mst_structure()
{
    MSTS=( single-mirror-psf shadowing mirror-layout )
    clone_data_project "mst-structure" "${MSTS[@]}"
}

clone_mst_nectarcam()
{
    MSTS=( trigger single-pe pulse-shape pixel-layout night-sky-background light-cones )
    clone_data_project "mst-nectarcam" "${MSTS[@]}"
}

clone_mst_flashcam()
{
    MSTS=( trigger single-pe pulse-shape lightguide quantum-efficiency )
    clone_data_project "mst-flashcam" "${MSTS[@]}"
}

clone_sst_harmonization()
{
    MSTS=( spe sipm )
    clone_data_project "sst-harmonization" "${MSTS[@]}"
}

clone_sst_structure()
{
    MSTS=( incidence-angle-focal-plane robast-model )
    clone_data_project "sst-structure" "${MSTS[@]}"
}

clone_sst_1m()
{
    MSTS=( trigger pulse-shape mirror-reflectivity general-documents camera-filter quantum-efficiency nsb-studies )
    clone_data_project "sst-1m" "${MSTS[@]}"
}

clone_gct_camera()
{
    MSTS=( camera )
    clone_data_project "gct" "${MSTS[@]}"
}

clone_gct_optics()
{
    MSTS=( mirror-reflectivity general-docs effective-mirror-area psf )
    clone_data_project "gct/optics" "${MSTS[@]}"
}

clone_astri()
{
   MSTS=( trigger-simulations trigger-logic transmission-silica-filter single-pe shapers prototype-optics pedestals first-data final-design-optics coordinates pde nsb )
    clone_data_project "astri" "${MSTS[@]}"
}

clone_sct_optics()
{
   MSTS=( psf )
   clone_data_project "sct/optics" "${MSTS[@]}"
}

clone_sct_camera()
{
   MSTS=( window-transmission pde )
   clone_data_project "sct/camera" "${MSTS[@]}"
}

echo "Verification process"
clone_verification_process

echo "Data from instrument teams"
clone_lst_camera
clone_lst_trigger
clone_lst_optics
clone_mst_structure
clone_mst_nectarcam
clone_mst_flashcam
clone_sst_harmonization
clone_sst_structure
clone_sst_1m
clone_gct_camera
clone_gct_optics
clone_astri
clone_sct_optics
clone_sct_camera
