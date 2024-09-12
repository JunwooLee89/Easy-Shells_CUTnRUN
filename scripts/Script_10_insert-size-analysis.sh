#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

###########
# Script_10_Insert size distribution analysis
# This script was wrote to use picard.jar downloaded in "~/Document/program/picard" folder.
# picard.jar download & usage: https://github.com/broadinstitute/picard / https://broadinstitute.github.io/picard/
###########
# Create directory to save insert size distribution analysis results and log files
  mkdir -p ~/Desktop/GSE126612/insert-size-distribution
  mkdir -p ~/Desktop/GSE126612/log
  mkdir -p ~/Desktop/GSE126612/log/insert-size-distribution

# Set bam file folder as working directory
  cd ~/Desktop/GSE126612/bowtie2-mapped

# for-loop to run picard.jar CollectInsertSizeMetrics
  for f in *.hg19.canonical.clean.sort.bam; do
    
    # Extract base filename without extension
    base=${f%%.hg19.canonical.clean.sort.bam}

    # Define file names and directory
    bam_dir=~/Desktop/GSE126612/bowtie2-mapped
    input_bam="${base}.hg19.canonical.clean.sort.bam"

    output_dir=~/Desktop/GSE126612/insert-size-distribution
    output_matrics="${base}.hg19.insert.size.metrics.txt"
    output_histogram="${base}.hg19.insert.size.histogram.pdf"

    log_dir=~/Desktop/GSE126612/log/insert-size-distribution
    log_file="insert-size-distribution_log_${base}.hg19.txt"

    # Set current working directory again
    cd $bam_dir

    # picard.jar CollectInsertSizeMetrics
    (
      java -jar ~/Documents/program/picard/build/libs/picard.jar CollectInsertSizeMetrics \
        I=$input_bam \
        O=$output_dir/$output_matrics \
        H=$output_dir/$output_histogram \
        M=0.5
    ) 2>$log_dir/$log_file
  done
