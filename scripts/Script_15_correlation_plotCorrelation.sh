#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_15_correlation analysis; Deeptools plotCorrelation with Pearson correlation coefficient
# CTCF: SRR8581594, SRR8581590, SRR8581589
# H3K27ac: SRR8581612, SRR8581608, SRR8581607, SRR8581599
# RNAPIIS5P: SRR8581624, SRR8581622, SRR8581618
##########
# Preparation; you can change these to analyze your datasets
    # Set input bam file lists
        # Set current working directory
        cd ~/Desktop/GSE126612/bowtie2-mapped

        # bam file lists of replicates
        CTCF_bam_files=$(ls ./{SRR8581594.hg19.canonical.clean.sort.bam,SRR8581590.hg19.canonical.clean.sort.bam,SRR8581589.hg19.canonical.clean.sort.bam})
        H3K27ac_bam_files=$(ls ./{SRR8581612.hg19.canonical.clean.sort.bam,SRR8581608.hg19.canonical.clean.sort.bam,SRR8581607.hg19.canonical.clean.sort.bam,SRR8581599.hg19.canonical.clean.sort.bam})
        RNAPII_S5P_bam_files=$(ls ./{SRR8581624.hg19.canonical.clean.sort.bam,SRR8581622.hg19.canonical.clean.sort.bam,SRR8581618.hg19.canonical.clean.sort.bam})

    # Set output file names and directories
        # Make output directories
        mkdir -p ~/Desktop/GSE126612/deeptools_multiBamSummary
        mkdir -p ~/Desktop/GSE126612/deeptools_plotCorrelation
        mkdir -p ~/Desktop/GSE126612/log
        mkdir -p ~/Desktop/GSE126612/log/correlation

        # Define file name and directory to save a log for the process
        log_dir=~/Desktop/GSE126612/log/correlation
        log_file="log_plotCorrelation.txt"
        
        # Define directories and bed file names.
        multiBamSummary_dir=~/Desktop/GSE126612/deeptools_multiBamSummary
        plotCorrelation_dir=~/Desktop/GSE126612/deeptools_plotCorrelation
        bed_dir=~/Desktop/GSE126612/bed-for-comparison

        CTCF_MACS2_w_IgG="CTCF_MACS2_w-IgG_whole_merged.bed"
        CTCF_MACS2_wo_IgG="CTCF_MACS2_wo-IgG_whole_merged.bed"
        CTCF_MACS3_w_IgG="CTCF_MACS3_w-IgG_whole_merged.bed"
        CTCF_MACS3_wo_IgG="CTCF_MACS3_wo-IgG_whole_merged.bed"
        CTCF_SEACR_w_IgG_norm_stringent="CTCF_SEACR_w-IgG_norm_stringent_whole_merged.bed"
        CTCF_SEACR_wo_IgG_norm_stringent="CTCF_SEACR_wo-IgG_norm_stringent_whole_merged.bed"
        CTCF_SEACR_w_IgG_norm_relaxed="CTCF_SEACR_w-IgG_norm_relaxed_whole_merged.bed"
        CTCF_SEACR_wo_IgG_norm_relaxed="CTCF_SEACR_wo-IgG_norm_relaxed_whole_merged.bed"

        H3K27ac_MACS2_w_IgG="H3K27ac_MACS2_w-IgG_whole_merged.bed"
        H3K27ac_MACS2_wo_IgG="H3K27ac_MACS2_wo-IgG_whole_merged.bed"
        H3K27ac_MACS3_w_IgG="H3K27ac_MACS3_w-IgG_whole_merged.bed"
        H3K27ac_MACS3_wo_IgG="H3K27ac_MACS3_wo-IgG_whole_merged.bed"
        H3K27ac_SEACR_w_IgG_norm_stringent="H3K27ac_SEACR_w-IgG_norm_stringent_whole_merged.bed"
        H3K27ac_SEACR_wo_IgG_norm_stringent="H3K27ac_SEACR_wo-IgG_norm_stringent_whole_merged.bed"
        H3K27ac_SEACR_w_IgG_norm_relaxed="H3K27ac_SEACR_w-IgG_norm_relaxed_whole_merged.bed"
        H3K27ac_SEACR_wo_IgG_norm_relaxed="H3K27ac_SEACR_wo-IgG_norm_relaxed_whole_merged.bed"

        RNAPII_S5P_MACS2_w_IgG="RNAPII-S5P_MACS2_w-IgG_whole_merged.bed"
        RNAPII_S5P_MACS2_wo_IgG="RNAPII-S5P_MACS2_wo-IgG_whole_merged.bed"
        RNAPII_S5P_MACS3_w_IgG="RNAPII-S5P_MACS3_w-IgG_whole_merged.bed"
        RNAPII_S5P_MACS3_wo_IgG="RNAPII-S5P_MACS3_wo-IgG_whole_merged.bed"
        RNAPII_S5P_SEACR_w_IgG_norm_stringent="RNAPII-S5P_SEACR_w-IgG_norm_stringent_whole_merged.bed"
        RNAPII_S5P_SEACR_wo_IgG_norm_stringent="RNAPII-S5P_SEACR_wo-IgG_norm_stringent_whole_merged.bed"
        RNAPII_S5P_SEACR_w_IgG_norm_relaxed="RNAPII-S5P_SEACR_w-IgG_norm_relaxed_whole_merged.bed"
        RNAPII_S5P_SEACR_wo_IgG_norm_relaxed="RNAPII-S5P_SEACR_wo-IgG_norm_relaxed_whole_merged.bed"

# Run Deeptools
(
    # Print files within each list
    printf "\nCTCF bam files: %s\n" "$CTCF_bam_files"
    printf "\nH3K27Ac bam files: %s\n" "$H3K27ac_bam_files"
    printf "\nRNAPII-S5P bam files: %s\n" "$RNAPII_S5P_bam_files"

    # MACS2 CTCF
    multiBamSummary BED-file \
        -b $CTCF_bam_files \
        --BED $bed_dir/$CTCF_MACS2_w_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/CTCF_MACS2_w_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/CTCF_MACS2_w_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/CTCF_MACS2_w_IgG.pdf \
        -T "$CTCF_MACS2_w_IgG"

    multiBamSummary BED-file \
        -b $CTCF_bam_files \
        --BED $bed_dir/$CTCF_MACS2_wo_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/CTCF_MACS2_wo_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/CTCF_MACS2_wo_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/CTCF_MACS2_wo_IgG.pdf \
        -T "$CTCF_MACS2_wo_IgG"

    # MACS3 CTCF
    multiBamSummary BED-file \
        -b $CTCF_bam_files \
        --BED $bed_dir/$CTCF_MACS3_w_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/CTCF_MACS3_w_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/CTCF_MACS3_w_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/CTCF_MACS3_w_IgG.pdf \
        -T "$CTCF_MACS3_w_IgG"

    multiBamSummary BED-file \
        -b $CTCF_bam_files \
        --BED $bed_dir/$CTCF_MACS3_wo_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/CTCF_MACS3_wo_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/CTCF_MACS3_wo_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/CTCF_MACS3_wo_IgG.pdf \
        -T "$CTCF_MACS3_wo_IgG"

    # SEACR CTCF
    multiBamSummary BED-file \
        -b $CTCF_bam_files \
        --BED $bed_dir/$CTCF_SEACR_w_IgG_norm_stringent \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/CTCF_SEACR_w_IgG_norm_stringent.npz
    plotCorrelation \
        -in $multiBamSummary_dir/CTCF_SEACR_w_IgG_norm_stringent.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/CTCF_SEACR_w_IgG_norm_stringent.pdf \
        -T "$CTCF_SEACR_w_IgG_norm_stringent"
        
    multiBamSummary BED-file \
        -b $CTCF_bam_files \
        --BED $bed_dir/$CTCF_SEACR_wo_IgG_norm_stringent \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/CTCF_SEACR_wo_IgG_norm_stringent.npz
    plotCorrelation \
        -in $multiBamSummary_dir/CTCF_SEACR_wo_IgG_norm_stringent.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/CTCF_SEACR_wo_IgG_norm_stringent.pdf \
        -T "$CTCF_SEACR_wo_IgG_norm_stringent"

    multiBamSummary BED-file \
        -b $CTCF_bam_files \
        --BED $bed_dir/$CTCF_SEACR_w_IgG_norm_relaxed \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/CTCF_SEACR_w_IgG_norm_relaxed.npz
    plotCorrelation \
        -in $multiBamSummary_dir/CTCF_SEACR_w_IgG_norm_relaxed.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/CTCF_SEACR_w_IgG_norm_relaxed.pdf \
        -T "$CTCF_SEACR_w_IgG_norm_relaxed"
        
    multiBamSummary BED-file \
        -b $CTCF_bam_files \
        --BED $bed_dir/$CTCF_SEACR_wo_IgG_norm_relaxed \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/CTCF_SEACR_wo_IgG_norm_relaxed.npz
    plotCorrelation \
        -in $multiBamSummary_dir/CTCF_SEACR_wo_IgG_norm_relaxed.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/CTCF_SEACR_wo_IgG_norm_relaxed.pdf \
        -T "$CTCF_SEACR_wo_IgG_norm_relaxed"

    # MACS2 H3K27ac
    multiBamSummary BED-file \
        -b $H3K27ac_bam_files \
        --BED $bed_dir/$H3K27ac_MACS2_w_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/H3K27ac_MACS2_w_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/H3K27ac_MACS2_w_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/H3K27ac_MACS2_w_IgG.pdf \
        -T "$H3K27ac_MACS2_w_IgG"

    multiBamSummary BED-file \
        -b $H3K27ac_bam_files \
        --BED $bed_dir/$H3K27ac_MACS2_wo_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/H3K27ac_MACS2_wo_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/H3K27ac_MACS2_wo_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/H3K27ac_MACS2_wo_IgG.pdf \
        -T "$H3K27ac_MACS2_wo_IgG"

    # MACS3 H3K27ac
    multiBamSummary BED-file \
        -b $H3K27ac_bam_files \
        --BED $bed_dir/$H3K27ac_MACS3_w_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/H3K27ac_MACS3_w_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/H3K27ac_MACS3_w_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/H3K27ac_MACS3_w_IgG.pdf \
        -T "$H3K27ac_MACS3_w_IgG"

    multiBamSummary BED-file \
        -b $H3K27ac_bam_files \
        --BED $bed_dir/$H3K27ac_MACS3_wo_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/H3K27ac_MACS3_wo_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/H3K27ac_MACS3_wo_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/H3K27ac_MACS3_wo_IgG.pdf \
        -T "$H3K27ac_MACS3_wo_IgG"

    # SEACR H3K27ac
    multiBamSummary BED-file \
        -b $H3K27ac_bam_files \
        --BED $bed_dir/$H3K27ac_SEACR_w_IgG_norm_stringent \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/H3K27ac_SEACR_w_IgG_norm_stringent.npz
    plotCorrelation \
        -in $multiBamSummary_dir/H3K27ac_SEACR_w_IgG_norm_stringent.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/H3K27ac_SEACR_w_IgG_norm_stringent.pdf \
        -T "$H3K27ac_SEACR_w_IgG_norm_stringent"
        
    multiBamSummary BED-file \
        -b $H3K27ac_bam_files \
        --BED $bed_dir/$H3K27ac_SEACR_wo_IgG_norm_stringent \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/H3K27ac_SEACR_wo_IgG_norm_stringent.npz
    plotCorrelation \
        -in $multiBamSummary_dir/H3K27ac_SEACR_wo_IgG_norm_stringent.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/H3K27ac_SEACR_wo_IgG_norm_stringent.pdf \
        -T "$H3K27ac_SEACR_wo_IgG_norm_stringent"

    multiBamSummary BED-file \
        -b $H3K27ac_bam_files \
        --BED $bed_dir/$H3K27ac_SEACR_w_IgG_norm_relaxed \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/H3K27ac_SEACR_w_IgG_norm_relaxed.npz
    plotCorrelation \
        -in $multiBamSummary_dir/H3K27ac_SEACR_w_IgG_norm_relaxed.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/H3K27ac_SEACR_w_IgG_norm_relaxed.pdf \
        -T "$H3K27ac_SEACR_w_IgG_norm_relaxed"
        
    multiBamSummary BED-file \
        -b $H3K27ac_bam_files \
        --BED $bed_dir/$H3K27ac_SEACR_wo_IgG_norm_relaxed \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/H3K27ac_SEACR_wo_IgG_norm_relaxed.npz
    plotCorrelation \
        -in $multiBamSummary_dir/H3K27ac_SEACR_wo_IgG_norm_relaxed.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/H3K27ac_SEACR_wo_IgG_norm_relaxed.pdf \
        -T "$H3K27ac_SEACR_wo_IgG_norm_relaxed"

    # MACS2 RNAPII_S5P
    multiBamSummary BED-file \
        -b $RNAPII_S5P_bam_files \
        --BED $bed_dir/$RNAPII_S5P_MACS2_w_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/RNAPII_S5P_MACS2_w_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/RNAPII_S5P_MACS2_w_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/RNAPII_S5P_MACS2_w_IgG.pdf \
        -T "$RNAPII_S5P_MACS2_w_IgG"

    multiBamSummary BED-file \
        -b $RNAPII_S5P_bam_files \
        --BED $bed_dir/$RNAPII_S5P_MACS2_wo_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/RNAPII_S5P_MACS2_wo_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/RNAPII_S5P_MACS2_wo_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/RNAPII_S5P_MACS2_wo_IgG.pdf \
        -T "$RNAPII_S5P_MACS2_wo_IgG"

    # MACS3 RNAPII_S5P
    multiBamSummary BED-file \
        -b $RNAPII_S5P_bam_files \
        --BED $bed_dir/$RNAPII_S5P_MACS3_w_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/RNAPII_S5P_MACS3_w_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/RNAPII_S5P_MACS3_w_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/RNAPII_S5P_MACS3_w_IgG.pdf \
        -T "$RNAPII_S5P_MACS3_w_IgG"

    multiBamSummary BED-file \
        -b $RNAPII_S5P_bam_files \
        --BED $bed_dir/$RNAPII_S5P_MACS3_wo_IgG \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/RNAPII_S5P_MACS3_wo_IgG.npz
    plotCorrelation \
        -in $multiBamSummary_dir/RNAPII_S5P_MACS3_wo_IgG.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/RNAPII_S5P_MACS3_wo_IgG.pdf \
        -T "$RNAPII_S5P_MACS3_wo_IgG"

    # SEACR RNAPII_S5P
    multiBamSummary BED-file \
        -b $RNAPII_S5P_bam_files \
        --BED $bed_dir/$RNAPII_S5P_SEACR_w_IgG_norm_stringent \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/RNAPII_S5P_SEACR_w_IgG_norm_stringent.npz
    plotCorrelation \
        -in $multiBamSummary_dir/RNAPII_S5P_SEACR_w_IgG_norm_stringent.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/RNAPII_S5P_SEACR_w_IgG_norm_stringent.pdf \
        -T "$RNAPII_S5P_SEACR_w_IgG_norm_stringent"
        
    multiBamSummary BED-file \
        -b $RNAPII_S5P_bam_files \
        --BED $bed_dir/$RNAPII_S5P_SEACR_wo_IgG_norm_stringent \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/RNAPII_S5P_SEACR_wo_IgG_norm_stringent.npz
    plotCorrelation \
        -in $multiBamSummary_dir/RNAPII_S5P_SEACR_wo_IgG_norm_stringent.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/RNAPII_S5P_SEACR_wo_IgG_norm_stringent.pdf \
        -T "$RNAPII_S5P_SEACR_wo_IgG_norm_stringent"

    multiBamSummary BED-file \
        -b $RNAPII_S5P_bam_files \
        --BED $bed_dir/$RNAPII_S5P_SEACR_w_IgG_norm_relaxed \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/RNAPII_S5P_SEACR_w_IgG_norm_relaxed.npz
    plotCorrelation \
        -in $multiBamSummary_dir/RNAPII_S5P_SEACR_w_IgG_norm_relaxed.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/RNAPII_S5P_SEACR_w_IgG_norm_relaxed.pdf \
        -T "$RNAPII_S5P_SEACR_w_IgG_norm_relaxed"
        
    multiBamSummary BED-file \
        -b $RNAPII_S5P_bam_files \
        --BED $bed_dir/$RNAPII_S5P_SEACR_wo_IgG_norm_relaxed \
        -p max/2 --smartLabels \
        -o $multiBamSummary_dir/RNAPII_S5P_SEACR_wo_IgG_norm_relaxed.npz
    plotCorrelation \
        -in $multiBamSummary_dir/RNAPII_S5P_SEACR_wo_IgG_norm_relaxed.npz \
        -c pearson --skipZeros --removeOutliers -p heatmap --plotNumbers \
        -o $plotCorrelation_dir/RNAPII_S5P_SEACR_wo_IgG_norm_relaxed.pdf \
        -T "$RNAPII_S5P_SEACR_wo_IgG_norm_relaxed"
) 2>$log_dir/$log_file
