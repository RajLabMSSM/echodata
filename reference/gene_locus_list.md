# Generate a named list of (e)Gene-Locus pairs

This object is to be passed to the `loci=` argument in
`echolocatoR::finemap_loci()`.

## Usage

``` r
gene_locus_list(
  loci = NULL,
  topSNPs = NULL,
  drop_missing_loci = TRUE,
  dataset_type = NULL,
  verbose = TRUE
)
```

## Arguments

- loci:

  User-supplied locus list.

- topSNPs:

  Output of the function
  [import_topSNPs](https://rajlabmssm.github.io/echodata/reference/import_topSNPs.md),
  containing the top (index) SNPs per locus.

- drop_missing_loci:

  Drop `loci` that are missing from `topSNPs$Locus`.

- dataset_type:

  The kind dataset you're fine-mapping (e.g. GWAS, eQTL, tQTL).

- verbose:

  Print messages.

## Value

Named list

## Examples

``` r
loci <- gene_locus_list(topSNPs = echodata::topSNPs_Nalls2019,
                        dataset_type = "QTL")
#> WARNING: Dropping 97 loci not present in topSNPs: 
#>  - ASXL3_ASXL3
#>  - BAG3_BAG3
#>  - BIN3_BIN3
#>  - BRIP1_BRIP1
#>  - BST1_BST1
#>  - C5orf24_C5orf24
#>  - CAB39L_CAB39L
#>  - CAMK2D_CAMK2D
#>  - CASC16_CASC16
#>  - CD19_CD19
#>  - CHD9_CHD9
#>  - CHRNB1_CHRNB1
#>  - CLCN3_CLCN3
#>  - CNTN1_CNTN1
#>  - CRHR1_CRHR1
#>  - CRLS1_CRLS1
#>  - CTSB_CTSB
#>  - DDRGK1_DDRGK1
#>  - DLG2_DLG2
#>  - DNAH17_DNAH17
#>  - DYRK1A_DYRK1A
#>  - ELOVL7_ELOVL7
#>  - FAM171A2_FAM171A2
#>  - FAM47E_FAM47E
#>  - FAM47E-STBD1_FAM47E-STBD1
#>  - FAM49B_FAM49B
#>  - FBRSL1_FBRSL1
#>  - FCGR2A_FCGR2A
#>  - FGD4_FGD4
#>  - FGF20_FGF20
#>  - FYN_FYN
#>  - GAK_GAK
#>  - GALC_GALC
#>  - GBAP1_GBAP1
#>  - GBF1_GBF1
#>  - GCH1_GCH1
#>  - GPNMB_GPNMB
#>  - GS1-124K5.11_GS1-124K5.11
#>  - GXYLT1_GXYLT1
#>  - HIP1R_HIP1R
#>  - HLA-DRB5_HLA-DRB5
#>  - IGSF9B_IGSF9B
#>  - INPP5F_INPP5F
#>  - IP6K2_IP6K2
#>  - ITGA8_ITGA8
#>  - ITPKB_ITPKB
#>  - KANSL1_KANSL1
#>  - KCNIP3_KCNIP3
#>  - KCNS3_KCNS3
#>  - KPNA1_KPNA1
#>  - KRTCAP2_KRTCAP2
#>  - LCORL_LCORL
#>  - LINC00693_LINC00693
#>  - LOC100131289_LOC100131289
#>  - LRRK2_LRRK2
#>  - MAP3K14_MAP3K14
#>  - MAP4K4_MAP4K4
#>  - MAPT-AS1_MAPT-AS1
#>  - MBNL2_MBNL2
#>  - MCCC1_MCCC1
#>  - MED12L_MED12L
#>  - MEX3C_MEX3C
#>  - MIPOL1_MIPOL1
#>  - NOD2_NOD2
#>  - NSF_NSF
#>  - NUCKS1_NUCKS1
#>  - PAM_PAM
#>  - PMVK_PMVK
#>  - RAB29_RAB29
#>  - RETREG3_RETREG3
#>  - RIMS1_RIMS1
#>  - RIT2_RIT2
#>  - RNF141_RNF141
#>  - RPS12_RPS12
#>  - RPS6KL1_RPS6KL1
#>  - SATB1_SATB1
#>  - SCAF11_SCAF11
#>  - SCARB2_SCARB2
#>  - SEMA4A_SEMA4A
#>  - SETD1A_SETD1A
#>  - SH3GL2_SH3GL2
#>  - SIPA1L2_SIPA1L2
#>  - SLC44A4_SLC44A4
#>  - SNCA_SNCA
#>  - SPPL2B_SPPL2B
#>  - SPTSSB_SPTSSB
#>  - STK39_STK39
#>  - SYT17_SYT17
#>  - TMEM163_TMEM163
#>  - TMEM175_TMEM175
#>  - TRIM40_TRIM40
#>  - UBAP2_UBAP2
#>  - UBTF_UBTF
#>  - VAMP4_VAMP4
#>  - VPS13C_VPS13C
#>  - WNT3_WNT3
#>  - ZNF608_ZNF608
#> Reassigning gene-specific locus names.
```
