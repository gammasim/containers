# External resources accessible by the Container

Install here any software / modules requires inside the container.

gammasim-tools
```
git clone https://github.com/gammasim/gammasim-tools.git
```

For running without the model DB:

1. model configuration
```
git clone https://gitlab.cta-observatory.org/cta-consortium/aswg/simulations/simulation-model/simulation-model-description.git
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
3. instrument files (not yet on gitlab?)
```
from svn: dataFromInstrumentTeams
```
