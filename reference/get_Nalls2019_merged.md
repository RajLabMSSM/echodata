# echolocatoR output example: all loci

An example results file after running `finemap_loci` on all Parkinson's
disease (PD)-associated loci.

(*NOTE* : Formerly `merged_DT`)

## Usage

``` r
get_Nalls2019_merged()
```

## Format

data.table

- SNP:

  SNP RSID

- CHR:

  Chromosome

- POS:

  Genomic position (in basepairs)

- ...:

  Optional: extra columns

## Source

[doi:10.1016/S1474-4422(19)30320-5](https://doi.org/10.1016/S1474-4422%2819%2930320-5)

## Details

Data originally comes from the PD GWAS by Nalls et al. (The Lancet
Neurology)
([doi:10.1016/S1474-4422(19)30320-5](https://doi.org/10.1016/S1474-4422%2819%2930320-5)
).

## Examples

``` r
if (FALSE) { # \dontrun{
library(dplyr)
local_files <- echodata::portal_query(phenotypes = "parkinson", 
                            file_types = "multi_finemap",
                            LD_panels = "UKB", 
                            nThread = 10, overwrite=TRUE) 
Nalls2019_merged <- lapply(local_files, function(x){ 
message(x)
        if(file.exists(x) && file.size(x)>0){
            dat <- data.table::fread(x)
            dat <- update_cols(dat)
            dat <- find_consensus_snps(dat=dat)
            dat <- assign_lead_snp(dat)
            return(dat)
        }else {return(NULL)}
}) %>% data.table::rbindlist(fill = TRUE) 

#### piggyback ####                  
tmp <- file.path(tempdir(),"Nalls2019_merged.tsv.gz")
data.table::fwrite(Nalls2019_merged,tmp,sep="\t")
piggyback::pb_upload(file = tmp,
                     repo = "RajLabMSSM/echodata")
} # } 
```
