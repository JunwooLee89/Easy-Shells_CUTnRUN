#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_14_bedtools merge peaks for correlation analysis, MACS
# IgG sample: SRR8581615
# CTCF: SRR8581594, SRR8581590, SRR8581589
# H3K27ac: SRR8581612, SRR8581608, SRR8581607, SRR8581599
# RNAPIIS5P: SRR8581624, SRR8581622, SRR8581618
##########
# Make output directories to save output and log
mkdir -p ~/Desktop/GSE126612/bed-for-comparison
mkdir -p ~/Desktop/GSE126612/log
mkdir -p ~/Desktop/GSE126612/log/cat-merged-peak-bed

# Define file name and directory to save a log for the process
log_dir=~/Desktop/GSE126612/log/cat-merged-peak-bed
log_file="log_cat-merged-peak-bed_MACS.txt"

# Run to cat and merge peak bed files
(
    # MACS2, with IgG, whole
    # CTCF peaks
    cat ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581594.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581590.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581589.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS2_w-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS2_w-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS2_w-IgG_whole_merged.bed

    # H3K27Ac peaks
    cat ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581599.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581607.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581608.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581612.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS2_w-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS2_w-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS2_w-IgG_whole_merged.bed

    # RNAPII-S5P peaks
    cat ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581618.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581622.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581624.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS2_w-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS2_w-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS2_w-IgG_whole_merged.bed

    # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
    cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS2_w-IgG_whole_merged.bed \
        ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS2_w-IgG_whole_merged.bed \
        ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS2_w-IgG_whole_merged.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_MACS2_w-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_MACS2_w-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/all_MACS2_w-IgG_whole_merged.bed


    # MACS2, without IgG, whole
    # CTCF peaks
    cat ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581594.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581590.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581589.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS2_wo-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS2_wo-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS2_wo-IgG_whole_merged.bed

    # H3K27Ac peaks
    cat ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581599.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581607.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581608.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581612.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS2_wo-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS2_wo-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS2_wo-IgG_whole_merged.bed

    # RNAPII-S5P peaks
    cat ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581618.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581622.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581624.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS2_wo-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS2_wo-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS2_wo-IgG_whole_merged.bed

    # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
    cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS2_wo-IgG_whole_merged.bed \
        ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS2_wo-IgG_whole_merged.bed \
        ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS2_wo-IgG_whole_merged.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_MACS2_wo-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_MACS2_wo-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/all_MACS2_wo-IgG_whole_merged.bed


    # MACS3, with IgG, whole
    # CTCF peaks
    cat ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581594.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581590.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581589.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS3_w-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS3_w-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS3_w-IgG_whole_merged.bed

    # H3K27Ac peaks
    cat ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581599.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581607.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581608.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581612.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS3_w-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS3_w-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS3_w-IgG_whole_merged.bed

    # RNAPII-S5P peaks
    cat ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581618.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581622.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581624.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS3_w-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS3_w-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS3_w-IgG_whole_merged.bed

    # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
    cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS3_w-IgG_whole_merged.bed \
        ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS3_w-IgG_whole_merged.bed \
        ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS3_w-IgG_whole_merged.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_MACS3_w-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_MACS3_w-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/all_MACS3_w-IgG_whole_merged.bed


    # MACS3, without IgG, whole
    # CTCF peaks
    cat ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581594.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581590.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581589.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS3_wo-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS3_wo-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS3_wo-IgG_whole_merged.bed

    # H3K27Ac peaks
    cat ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581599.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581607.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581608.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581612.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS3_wo-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS3_wo-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS3_wo-IgG_whole_merged.bed

    # RNAPII-S5P peaks
    cat ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581618.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581622.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581624.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS3_wo-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS3_wo-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS3_wo-IgG_whole_merged.bed

    # Merge CTCF, H3K27Ac, RNAPII-S5P peaks
    cat ~/Desktop/GSE126612/bed-for-comparison/CTCF_MACS3_wo-IgG_whole_merged.bed \
        ~/Desktop/GSE126612/bed-for-comparison/H3K27ac_MACS3_wo-IgG_whole_merged.bed \
        ~/Desktop/GSE126612/bed-for-comparison/RNAPII-S5P_MACS3_wo-IgG_whole_merged.bed \
        | sort -k1,1 -k2,2n > ~/Desktop/GSE126612/bed-for-comparison/all_MACS3_wo-IgG_whole_cat.bed
    bedtools merge -i ~/Desktop/GSE126612/bed-for-comparison/all_MACS3_wo-IgG_whole_cat.bed \
        > ~/Desktop/GSE126612/bed-for-comparison/all_MACS3_wo-IgG_whole_merged.bed
) 2>$log_dir/$log_file
