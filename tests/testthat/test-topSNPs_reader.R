test_that("topSNPs_reader returns data.frame when given a data.frame", {

    input_df <- data.frame(
        SNP = c("rs1", "rs2"),
        CHR = c(1, 2),
        POS = c(100, 200),
        check.names = FALSE
    )

    res <- echodata:::topSNPs_reader(topSS = input_df, cols = NULL)

    testthat::expect_s3_class(res, "data.frame")
    testthat::expect_equal(nrow(res), 2)
    testthat::expect_equal(res$SNP, c("rs1", "rs2"))
})

test_that("topSNPs_reader reads a CSV file via data.table::fread", {

    tmp <- tempfile(fileext = ".csv")
    on.exit(unlink(tmp), add = TRUE)

    dat <- data.frame(
        SNP = c("rs10", "rs20", "rs30"),
        CHR = c(1, 2, 3),
        POS = c(1000, 2000, 3000),
        P = c(1e-8, 1e-6, 1e-4)
    )
    data.table::fwrite(dat, tmp)

    res <- echodata:::topSNPs_reader(topSS = tmp, cols = NULL)

    testthat::expect_s3_class(res, "data.frame")
    testthat::expect_equal(nrow(res), 3)
    testthat::expect_true("SNP" %in% colnames(res))
})

test_that("topSNPs_reader reads TSV file", {

    tmp <- tempfile(fileext = ".tsv")
    on.exit(unlink(tmp), add = TRUE)

    dat <- echodata::topSNPs_Nalls2019[seq_len(5), ]
    data.table::fwrite(dat, tmp, sep = "\t")

    res <- echodata:::topSNPs_reader(topSS = tmp, cols = NULL)

    testthat::expect_s3_class(res, "data.frame")
    testthat::expect_equal(nrow(res), 5)
    testthat::expect_true(all(c("SNP", "CHR", "POS") %in% colnames(res)))
})

test_that("topSNPs_reader respects startRow argument", {

    tmp <- tempfile(fileext = ".csv")
    on.exit(unlink(tmp), add = TRUE)

    dat <- data.frame(
        SNP = c("rs10", "rs20", "rs30"),
        CHR = c(1, 2, 3),
        POS = c(1000, 2000, 3000)
    )
    data.table::fwrite(dat, tmp)

    ## startRow=1 means the header row -> should read all data
    res1 <- echodata:::topSNPs_reader(topSS = tmp, cols = NULL,
                                      startRow = 1)
    testthat::expect_equal(nrow(res1), 3)

    ## startRow=2 skips the header, so the first data row becomes
    ## the header and we lose one row of data
    res2 <- echodata:::topSNPs_reader(topSS = tmp, cols = NULL,
                                      startRow = 2)
    testthat::expect_equal(nrow(res2), 2)
})

test_that("topSNPs_reader handles xlsx files", {

    testthat::skip_if_not_installed("openxlsx")

    tmp <- tempfile(fileext = ".xlsx")
    on.exit(unlink(tmp), add = TRUE)

    dat <- data.frame(
        SNP = c("rs10", "rs20"),
        CHR = c(1, 2),
        POS = c(1000, 2000)
    )
    openxlsx::write.xlsx(dat, tmp)

    res <- echodata:::topSNPs_reader(topSS = tmp, cols = NULL)

    testthat::expect_s3_class(res, "data.frame")
    testthat::expect_equal(nrow(res), 2)
    testthat::expect_true("SNP" %in% colnames(res))
})
