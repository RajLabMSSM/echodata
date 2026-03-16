# Check if the input is url e.g. http:// or ftp://

Check if the input is url e.g. http:// or ftp://

## Usage

``` r
is_url(path, protocols = c("http", "https", "ftp", "ftps", "fttp", "fttps"))
```

## Source

[Borrowed from `seqminer` internal
function](https://rdrr.io/cran/seqminer/src/R/seqminer.R)

## Arguments

- path:

  Path to local file or remote URL.

- protocols:

  URL protocols to search for.

## Examples

``` r
path <- "https://github.com/RajLabMSSM/echolocatoR/raw/master/NEWS.md"
out <- is_url(path=path)
```
