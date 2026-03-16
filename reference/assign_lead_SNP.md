# Assign lead SNP

Assign lead SNP by creating a new boolean column "leadSNP" indicating
whether a SNP has the smallest p-value ("P). If multiple rows have the
same p-value, the one with the largest effective size ("Effect") is used
as the lead SNP.

## Usage

``` r
assign_lead_snp(dat, grouping_vars = "Locus", verbose = TRUE)
```

## Arguments

- dat:

  Fine-mapping data.table.

- grouping_vars:

  Column names to group by.

- verbose:

  Print messages.

## Value

Modified data.table.

## Examples

``` r
dat <- echodata::assign_lead_snp(dat = echodata::BST1)
```
