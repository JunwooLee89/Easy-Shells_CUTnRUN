#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

###########
# Script_11_peak calling for Easy Shell CUTnRUN
# programs: MACS2, MACS3
# input files: clean BEDPE (for MACS2, MACS3)
###########
# Make output directory for peak calling output and log files
    mkdir -p ~/Desktop/GSE126612/MACS2
    mkdir -p ~/Desktop/GSE126612/MACS3
    mkdir -p ~/Desktop/GSE126612/log/
    mkdir -p ~/Desktop/GSE126612/log/MACS2
    mkdir -p ~/Desktop/GSE126612/log/MACS3

# Set filtered BEDPE folder as working directory
    cd ~/Desktop/GSE126612/BEDPE

# for-loop for MACS2 and MACS3
    for f in *.hg19.canonical.clean.fragments.bed; do

        # Extract base filename without extension
        base=${f%%.hg19.canonical.clean.fragments.bed}
        
        # Set file names and directories
        BEDPE_dir=~/Desktop/GSE126612/BEDPE
        actual_sample="${base}.hg19.canonical.clean.fragments.bed"
        IgG_control="SRR8581615.hg19.canonical.clean.fragments.bed"
        
        output_wo_IgG="${base}.hg19.canonical.clean.fragments_wo-IgG.txt"
        output_w_IgG="${base}.hg19.canonical.clean.fragments_w-IgG.txt"

        MACS2_dir=~/Desktop/GSE126612/MACS2
        MACS3_dir=~/Desktop/GSE126612/MACS3

        MACS2_log_dir=~/Desktop/GSE126612/log/MACS2
        MACS3_log_dir=~/Desktop/GSE126612/log/MACS3        

        # Set current working directory again
        cd $BEDPE_dir
        
        # Call peaks using MACS2 without IgG
        (
            macs2 callpeak \
                -t $actual_sample \
                -f BEDPE -g hs --keep-dup all -p 1e-5 --SPMR \
                --outdir $MACS2_dir \
                -n $output_wo_IgG
        ) 2>$MACS2_log_dir/$output_wo_IgG
        
        # Call peaks using MACS2 with IgG
        (
            macs2 callpeak \
                -t $actual_sample \
                -c $IgG_control \
                -f BEDPE -g hs --keep-dup all -p 1e-5 --SPMR \
                --outdir $MACS2_dir \
                -n $output_w_IgG
        ) 2>$MACS2_log_dir/$output_w_IgG
        
        # Call peaks using MACS3 without IgG
        (
            macs3 callpeak \
                -t $actual_sample \
                -f BEDPE -g hs --keep-dup all -p 1e-5 --SPMR \
                --outdir $MACS3_dir \
                -n $output_wo_IgG
        ) 2>$MACS3_log_dir/$output_wo_IgG

        # Call peaks using MACS3 with IgG
        (
            macs3 callpeak \
            -t $actual_sample \
            -c $IgG_control \
            -f BEDPE -g hs --keep-dup all -p 1e-5 --SPMR \
            --outdir $MACS3_dir \
            -n $output_w_IgG
        ) 2>$MACS3_log_dir/$output_w_IgG
    done
