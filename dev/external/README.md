# External resources accessible by the Container

Install here any software / modules requires inside the container.

gammasim-tools
```
git clone https://github.com/gammasim/gammasim-tools.git
```

## Additional Data

(information below might be outdated)

As a temporary solution, some additional configuration and data is required from the CTA gitlab.
Use the following script to download them all:
```
./clone_gitlab_verification_data.sh
```

The script will clone the following repositories:
1. model configuration
```
git clone git@gitlab.cta-observatory.org:cta-consortium/aswg/simulations/simulation-model/simulation-model-description.git
``` 
2. verification process files
```
mkdir -p verification-process
cd verification-process
git clone https://gitlab.cta-observatory.org/cta-consortium/aswg/simulations/simulation-model/verification/verification-process/mst-structure.git
git clone https://gitlab.cta-observatory.org/cta-consortium/aswg/simulations/simulation-model/verification/verification-process/sst-structure.git
git clone https://gitlab.cta-observatory.org/cta-consortium/aswg/simulations/simulation-model/verification/verification-process/mst-flashcam.git
git clone https://gitlab.cta-observatory.org/cta-consortium/aswg/simulations/simulation-model/verification/verification-process/lst.git
```
3. instrument files
```
git clone https://gitlab.cta-observatory.org/cta-science/simulations/simulation-model/verification/verification-process/
```
