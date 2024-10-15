#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_05_Download reference genome and bowtie2 indexes
# In this example, hg19 is used for actual sample to meet same reference genome of original publication.
# You can download other official bowtie2 indexes from bowtie2 sourceforge
    # https://bowtie-bio.sourceforge.net/bowtie2/index.shtml
# If you need to build new reference genome, please follow this instruction
    # https://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#the-bowtie2-build-indexer
##########
# Make bowtie2 index directory
mkdir -p ~/Desktop/Easy-Shells_CUTnRUN/bowtie2-index

# Make bowtie2 index download log directory
mkdir -p ~/Desktop/GSE126612/log
mkdir -p ~/Desktop/GSE126612/log/bowtie2-index

# Set directory names. you can change here to analyze your own dataset.
index_dir=~/Desktop/Easy-Shells_CUTnRUN/bowtie2-index

url_actual="https://genome-idx.s3.amazonaws.com/bt/hg19.zip"
output_actual="hg19.zip"
url_spike_in="https://genome-idx.s3.amazonaws.com/bt/R64-1-1.zip"
output_spike_in="R64-1-1.zip"

log_dir=~/Desktop/GSE126612/log/bowtie2-index
log_file="bowtie2-index-log.txt"

# Download bowtie2 index files
{
    # Actual CUT&RUN sample reference genome; hg19
        # Use wget to download the GRCh38.p14 genome fasta file
        cd $index_dir
        wget -O "$output_actual" "$url_actual"

        # unzip the hg19 bowtie2 index file
        unzip -j "$output_actual"

        # remove the zipped R64-1-1 bowtie2 index file to reduce storage usage
        rm "$output_actual"

    # Spkke-in control reference genome; R64-1-1
        # Use wget to download the R64-1-1 bowtie2 index file
        cd $index_dir
        wget -O "$output_spike_in" "$url_spike_in"

        # unzip the R64-1-1 bowtie2 index file
        unzip -j "$output_spike_in"

        # remove the zipped R64-1-1 bowtie2 index file to reduce storage usage
        rm "$output_spike_in"
} 2>$log_dir/$log_file
