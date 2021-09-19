test_that("import_topSNPs works", {
    
    data("topSNPs_Nalls2019_raw")
    top_SNPs <- import_topSNPs(topSS=topSNPs_Nalls2019_raw,
                                chrom_col="CHR",
                                position_col="BP",
                                snp_col="SNP",
                                pval_col="P, all studies",
                                effect_col="Beta, all studies",
                                gene_col="Nearest Gene",
                                locus_col="Nearest Gene",
                                remove_variants="rs34637584")
    testthat::expect_true(methods::is(top_SNPs,"data.table"))
    testthat::expect_gte(nrow(top_SNPs), 90)
})
