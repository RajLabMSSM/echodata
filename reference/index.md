# Package index

## Data access

Download and access example GWAS summary statistics and portal data.

- [`get_data()`](https://rajlabmssm.github.io/echodata/reference/get_data.md)
  : Get data

- [`get_Nalls2019()`](https://rajlabmssm.github.io/echodata/reference/get_Nalls2019.md)
  : Example GWAS summary statistics: Nalls2019

- [`get_Nalls2019_loci()`](https://rajlabmssm.github.io/echodata/reference/get_Nalls2019_loci.md)
  :

  echolocatoR output example: select loci

- [`get_Nalls2019_merged()`](https://rajlabmssm.github.io/echodata/reference/get_Nalls2019_merged.md)
  :

  echolocatoR output example: all loci

- [`get_Nalls2019_coloc()`](https://rajlabmssm.github.io/echodata/reference/get_Nalls2019_coloc.md)
  : Get colocalization results with Nalls2019 GWAS

- [`get_Kunkle2019()`](https://rajlabmssm.github.io/echodata/reference/get_Kunkle2019.md)
  : Example GWAS summary statistics: Kunkle2019

- [`get_Kunkle2019_coloc()`](https://rajlabmssm.github.io/echodata/reference/get_Kunkle2019_coloc.md)
  : Get colocalization results with Kunkle2019 GWAS

- [`example_fullSS()`](https://rajlabmssm.github.io/echodata/reference/example_fullSS.md)
  :

  Store `fullSS_dat`

- [`portal_metadata()`](https://rajlabmssm.github.io/echodata/reference/portal_metadata.md)
  : Import metadata

- [`portal_query()`](https://rajlabmssm.github.io/echodata/reference/portal_query.md)
  : Search and download fine-mapping files

## Data processing

Standardize, format, and import summary statistics.

- [`standardize()`](https://rajlabmssm.github.io/echodata/reference/standardize.md)
  : Standardize the locus subset

- [`standardize_gene()`](https://rajlabmssm.github.io/echodata/reference/standardize_gene.md)
  : Standardize genes

- [`construct_colmap()`](https://rajlabmssm.github.io/echodata/reference/construct_colmap.md)
  : Target column map

- [`column_dictionary()`](https://rajlabmssm.github.io/echodata/reference/column_dictionary.md)
  : Map column names to positions.

- [`import_topSNPs()`](https://rajlabmssm.github.io/echodata/reference/import_topSNPs.md)
  : Import top GWAS/QTL summary statistics

- [`mungesumstats_to_echolocatoR()`](https://rajlabmssm.github.io/echodata/reference/mungesumstats_to_echolocatoR.md)
  :

  Convert from MungeSumstats to echolocatoR format

- [`extract_loci()`](https://rajlabmssm.github.io/echodata/reference/extract_loci.md)
  : Extract loci from GWAS/QTL summary statistics

- [`fix_coltypes()`](https://rajlabmssm.github.io/echodata/reference/fix_coltypes.md)
  : Automatically fix column types

- [`update_cols()`](https://rajlabmssm.github.io/echodata/reference/update_cols.md)
  : Update CS cols

- [`get_header()`](https://rajlabmssm.github.io/echodata/reference/get_header.md)
  : Get file header

- [`get_nrows()`](https://rajlabmssm.github.io/echodata/reference/get_nrows.md)
  : Get nrows

- [`get_sample_size()`](https://rajlabmssm.github.io/echodata/reference/get_sample_size.md)
  : Get sample size

- [`coords_to_rsids()`](https://rajlabmssm.github.io/echodata/reference/coords_to_rsids.md)
  : Get RSIDS from SNP coordinates

## Fine-mapping results

Process, merge, and summarize fine-mapping results.

- [`find_consensus_snps()`](https://rajlabmssm.github.io/echodata/reference/find_consensus_snps.md)
  : Find Consensus SNPs
- [`find_consensus_snps_no_polyfun()`](https://rajlabmssm.github.io/echodata/reference/find_consensus_snps_no_polyfun.md)
  : Find Consensus SNPs: without PolyFun
- [`find_top_consensus()`](https://rajlabmssm.github.io/echodata/reference/find_top_consensus.md)
  : Find the top Consensus SNP
- [`merge_finemapping_results()`](https://rajlabmssm.github.io/echodata/reference/merge_finemapping_results.md)
  : Merge fine-mapping results from all loci
- [`melt_finemapping_results()`](https://rajlabmssm.github.io/echodata/reference/melt_finemapping_results.md)
  : Melt fine-mapping results
- [`results_report()`](https://rajlabmssm.github.io/echodata/reference/results_report.md)
  : Results report
- [`fillNA_CS_PP()`](https://rajlabmssm.github.io/echodata/reference/fillNA_CS_PP.md)
  : Fill NAs in PP and CS columns
- [`get_CS_bins()`](https://rajlabmssm.github.io/echodata/reference/get_CS_bins.md)
  : Get Credible Set bins
- [`get_CS_counts()`](https://rajlabmssm.github.io/echodata/reference/get_CS_counts.md)
  : Get Credible Set SNP counts
- [`get_SNPgroup_counts()`](https://rajlabmssm.github.io/echodata/reference/get_SNPgroup_counts.md)
  : Get SNP group counts
- [`filter_snps()`](https://rajlabmssm.github.io/echodata/reference/filter_snps.md)
  : Filter SNPs
- [`limit_snps()`](https://rajlabmssm.github.io/echodata/reference/limit_snps.md)
  : Limit the number of SNPs per locus.
- [`snp_group_filters()`](https://rajlabmssm.github.io/echodata/reference/snp_group_filters.md)
  : Get SNP group filters
- [`snp_group_colorDict()`](https://rajlabmssm.github.io/echodata/reference/snp_group_colorDict.md)
  : Assign colors to each SNP group
- [`assign_lead_snp()`](https://rajlabmssm.github.io/echodata/reference/assign_lead_SNP.md)
  : Assign lead SNP
- [`reassign_lead_snps()`](https://rajlabmssm.github.io/echodata/reference/reassign_lead_snps.md)
  : Reassign lead SNPs

## Utilities

General-purpose helper functions.

- [`is_granges()`](https://rajlabmssm.github.io/echodata/reference/is_granges.md)
  : Is an object of class GRanges

- [`is_empty()`](https://rajlabmssm.github.io/echodata/reference/is_empty.md)
  : Check if a file is empty

- [`is_ggbio()`](https://rajlabmssm.github.io/echodata/reference/is_ggbio.md)
  : Is an object of class ggbio

- [`is_ggplot()`](https://rajlabmssm.github.io/echodata/reference/is_ggplot.md)
  : Is an object of class ggplot

- [`is_local()`](https://rajlabmssm.github.io/echodata/reference/is_local.md)
  : Is local

- [`is_url()`](https://rajlabmssm.github.io/echodata/reference/is_url.md)
  : Check if the input is url e.g. http:// or ftp://

- [`dt_to_granges()`](https://rajlabmssm.github.io/echodata/reference/dt_to_granges.md)
  : Convert data.table to GRanges object

- [`granges_to_bed()`](https://rajlabmssm.github.io/echodata/reference/granges_to_bed.md)
  : Convert from GRanges to BED format

- [`merge_robust()`](https://rajlabmssm.github.io/echodata/reference/merge_robust.md)
  : Merge robust

- [`unlist_dt()`](https://rajlabmssm.github.io/echodata/reference/unlist_dt.md)
  :

  Unlist a
  [data.table](https://rdrr.io/pkg/data.table/man/data.table.html)

- [`createDT()`](https://rajlabmssm.github.io/echodata/reference/createDT.md)
  : Interactive DT

- [`preview()`](https://rajlabmssm.github.io/echodata/reference/preview.md)
  : Preview formatted sum stats saved to disk

- [`detect_genes()`](https://rajlabmssm.github.io/echodata/reference/detect_genes.md)
  : Detect QTL genes in full summary stats file

- [`gene_locus_list()`](https://rajlabmssm.github.io/echodata/reference/gene_locus_list.md)
  : Generate a named list of (e)Gene-Locus pairs

- [`order_loci()`](https://rajlabmssm.github.io/echodata/reference/order_loci.md)
  : Order loci

- [`get_os()`](https://rajlabmssm.github.io/echodata/reference/get_os.md)
  : Get OS

- [`set_permissions()`](https://rajlabmssm.github.io/echodata/reference/set_permissions.md)
  : Set permissions

- [`read_parquet()`](https://rajlabmssm.github.io/echodata/reference/read_parquet.md)
  : Read parquet file

- [`write_parquet()`](https://rajlabmssm.github.io/echodata/reference/write_parquet.md)
  : Write parquet file

## Bundled datasets

Pre-computed example datasets included with the package.

- [`BST1`](https://rajlabmssm.github.io/echodata/reference/BST1.md) :

  echolocatoR output example: BST1 locus

- [`LRRK2`](https://rajlabmssm.github.io/echodata/reference/LRRK2.md) :

  echolocatoR output example: LRRK2 locus

- [`MEX3C`](https://rajlabmssm.github.io/echodata/reference/MEX3C.md) :

  echolocatoR output example: MEX3C locus

- [`BST1_LD_matrix`](https://rajlabmssm.github.io/echodata/reference/BST1_LD_matrix.md)
  : LD with the lead SNP: BST1 locus

- [`topSNPs_Nalls2019`](https://rajlabmssm.github.io/echodata/reference/topSNPs_Nalls2019.md)
  : TopSS example file (processed): Nalls2019

- [`topSNPs_Nalls2019_raw`](https://rajlabmssm.github.io/echodata/reference/topSNPs_Nalls2019_raw.md)
  : TopSS example file: Nalls2019

- [`topSNPs_Kunkle2019`](https://rajlabmssm.github.io/echodata/reference/topSNPs_Kunkle2019.md)
  : TopSS example file (processed): Kunkle2019

- [`locus_dir`](https://rajlabmssm.github.io/echodata/reference/locus_dir.md)
  :

  Example results path for `Nall2019` BST1 locus

- [`genome_wide_dir`](https://rajlabmssm.github.io/echodata/reference/genome_wide_dir.md)
  : Example results path for genome-wide results

- [`sumstatsColHeaders`](https://rajlabmssm.github.io/echodata/reference/sumstatsColHeaders.md)
  :

  `sumstatsColHeaders` from MungeSumstats

## Other

- [`R.utils`](https://rajlabmssm.github.io/echodata/reference/R.utils.md)
  : R.utils
