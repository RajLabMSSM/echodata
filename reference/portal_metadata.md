# Import metadata

Import metadata for all fine-mapping results files stored on the
[echolocatoR Fine-mapping
Portal](https://github.com/RajLabMSSM/Fine_Mapping_Shiny).

## Usage

``` r
portal_metadata(verbose = TRUE, timeout = 60)
```

## Arguments

- verbose:

  Print messages.

- timeout:

  Number of seconds before timeout.

## Examples

``` r
meta <- portal_metadata()
#> Fetching echolocatoR Fine-mapping Portal study metadata.
```
