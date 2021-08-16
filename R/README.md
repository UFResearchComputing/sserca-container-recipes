# Ultimate R/RStudio HPC Container Recipe
This is a Singularity container recipe for building unified R/RStudio containers that can be used
for any analysis on an HPC cluster - batch jobs, OnDemand sessions with RStudio, Jupyter kernels,
etc.
Note: these containers take a long time to build because them come with a long list of R packages
that we migrate to newer R versions to keep the packages requested by UFRC clients for their
analyses. Feel free to remove the R package installation from the post-install section of the
recipe. If you have any questions feel free to contact us via apps at rc d0t ufl d0t edu address.

Please submit pull requests for changes to the recipe.

Sincerely,

UFRC User Services and Support Team
