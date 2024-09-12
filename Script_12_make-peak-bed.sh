#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_12_Peak bed file generation
# This script includes two parts: MACS and SEACR. Therefore you may need to check "Set files and directories" for MACS and SEACR independently.
##########
##########
# SEACR
# whole: take column 1, 2, 3, 6
# focused: split column 6
##########
# Make directories for output and log files
    mkdir -p ~/Desktop/GSE126612/peak-bed_SEACR
    mkdir -p ~/Desktop/GSE126612/log
    mkdir -p ~/Desktop/GSE126612/log/peak-bed

# Set log directory and output file
    log_dir=~/Desktop/GSE126612/log/peak-bed
    log_file_SEACR="log_make-peak-bed_SEACR.txt"
    log_file_MACS="log_make-peak-bed_MACS.txt"

# Set current working directory
    cd ~/Desktop/GSE126612/SEACR


# for-loop to create peak bed files
(    for f in *.bed; do

        # Extract base filename without extension
        base=${f%%.bed}

        # Set files and directories for SEACR
        input_dir_SEACR=~/Desktop/GSE126612/SEACR
        input_SEACR="${base}.bed"
        output_dir_SEACR=~/Desktop/GSE126612/peak-bed_SEACR
        output_SEACR_whole="${base}_whole.bed"
        output_SEACR_focused="${base}_focused.bed"

        # Generate SEACR peak bed files
            # for intervene and correlation analysis
            awk '{print $1,$2,$3,$6}' OFS='\t' \
                $input_dir_SEACR/$input_SEACR \
            > $output_dir_SEACR/$output_SEACR_whole

            # for heatmap and average plot
            awk '{split($6,a,":"); print a[1],a[2],$6}' OFS='\t' \
                $input_dir_SEACR/$input_SEACR | \
            awk '{split($2,b,"-"); print $1,b[1],b[2],$3}' OFS='\t' \
            > $output_dir_SEACR/$output_SEACR_focused
    done
) 2>$log_dir/$log_file_SEACR

##########
# MACS2, MACS3
# whole: peaks.xls; remove top 23 and 24 lines for wo-IgG_peaks.xls and w-IgG_peaks.txl; take column 1, 2, 3, 10
# focused: summits.bed; take column 1, 2, 3, and 4
##########
# Make peak bed file output directories
    mkdir -p ~/Desktop/GSE126612/peak-bed_MACS2
    mkdir -p ~/Desktop/GSE126612/peak-bed_MACS3

# Set current working directory
    cd ~/Desktop/GSE126612/MACS2

# for-loop to create peak bed files
(
    for f in *.hg19.canonical.clean.fragments_wo-IgG_peaks.xls; do

        # Extract base filename without extension
        base=${f%%.hg19.canonical.clean.fragments_wo-IgG_peaks.xls}

        # Set files and directories for MACS2 and MACS3
        input_dir_MACS2=~/Desktop/GSE126612/MACS2
        input_dir_MACS3=~/Desktop/GSE126612/MACS3
        input_wo_IgG_whole="${base}.hg19.canonical.clean.fragments_wo-IgG_peaks.xls"
        input_w_IgG_whole="${base}.hg19.canonical.clean.fragments_w-IgG_peaks.xls"
        input_wo_IgG_focused="${base}.hg19.canonical.clean.fragments_wo-IgG_summits.bed"
        input_w_IgG_focused="${base}.hg19.canonical.clean.fragments_w-IgG_summits.bed"

        output_dir_MACS2=~/Desktop/GSE126612/peak-bed_MACS2
        output_dir_MACS3=~/Desktop/GSE126612/peak-bed_MACS3
        output_wo_IgG_whole="${base}.hg19.canonical.clean.fragments_wo-IgG_whole.bed"
        output_w_IgG_whole="${base}.hg19.canonical.clean.fragments_w-IgG_whole.bed"
        output_wo_IgG_focused="${base}.hg19.canonical.clean.fragments_wo-IgG_focused.bed"
        output_w_IgG_focused="${base}.hg19.canonical.clean.fragments_w-IgG_focused.bed"

        # Generate MACS2 peak bed files
            # for intervene and correlation analysis
            tail -n +24 $input_dir_MACS2/$input_wo_IgG_whole | \
            awk '{print $1,$2,$3,$10}' OFS='\t' \
            > $output_dir_MACS2/$output_wo_IgG_whole

            tail -n +25 $input_dir_MACS2/$input_w_IgG_whole | \
            awk '{print $1,$2,$3,$10}' OFS='\t' \
            > $output_dir_MACS2/$output_w_IgG_whole

            # for heatmap and average plot
            awk '{print $1,$2,$3,$4}' OFS='\t' \
                $input_dir_MACS2/$input_wo_IgG_focused \
            > $output_dir_MACS2/$output_wo_IgG_focused

            awk '{print $1,$2,$3,$4}' OFS='\t' \
                $input_dir_MACS2/$input_w_IgG_focused \
            > $output_dir_MACS2/$output_w_IgG_focused

        # Generate MACS3 peak bed files
            # for intervene and correlation analysis
            tail -n +24 $input_dir_MACS3/$input_wo_IgG_whole | \
            awk '{print $1,$2,$3,$10}' OFS='\t' \
            > $output_dir_MACS3/$output_wo_IgG_whole

            tail -n +25 $input_dir_MACS3/$input_w_IgG_whole | \
            awk '{print $1,$2,$3,$10}' OFS='\t' \
            > $output_dir_MACS3/$output_w_IgG_whole

            # for heatmap and average plot
            awk '{print $1,$2,$3,$4}' OFS='\t' \
                $input_dir_MACS3/$input_wo_IgG_focused \
            > $output_dir_MACS3/$output_wo_IgG_focused

            awk '{print $1,$2,$3,$4}' OFS='\t' \
                $input_dir_MACS3/$input_w_IgG_focused \
            > $output_dir_MACS3/$output_w_IgG_focused
    done
) 2>$log_dir/$log_file_MACS
