# Standardize the locus subset

After querying a subset of the full summary statistics, this function
converts it into a standardized format that the rest of *echolocatoR*
can work with.

## Usage

``` r
standardize(
  query,
  subset_path = NULL,
  locus = NULL,
  colmap = construct_colmap(),
  compute_n = "ldsc",
  return_dt = TRUE,
  nThread = 1,
  verbose = TRUE
)
```

## Arguments

- query:

  data.frame of summary stat.

- subset_path:

  Path where the `query` should be saved after standardization.

- locus:

  Locus name.

- colmap:

  Column mapping object created using
  [construct_colmap](https://rajlabmssm.github.io/echodata/reference/construct_colmap.md).

- compute_n:

  How to compute per-SNP sample size (new column "N").\
  If the column "N" is already present in `dat`, this column will be
  used to extract per-SNP sample sizes and the argument `compute_n` will
  be ignored.\
  If the column "N" is *not* present in `dat`, one of the following
  options can be supplied to `compute_n`:

  `0`

  :   N will not be computed.

  `>0`

  :   If any number \>0 is provided, that value will be set as N for
      every row. \*\*Note\*\*: Computing N this way is incorrect and
      should be avoided if at all possible.

  `"sum"`

  :   N will be computed as: cases (N_CAS) + controls (N_CON), so long
      as both columns are present.

  `"ldsc"`

  :   N will be computed as effective sample size: Neff
      =(N_CAS+N_CON)\*(N_CAS/(N_CAS+N_CON)) /
      mean((N_CAS/(N_CAS+N_CON))(N_CAS+N_CON)==max(N_CAS+N_CON)).

  `"giant"`

  :   N will be computed as effective sample size: Neff = 2 / (1/N_CAS +
      1/N_CON).

  `"metal"`

  :   N will be computed as effective sample size: Neff = 4 / (1/N_CAS +
      1/N_CON).

- return_dt:

  Return data.table or path to saved data.table.

- nThread:

  Number of threads to parallelise saving across.

- verbose:

  Print messages.

## Examples

``` r
query <- echodata::BST1
#### Screw up data
query$rsid <- query$SNP
query <- query[,-c("MAF","SNP")]
query[c(10,30,55),"Freq"] <- 0
query[c(12,22),"Freq"] <- NA 
subset_path <- file.path(tempdir(),"BST1.tsv")
colmap = construct_colmap(SNP="rsid")
query2 <- echodata::standardize(query = query,
                                subset_path = subset_path,
                                locus = "BST1",
                                colmap = colmap)
#> Standardizing summary statistics subset.
#> Standardizing main column names.
#> ++ Preparing A1,A1 cols
#> ++ Preparing MAF,Freq cols.
#> ++ Inferring MAF from frequency column.
#> ++ Removing SNPs with MAF== 0 | NULL | NA or >1.
#> ++ Preparing N_cases,N_controls cols.
#> ++ Preparing proportion_cases col.
#> ++ Calculating proportion_cases from N_cases and N_controls.
#> Preparing sample size column (N).
#> Computing effective sample size using the LDSC method:
#>  Neff = (N_CAS+N_CON) * (N_CAS/(N_CAS+N_CON)) / mean((N_CAS/(N_CAS+N_CON))[(N_CAS+N_CON)==max(N_CAS+N_CON)]))
#> + Mapping colnames from MungeSumstats ==> echolocatoR
#> + Imputing t-statistic from Effect and StdErr.
#> ++ Ensuring Effect,StdErr,P are numeric.
#> ++ Ensuring 1 SNP per row and per genomic coordinate.
#> ++ Removing extra whitespace
#> + Standardized query: 6,211 SNPs x 28 columns.
#> ++ Saving standardized query ==> /tmp/RtmpIRVypB/BST1.tsv
```
