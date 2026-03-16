# Read in top SNPs

Read in topSNPs (from disk).

## Usage

``` r
topSNPs_reader(topSS, sheet = 1, startRow = 1, cols, ...)
```

## Arguments

- sheet:

  The name or index of the sheet to read data from.

- startRow:

  first row to begin looking for data. Empty rows at the top of a file
  are always skipped, regardless of the value of startRow.

- cols:

  A numeric vector specifying which columns in the Excel file to read.
  If NULL, all columns are read.

- ...:

  Arguments passed on to
  [`openxlsx::read.xlsx`](https://rdrr.io/pkg/openxlsx/man/read.xlsx.html)

  `xlsxFile`

  :   An xlsx file, Workbook object or URL to xlsx file.

  `colNames`

  :   If `TRUE`, the first row of data will be used as column names.

  `rowNames`

  :   If `TRUE`, first column of data will be used as row names.

  `detectDates`

  :   If `TRUE`, attempt to recognise dates and perform conversion.

  `skipEmptyRows`

  :   If `TRUE`, empty rows are skipped else empty rows after the first
      row containing data will return a row of NAs.

  `skipEmptyCols`

  :   If `TRUE`, empty columns are skipped.

  `rows`

  :   A numeric vector specifying which rows in the Excel file to read.
      If NULL, all rows are read.

  `check.names`

  :   logical. If TRUE then the names of the variables in the data frame
      are checked to ensure that they are syntactically valid variable
      names

  `sep.names`

  :   One character which substitutes blanks in column names. By
      default, "."

  `namedRegion`

  :   A named region in the Workbook. If not NULL startRow, rows and
      cols parameters are ignored.

  `na.strings`

  :   A character vector of strings which are to be interpreted as NA.
      Blank cells will be returned as NA.

  `fillMergedCells`

  :   If TRUE, the value in a merged cell is given to all cells within
      the merge.
