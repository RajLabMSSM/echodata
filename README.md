<img src='https://github.com/RajLabMSSM/echodata/raw/main/inst/hex/hex.png' height='300'><br><br>
[![R build
status](https://github.com/RajLabMSSM/echodata/workflows/rworkflows/badge.svg)](https://github.com/RajLabMSSM/echodata/actions)
[![](https://img.shields.io/github/last-commit/RajLabMSSM/echodata.svg)](https://github.com/RajLabMSSM/echodata/commits/main)
[![](https://app.codecov.io/gh/RajLabMSSM/echodata/branch/main/graph/badge.svg)](https://app.codecov.io/gh/RajLabMSSM/echodata)
[![License:
GPL-3](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://cran.r-project.org/web/licenses/GPL-3)
<h4>
Authors: <i>Brian Schilder, Jack Humphrey, Towfique Raj</i>
</h4>
<h5>
README updated: <i>Nov-11-2022</i>
</h5>

## `echodata`: Examples of fine-mapped GWAS summary statistics, data formatting functions, and API access to the echolocatoR Fine-mapping Portal.

This R package is part of the *echoverse* suite that supports
[`echolocatoR`](https://github.com/RajLabMSSM/echolocatoR): an automated
genomic fine-mapping pipeline.

If you use `echodata`, please cite:

> Brian M Schilder, Jack Humphrey, Towfique Raj (2021) echolocatoR: an
> automated end-to-end statistical and functional genomic fine-mapping
> pipeline, *Bioinformatics*; btab658,
> <https://doi.org/10.1093/bioinformatics/btab658>

## Installation

``` r
if(!require("remotes")) install.packages("remotes")

remotes::install_github("RajLabMSSM/echodata")
library(echodata)
```

## Documentation

### [Website](https://rajlabmssm.github.io/echodata)

### [Getting started](https://rajlabmssm.github.io/echodata/articles/echodata)

# echoverse table of contents

``` r
scKirby::source_all()
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    ## Sourcing 100 files.

``` r
toc <-  github_pages_toc(owner = c("RajLabMSSM","neurogenomics"), 
                         repo = c("echodata","MungeSumstats"))
```

<ul class="toc-list" style="ul {list-style: none};ul li h2 a:before { content:&#39;🦇&#39;};">
<li>
<h2>
🦇 <a href='https://rajlabmssm.github.io/echodata/'>echodata</a>
</h2>
<ul>
<li>
<h3>
<a href='https://rajlabmssm.github.io/echodata//articles/echodata.html' target='blank'>echodata</a>
</h3>
</li>
<li>
<h3>
<a href='https://rajlabmssm.github.io/echodata//articles/echolocatoR_Finemapping_Portal.html' target='blank'>echolocatoR
Finemapping Portal</a>
</h3>
</li>
</ul>
</li>
<li>
<h2>
🦇
<a href='https://neurogenomics.github.io/MungeSumstats/'>MungeSumstats</a>
</h2>
<ul>
<li>
<h3>
<a href='https://neurogenomics.github.io/MungeSumstats//articles/MungeSumstats.html' target='blank'>MungeSumstats</a>
</h3>
</li>
<li>
<h3>
<a href='https://neurogenomics.github.io/MungeSumstats//articles/OpenGWAS.html' target='blank'>OpenGWAS</a>
</h3>
</li>
<li>
<h3>
<a href='https://neurogenomics.github.io/MungeSumstats//articles/docker.html' target='blank'>docker</a>
</h3>
</li>
</ul>
</li>
</ul>
<hr>

## Contact

<a href="https://bschilder.github.io/BMSchilder/" target="_blank">Brian
M. Schilder, Bioinformatician II</a>  
<a href="https://rajlab.org" target="_blank">Raj Lab</a>  
<a href="https://icahn.mssm.edu/about/departments/neuroscience" target="_blank">Department
of Neuroscience, Icahn School of Medicine at Mount Sinai</a>
