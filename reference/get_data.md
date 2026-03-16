# Get data

Download remote resources stored on GitHub Releases via piggyback.

## Usage

``` r
get_data(
  fname,
  repo = "RajLabMSSM/echodata",
  save_dir = tools::R_user_dir(package = "echodata", which = "cache"),
  overwrite = FALSE,
  tag = "latest",
  ...
)
```

## Arguments

- fname:

  File name.

- repo:

  GitHub repository name.

- save_dir:

  Local directory to cache data in.

- overwrite:

  Should any local files of the same name be overwritten? default
  `TRUE`.

- tag:

  tag for the GitHub release to which this data should be attached.

- ...:

  Arguments passed on to
  [`piggyback::pb_download`](https://docs.ropensci.org/piggyback/reference/pb_download.html)

  `file`

  :   name or vector of names of files to be downloaded. If `NULL`, all
      assets attached to the release will be downloaded.

  `dest`

  :   name of vector of names of where file should be downloaded. Can be
      a directory or a list of filenames the same length as `file`
      vector. Any directories in the path provided must already exist.

  `ignore`

  :   a list of files to ignore (if downloading "all" because
      `file=NULL`).

  `use_timestamps`

  :   DEPRECATED.

  `show_progress`

  :   logical, show a progress bar be shown for uploading? Defaults to
      `[interactive()]` - can also set globally with
      options("piggyback.verbose")

  `.token`

  :   GitHub authentication token, see `[gh::gh_token()]`

## Examples

``` r
tmp <- get_data(fname = "Kunkle2019.tsv.gz")
```
