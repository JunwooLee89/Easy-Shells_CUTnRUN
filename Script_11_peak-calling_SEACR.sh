#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

###########
# Script_11_peak calling for Easy Shell CUTnRUN
# programs: SEACR
# input files: bedGraph
###########
# Make directories to save SEACR output and log files
    mkdir -p ~/Desktop/GSE126612/SEACR
    mkdir -p ~/Desktop/GSE126612/log
    mkdir -p ~/Desktop/GSE126612/log/SEACR

# Set filtered bedgraph folder as working directory
    cd ~/Desktop/GSE126612/bedGraph 

# for-loop for SEACR peak calling
    for f in *.hg19.canonical.clean.fragments.bedGraph; do

        # Extract base filename without extension
        base=${f%%.hg19.canonical.clean.fragments.bedGraph}

        # Set file names and directories
        bedGraph_dir=~/Desktop/GSE126612/bedGraph
        SEACR_dir=~/Desktop/GSE126612/SEACR
        SEACR_log_dir=~/Desktop/GSE126612/log/SEACR

        actual_sample_raw="${base}.hg19.canonical.clean.fragments.bedGraph"
        actual_sample_SFRC="${base}.hg19.canonical.clean.fragments.SFRC.bedGraph"
        actual_sample_SRPMC="${base}.hg19.canonical.clean.fragments.SRPMC.bedGraph"

        IgG_control_raw="SRR8581615.hg19.canonical.clean.fragments.bedGraph"
        IgG_control_SFRC="SRR8581615.hg19.canonical.clean.fragments.SFRC.bedGraph"
        IgG_control_SRPMC="SRR8581615.hg19.canonical.clean.fragments.SRPMC.bedGraph"

        output_raw_wo_IgG="${base}.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm"
        output_raw_w_IgG="${base}.hg19.canonical.clean.fragments_SEACR-w-IgG-norm"

        output_SFRC_wo_IgG="${base}.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG"
        output_SFRC_w_IgG="${base}.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG"
        
        output_SRPMC_wo_IgG="${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG"
        output_SRPMC_w_IgG="${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG"

        # SEACR peak calling without IgG control, with norm
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_raw \
                0.01 norm stringent \
                $SEACR_dir/$output_raw_wo_IgG
        ) > $SEACR_log_dir/${output_raw_wo_IgG}.stringent.txt
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_raw \
                0.01 norm relaxed \
                $SEACR_dir/$output_raw_wo_IgG
        ) > $SEACR_log_dir/${output_raw_wo_IgG}.relaxed.txt

        # SEACR peak calling without IgG control, without norm, SFRC
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_SFRC \
                0.01 non stringent \
                $SEACR_dir/$output_SFRC_wo_IgG
        ) > $SEACR_log_dir/${output_SFRC_wo_IgG}.stringent.txt
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_SFRC \
                0.01 non relaxed \
                $SEACR_dir/$output_SFRC_wo_IgG
        ) > $SEACR_log_dir/${output_SFRC_wo_IgG}.relaxed.txt

        # SEACR peak calling without IgG control, without norm, SRPMC
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_SRPMC \
                0.01 non stringent \
                $SEACR_dir/$output_SRPMC_wo_IgG
        ) > $SEACR_log_dir/${output_SRPMC_wo_IgG}.stringent.txt
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_SRPMC \
                0.01 non relaxed \
                $SEACR_dir/$output_SRPMC_wo_IgG
        ) > $SEACR_log_dir/${output_SRPMC_wo_IgG}.relaxed.txt

        # SEACR peak calling with IgG control, with norm
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_raw \
                $IgG_control_raw \
                norm stringent \
                $SEACR_dir/$output_raw_w_IgG
        ) > $SEACR_log_dir/${output_raw_w_IgG}.stringent.txt
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_raw \
                $IgG_control_raw \
                norm relaxed \
                $SEACR_dir/$output_raw_w_IgG
        ) > $SEACR_log_dir/${output_raw_w_IgG}.relaxed.txt

        # SEACR peak calling with IgG control, without norm, SFRC
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_SFRC \
                $IgG_control_SFRC \
                non stringent \
                $SEACR_dir/$output_SFRC_w_IgG
        ) > $SEACR_log_dir/${output_SFRC_w_IgG}.stringent.txt
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_SFRC \
                $IgG_control_SFRC \
                non relaxed \
                $SEACR_dir/$output_SFRC_w_IgG
        ) > $SEACR_log_dir/${output_SFRC_w_IgG}.relaxed.txt

        # SEACR peak calling with IgG control, without norm, SRPMC
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_SRPMC \
                $IgG_control_SRPMC \
                non stringent \
                $SEACR_dir/$output_SRPMC_w_IgG
        ) > $SEACR_log_dir/${output_SRPMC_w_IgG}.stringent.txt
        (
            ~/Documents/program/SEACR-1.3/SEACR_1.3.sh \
                $actual_sample_SRPMC \
                $IgG_control_SRPMC \
                non relaxed \
                $SEACR_dir/$output_SRPMC_w_IgG
        ) > $SEACR_log_dir/${output_SRPMC_w_IgG}.relaxed.txt
    done
