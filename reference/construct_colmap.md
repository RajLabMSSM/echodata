# Target column map

This function wraps all column name mappings for the full GWAS/QTL
summary statistics file specified by `fullSS_path` (i.e. the "target").

## Usage

``` r
construct_colmap(
  munged = FALSE,
  CHR = "CHR",
  POS = "POS",
  SNP = "SNP",
  P = "P",
  Effect = "Effect",
  StdErr = "StdErr",
  tstat = "tstat",
  Locus = "Locus",
  Freq = "Freq",
  MAF = "MAF",
  A1 = "A1",
  A2 = "A2",
  Gene = "Gene",
  N_cases = "N_cases",
  N_controls = "N_controls",
  proportion_cases = "calculate",
  N = "N",
  verbose = TRUE
)
```

## Arguments

- munged:

  Whether `fullSS_path` have already been standardised/filtered full
  summary stats with
  [format_sumstats](https://al-murphy.github.io/MungeSumstats/reference/format_sumstats.html).
  If `munged=FALSE` you'll need to provide the necessary column names to
  the `colmap` argument.

- CHR:

  Name of the chromosome column in the full summary stats file. Can be
  "chr1" or "1" format. (*default: ="CHR"*)

- POS:

  Name of the genomic position column in the full summary stats file.
  Must be in units of basepairs. (*default: ="POS"*)

- SNP:

  Name of the SNP RSID column in the full summary stats file. (*default:
  ="SNP"*)

- P:

  Name of the p-value column in the full summary stats file. Raw
  p-values are preferred, but if not available corrected p-values (e.g.
  FDR) can be used instead. (*default: ="P"*)

- Effect:

  Name of the effect size column in the full summary stats file. Effect
  size is preferred, but if not available other metrics like Beta for
  Odds Ratio can be used instead. (*default: ="Effect"*)

- StdErr:

  Name of the standard error column in the full summary stats file. You
  can also set `stderr="calculate"` to infer standard error using:
  `effect / tstat`. (*default: ="StdErr"*)

- tstat:

  Name of the t-statistic column in the full summary stats file. This
  column is not necessary unless `stderr="calculate"` or the standard
  error column is missing. (*default: ="t-stat"*)

- Locus:

  Name of the locus column in the full summary stats file. (*default:
  ="Locus"*)

- Freq:

  Name of the allele frequency column in the full summary stats file.
  Effect allele frequency is preferred, but the non-effect allele can be
  provided instead (though this may be less accurate). This column is
  not necessary unless `MAF="calculate"` or the MAF column is missing.
  (*default: ="Freq"*)

- MAF:

  Name of the minor allele frequency column in the full summary stats
  file. Can be inferred from **freq** if missing from the dataset.
  (*default: ="MAF"*)

- A1:

  Name of the effect/risk allele column in the full summary stats.

- A2:

  Name of the other/non-risk allele column in the full summary stats.

- Gene:

  For QTL studies, the name of the \\e\\gene column in the full summary
  stats file (*default: "gene"*). This column will be used for filtering
  summary stats if supplying a named list of gene:Locus pairs to `loci`.

- N_cases:

  The number of case subjects in the study. Instead of providing a
  redundant **N_cases** column, you can simply enter one value here.

- N_controls:

  The number of control subjects in the study. Instead of providing a
  redundant **N_controls** column, you can simply enter one value here.

- proportion_cases:

  The proportion of total subjects in the study that were cases. if
  `proportion_cases="calculate"` then this is inferred:
  `N_controls / N_controls`.

- N:

  Name of the column containing the total sample size.

- verbose:

  Print messages.

## Examples

``` r
colmap <- echodata::construct_colmap(munged=TRUE)
#> Assuming fullSS_path summary stats have already been processed with MungeSumstats.
```
