#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_02_Download GSE126612 CUT&RUN dataset using sra-toolkit
# sra-toolkit usage guideline: https://github.com/ncbi/sra-tools/wiki/08.-prefetch-and-fasterq-dump
##########

# Making output directory to download raw fastq files and save the log file
    mkdir -p ~/Desktop/GSE126612            # Make parent folder to save every output files regarding GSE126612 dataset
    mkdir -p ~/Desktop/GSE126612/log        # Make folder to save log files which can be used to trace back whole analysis procedures
    mkdir -p ~/Desktop/GSE126612/log/fastq  # Make folder to save log files which can be used to trace back downloading fastq files procedure
    mkdir -p ~/Desktop/GSE126612/fastq      # Make folder to download raw fastq files

# Set the path of SRR_list
    # This script uses "~/Desktop/Easy_Shells_CUTnRUN/SRR_list.txt" to address the list of fastq files to download.
    # If you want to use this script to download other fastq files from GEO, please change the SRR numbers within this file.
    # If you want to use Easy_Shells_CUTnRUN pipeline to analyze datasets which are alread existed in your system, just skip this step.
    cd ~/Desktop/Easy_Shells_CUTnRUN/sample_info

# Set the log directory and file names
    # you can change here to use this script to analyze your own dataset
    fastq_dir=~/Desktop/GSE126612/fastq
    SRR_list_dir=~/Desktop/Easy_Shells_CUTnRUN/sample_info
    SRR_list="SRR_list.txt"
    log_dir=~/Desktop/GSE126612/log/fastq
    SRR_list_info="SRR_list_info.txt"
    log_file="download-fastq_log.txt"

# Record information of raw files and download them
    # define working directory to download raw files
    cd $fastq_dir
    vdb-config --prefetch-to-cwd

    # Record information of raw files
    vdb-dump --option-file $SRR_list_dir/$SRR_list --info \
    > $log_dir/$SRR_list_info

    # Download accessions and fastq files
    {
        # Download accessions into current working directory without size limitation
        prefetch --option-file $SRR_list_dir/$SRR_list --max-size u

        # Download fastq files
        while IFS= read -r accession; do fasterq-dump "$accession"; done < $SRR_list_dir/$SRR_list
    } 2>$log_dir/$log_file
