#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_14_bedtools merge peaks for correlation analysis, SEACR
# IgG sample: SRR8581615
# CTCF: SRR8581594, SRR8581590, SRR8581589
# H3K27ac: SRR8581612, SRR8581608, SRR8581607, SRR8581599
# RNAPIIS5P: SRR8581624, SRR8581622, SRR8581618
##########
# Make output directory for merged peak bed files
mkdir -p ~/Desktop/GSE126612/bed-for-comparison
mkdir -p ~/Desktop/GSE126612/log
mkdir -p ~/Desktop/GSE126612/log/cat-merged-peak-bed

# Define file name and directory to save a log for the process
log_dir=~/Desktop/GSE126612/log/cat-merged-peak-bed
log_file="log_cat-merged-peak-bed_SEACR.txt"

# Run to cat and merge peak bed files
(
    # SEACR, with IgG, norm, stringent, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_norm_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_norm_stringent_whole_merged.bed

        # H3K27ac peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_norm_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_norm_stringent_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_norm_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_norm_stringent_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_norm_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_norm_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_norm_stringent_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_norm_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_norm_stringent_whole_merged.bed


    # SEACR, with IgG, SFRC, stringent, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SFRC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SFRC_stringent_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SFRC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SFRC_stringent_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SFRC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SFRC_stringent_whole_merged.bed

        # Merge CTCF, H3K27Ac and RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SFRC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SFRC_stringent_whole_merged.bed


    # SEACR, with IgG, SRPMC, stringent, whole
        #CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SRPMC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed


    # SEACR, with IgG, norm, relaxed, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_norm_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_norm_relaxed_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_norm_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_norm_relaxed_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_norm_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_norm_relaxed_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_norm_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_norm_relaxed_whole_merged.bed


    # SEACR, with IgG, SFRC, relaxed, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed
        
        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SFRC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed
        

    # SEACR, with IgG, SRPMC, relaxed, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SRPMC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed


    # SEACR, without IgG, norm, stringent, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_norm_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_norm_stringent_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_norm_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_norm_stringent_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_norm_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_norm_stringent_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_norm_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_norm_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_norm_stringent_whole_merged.bed


    # SEACR, without IgG, SFRC, stringent, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SFRC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed


    # SEACR, without IgG, SRPMC, stringent, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_stringent_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed


    # SEACR, without IgG, norm, relaxed, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_norm_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_norm_relaxed_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_norm_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_norm_relaxed_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_norm_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_norm_relaxed_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_norm_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_norm_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_norm_relaxed_whole_merged.bed


    # SEACR, without IgG, SFRC, relaxed, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SFRC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed


    # SEACR, without IgG, SRPMC, relaxed, whole
        # CTCF peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed

        # H3K27Ac peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed

        # RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed

        # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
        cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
            ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
            | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed
        bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_relaxed_whole_cat.bed \
            > ~/Desktop/GSE126612/bed-for-comparison/all_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed
) 2>$log_dir/$log_file
