#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_06_Bowtie2 mapping
# Bowtie2 mapping reference
  # https://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#the-bowtie2-aligner
##########
# Make bowtie2 mapping output directory
mkdir -p ~/Desktop/GSE126612/bowtie2-mapped

# Make bowtie2 mapping log output directory
mkdir -p ~/Desktop/GSE126612/log
mkdir -p ~/Desktop/GSE126612/log/bowtie2-mapped

# Set trimmed fasta file location as current working directory
cd ~/Desktop/GSE126612/trimmed

# for-loop to run bowtie2 mapping
for f in *_1_val_1.fq; do

  # Extract base filename without extension
  base=${f%%_1_val_1.fq}

  # Define directories and file names; you can change here to analyze your own dataset.
  trimmed_dir=~/Desktop/GSE126612/trimmed
  read1="${base}_1_val_1.fq"
  read2="${base}_2_val_2.fq"

  hg19_index=~/Desktop/Easy-Shells_CUTnRUN/bowtie2-index/hg19
  R64_1_1_index=~/Desktop/Easy-Shells_CUTnRUN/bowtie2-index/R64-1-1

  bam_dir=~/Desktop/GSE126612/bowtie2-mapped
  hg19_bam="${base}.hg19.bam"
  R64_1_1_bam="${base}.R64-1-1.bam"

  log_dir=~/Desktop/GSE126612/log/bowtie2-mapped
  log_hg19="bowtie2_log_hg19_${base}.txt"
  log_R64_1_1="bowtie2_log_R64-1-1_${base}.txt"

  # Set the current working directory again
  cd $trimmed_dir

  # Bowt2 alignment with reference genome of interest
  (
    bowtie2 \
      -p 8 --local --very-sensitive-local --no-unal --no-mixed --no-discordant -q --phred33 -I 10 -X 700 \
      -x $hg19_index \
      -1 $read1 \
      -2 $read2 | \
    samtools view -bhS -@ 8 \
      -o $bam_dir/$hg19_bam
  ) 2>$log_dir/$log_hg19

  # Bowtie2 alignment with spike-in genome
  (
    bowtie2 \
      -p 8 --local --very-sensitive-local --no-unal --no-mixed --no-discordant -q --phred33 -I 10 -X 700 \
      -x $R64_1_1_index \
      -1 $read1 \
      -2 $read2 | \
    samtools view -bhS -@ 8 \
      -o $bam_dir/$R64_1_1_bam
  ) 2>$log_dir/$log_R64_1_1
done
