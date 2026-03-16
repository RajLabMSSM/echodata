# Get sample size

Infer sample size from summary stats using MungeSumstats.

## Usage

``` r
get_sample_size(
  dat,
  compute_n = c("ldsc", "giant", "metal", "sum"),
  return_only = NULL,
  force_new = FALSE,
  standardise_headers = FALSE,
  verbose = TRUE,
  ...
)
```

## Arguments

- dat:

  Fine-mapping results data.

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

- return_only:

  A function to return only a single value from the inferred/imputed
  sample size column (e.g. `max`, `min`).

- force_new:

  If "Neff" (or "N") already exists in `sumstats_dt`, replace it with
  the recomputed version.

- standardise_headers:

  Standardise headers first.

- verbose:

  Print messages.

- ...:

  Additional argument passed to `return_only` function, if `return_only`
  is not `NULL`.

## Examples

``` r
dat <- echodata::BST1
dat2 <- echodata::get_sample_size(dat = dat)
#> Preparing sample size column (N).
#> Computing effective sample size using the LDSC method:
#>  Neff = (N_CAS+N_CON) * (N_CAS/(N_CAS+N_CON)) / mean((N_CAS/(N_CAS+N_CON))[(N_CAS+N_CON)==max(N_CAS+N_CON)]))
#> + Mapping colnames from MungeSumstats ==> echolocatoR
```
