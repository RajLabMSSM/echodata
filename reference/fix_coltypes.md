# Automatically fix column types

Sometimes things that should be numbers get interpreted as strings (e.g.
1 vs. "1"). This function automatically inferred the best match for each
column and reformats its column type accordingly.

## Usage

``` r
fix_coltypes(dat)
```

## Arguments

- dat:

  A data.frame.

## Value

A fixed data.frame

## Examples

``` r
dat <- mtcars
dat$cyl <- as.character(dat$cyl)
dat$wt <- as.character(dat$wt)
dat$drat <- as.factor(dat$drat)

dat2 <- fix_coltypes(dat=dat)
```
