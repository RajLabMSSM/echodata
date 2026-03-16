# Import top GWAS/QTL summary statistics

The resulting topSNPs data.frame can be used to guide the finemap_loci
in querying and fine-mapping loci.

## Usage

``` r
import_topSNPs(
  topSS,
  sheet = 1,
  startRow = 1,
  cols = NULL,
  munge = TRUE,
  colmap = construct_colmap(),
  min_POS = NULL,
  max_POS = NULL,
  grouping_vars = c("Locus"),
  remove_variants = NULL,
  show_table = FALSE,
  verbose = TRUE
)
```

## Arguments

- topSS:

  Can be a data.frame with the top summary stats per locus.
  Alternatively, you can provide a path to the stored top summary stats
  file. Can be in any tabular format (e.g. excel, .tsv, .csv, etc.).
  This file should have one lead GWAS/QTL hits per locus. If there is
  more than one SNP per locus, the one with the smallest p-value (then
  the largest effect size) is selected as the lead SNP. The lead SNP
  will be used as the center of the locus when constructing the locus
  subset files.

- sheet:

  If the *topSS* file is an excel sheet, you can specify which tab to
  use. You can provide either a number to identify the tab by order, or
  a string to identify the tab by name.

- startRow:

  first row to begin looking for data. Empty rows at the top of a file
  are always skipped, regardless of the value of startRow.

- cols:

  A numeric vector specifying which columns in the Excel file to read.
  If NULL, all columns are read.

- munge:

  Standardise column names.

- colmap:

  Column mappings object. Uses
  [construct_colmap](https://rajlabmssm.github.io/echodata/reference/construct_colmap.md)
  by default.

- min_POS:

  Column containing minimum genomic position (used instead of an
  arbitrary window size).

- max_POS:

  Column containing maximum genomic position (used instead of an
  arbitrary window size).

- grouping_vars:

  The variables that you want to group by such that each grouping_var
  combination has its own index SNP. For example, if you want one index
  SNP per QTL eGene - GWAS locus pair, you could supply:
  `grouping_vars=c("Locus","Gene")`.

- remove_variants:

  SNPs to remove from `topSS`,

- show_table:

  Create an interative data table.

- verbose:

  Print messages.

- Locus:

  Column containing unique locus name.

## Value

Munged topSNPs table.

## Examples

``` r
topSNPs <- echodata::import_topSNPs(
    topSS = echodata::topSNPs_Nalls2019_raw,
    colmap = construct_colmap(P = "P, all studies",
                              Effect = "Beta, all studies",
                              Locus = "Nearest Gene",
                              Gene = "QTL Nominated Gene (nearest QTL)"
                              ),
    grouping_vars = "Locus Number")
#> Renaming column: P, all studies ==> P
#> Renaming column: Beta, all studies ==> Effect
#> Renaming column: Nearest Gene ==> Locus
#> Renaming column: QTL Nominated Gene (nearest QTL) ==> Gene
#> [1] "+ Assigning Gene and Locus independently."
#> Standardising column headers.
#> First line of summary statistics file: 
#> SNP  CHR BP  Locus   Gene    Effect allele   Other allele    Effect allele frequency Effect  SE, all studies P   P, COJO, all studies    P, random effects, all studies  P, Conditional 23AndMe only P, 23AndMe only I2, all studies Freq1, previous studies Beta, previous studies  StdErr, previous studies    P, previous studies I2, previous studies    Freq1, new studies  Beta, new studies   StdErr, new studies P, new studies  I2, new studies Passes pooled 23andMe QC    Known GWAS locus within 1MB Failed final filtering and QC   Locus within 250KB  Locus Number    
#> Returning unmapped column names without making them uppercase.
#> + Mapping colnames from MungeSumstats ==> echolocatoR
```
