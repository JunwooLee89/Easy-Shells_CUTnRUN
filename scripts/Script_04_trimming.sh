#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_04_Quality and adapter trimming using trim_galore
# Trim_galore reference
    # https://github.com/FelixKrueger/TrimGalore
    # https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/
##########
# Make output directory to save trimmed fastq files and log of trim_galore. You can change the paths to meet your requirement. 
mkdir -p ~/Desktop/GSE126612/trimmed
mkdir -p ~/Desktop/GSE126612/log
mkdir -p ~/Desktop/GSE126612/log/trim_galore

# Set "~/Desktop/GSE126612/fastq" as current working directory. You can change here to meet your requirement. 
cd ~/Desktop/GSE126612/fastq

# for-loop to run trim_galore
for f in *_1.fastq; do

    # Extract base filename without extension
    base=${f%%_1.fastq}

    # Set directories and file names; you can change here to analyze your own dataset.
    fastq_dir=~/Desktop/GSE126612/fastq
    read1="${base}_1.fastq"
    read2="${base}_2.fastq"
    trimmed_dir=~/Desktop/GSE126612/trimmed     
    log_dir=~/Desktop/GSE126612/log/trim_galore
    log_file="trim_galore_log_${base}.txt"
    
    # trim-galore
    (
        trim_galore \
            --paired --fastqc --cores 4 \
            -o $trimmed_dir \
            $fastq_dir/$read1 $fastq_dir/$read2
    ) 2>$log_dir/$log_file
done
