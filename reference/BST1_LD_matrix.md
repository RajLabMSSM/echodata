# LD with the lead SNP: BST1 locus

Precomputed LD within the *BST1* locus (defined in
[`BST1`](https://rajlabmssm.github.io/echodata/reference/BST1.md). LD
derived white British subpopulation in the UK Biobank. Only includes a
subset of all the SNPs for storage purposes (including the lead GWAS/QTL
SNP).

## Usage

``` r
data("BST1_LD_matrix")
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

<https://www.ukbiobank.ac.uk>
[doi:10.1038/s41588-020-00735-5](https://doi.org/10.1038/s41588-020-00735-5)
@examples
` data("BST1") # Only including a small subset of the full # LD matrix for storage purposes. lead_snp <- subset(BST1, leadSNP)$SNP snp_list <- BST1[which(BST1$SNP==lead_snp)- seq(100,which(BST1$SNP==lead_snp))+100,]$SNP path <- portal_query(phenotypes = "parkinson", loci = "BST1", dataset_types = "LD", LD_panels = "UKB") # path <- file.path( # "../Fine_Mapping/Data/GWAS/Nalls23andMe_2019/BST1/plink/UKB_LD.RDS") BST1_LD_matrix <- readRDS(path) BST1_LD_matrix <- BST1_LD_matrix[snp_list, snp_list] ### shortcut # BST1_LD_matrix <- echolocatoR::BST1_LD_matrix usethis::use_data(BST1_LD_matrix, overwrite=TRUE) `

## Details

Data originally comes from [UK Biobank](https://www.ukbiobank.ac.uk). LD
was pre-computed and stored by the Alkes Price lab (see
[doi:10.1038/s41588-020-00735-5](https://doi.org/10.1038/s41588-020-00735-5)
).
