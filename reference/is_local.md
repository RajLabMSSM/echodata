# Is local

Determine whether a file exist locally.

## Usage

``` r
is_local(path, protocols = c("http", "https", "ftp", "ftps", "fttp", "fttps"))
```

## Arguments

- path:

  Path to local file or remote URL.

- protocols:

  URL protocols to search for.

## Examples

``` r
echodata::is_local(
    path="https://github.com/RajLabMSSM/echotabix/raw/main/README.md"
)
#> [1] FALSE
```
