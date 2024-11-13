#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

###########
# Script_08_Make fragments BEDPE and BED files, and raw readcounts bedGraph files from filtered bam files
###########
# Create output directories
  mkdir -p ~/Desktop/GSE126612/BEDPE
  mkdir -p ~/Desktop/GSE126612/bam-to-bed
  mkdir -p ~/Desktop/GSE126612/bedGraph

  mkdir -p ~/Desktop/GSE126612/log
  mkdir -p ~/Desktop/GSE126612/log/bam-to-BEDPE
  mkdir -p ~/Desktop/GSE126612/log/bam-to-bed
  mkdir -p ~/Desktop/GSE126612/log/bed-to-bedGraph

# Set initial current working directory
  cd ~/Desktop/GSE126612/bowtie2-mapped 

# for-loop to create freagments and raw readcounts files
  for f in *.hg19.canonical.clean.sort.bam; do

    # Extract base filename without extension
    base=${f%%.hg19.canonical.clean.sort.bam}  # to create raw readcounts bedGraph files

    # Define files and directories. You can change here to use this script for your data analysis
      # to create fragments BEDPE files
      bam_dir=~/Desktop/GSE126612/bowtie2-mapped
      bam_sort_by_coordinate="${base}.hg19.canonical.clean.sort.bam"
      BEDPE_dir=~/Desktop/GSE126612/BEDPE
      BEDPE="${base}.hg19.canonical.clean.bed"
      filtered_BEDPE="${base}.hg19.canonical.clean.fragments.bed"
      log_BEDPE_dir=~/Desktop/GSE126612/log/bam-to-BEDPE
      log_BEDPE="bam-to-BEDPE_log_${base}.hg19.canonical.clean.txt"

      # to create fragments BED files
      bam_sort_by_query_actual="${base}.hg19.canonical.clean.sortn.bam"
      bam_sort_by_query_spike_in="${base}.R64-1-1.sortn.bam"

      bam_to_bed_dir=~/Desktop/GSE126612/bam-to-bed
      bam_to_bed_actual="${base}.hg19.canonical.clean.sortn.bed"
      bam_to_bed_spike_in="${base}.R64-1-1.sortn.bed"

      filtered_bam_to_bed_actual="${base}.hg19.canonical.clean.fragments.bed"
      filtered_bam_to_bed_spike_in="${base}.R64-1-1.fragments.bed"

      log_bam_to_bed_dir=~/Desktop/GSE126612/log/bam-to-bed
      log_bam_to_bed_actual="bam-to-bed_log_${base}.hg19.txt"
      log_bam_to_bed_spike_in="bam-to-bed_log_${base}.R64-1-1.txt"

      # to create raw readcounts bedGraph files
      chrom_sizes_dir=~/Desktop/Easy-Shells_CUTnRUN/chrom-sizes
      chrom_sizes="hg19.canonical.chrom.sizes"

      bedGraph_dir=~/Desktop/GSE126612/bedGraph
      raw_bedGraph_actual="${base}.hg19.canonical.clean.fragments.bedGraph"
      raw_bedGraph_spike_in="${base}.R64-1-1.fragments.bedGraph"

    # Set bam files directory as current working directory again
    cd $bam_dir

    # Create BEDPE, BED and bedGraph files
      # Create BEDPE file from bowtie2 bam file
        # Reference for macs3 filterdup: https://macs3-project.github.io/MACS/docs/filterdup.html
        (
          macs3 filterdup \
          -i $bam_sort_by_coordinate \
          -f BAMPE --keep-dup all \
          -o $BEDPE_dir/$BEDPE

          # filter BEDPE file to captre fragments shorter than 1kb. You can change here to capture different fragment sizes
          awk '($3 - $2) < 1000' \
            $BEDPE_dir/$BEDPE \
          > $BEDPE_dir/$filtered_BEDPE
        ) 2>$log_BEDPE_dir/$log_BEDPE

      # change bam to bed; actual sample
      (
        # Reference for bedtools bamtobed: https://bedtools.readthedocs.io/en/latest/content/tools/bamtobed.html
        bedtools bamtobed \
          -bedpe \
          -i $bam_sort_by_query_actual \
        > $bam_to_bed_dir/$bam_to_bed_actual

        # Filtering and creating fragments bed file
        awk '$1 !="." && $1==$4 && $6-$2 < 1000 {print $0}' \
          $bam_to_bed_dir/$bam_to_bed_actual | \
        cut -f 1,2,6 | \
        sort -k1,1 -k2,2n -k3,3n \
        > $bam_to_bed_dir/$filtered_bam_to_bed_actual
      ) 2>$log_bam_to_bed_dir/$log_bam_to_bed_actual
      # change bam to bed; actual sample; spike-in
      (
        bedtools bamtobed \
          -bedpe \
          -i $bam_sort_by_query_spike_in \
        > $bam_to_bed_dir/$bam_to_bed_spike_in        

        # Filtering and creating fragments bed file
        awk '$1 !="." && $1==$4 && $6-$2 < 1000 {print $0}' \
          $bam_to_bed_dir/$bam_to_bed_spike_in | \
        cut -f 1,2,6 | \
        sort -k1,1 -k2,2n -k3,3n \
        > $bam_to_bed_dir/$filtered_bam_to_bed_spike_in
      ) 2>$log_bam_to_bed_dir/$log_bam_to_bed_spike_in

      # bed to bedgraph; actual sample only
        # Reference for bedtools genomecov: https://bedtools.readthedocs.io/en/latest/content/tools/genomecov.html
        bedtools genomecov \
          -bg \
          -i $bam_to_bed_dir/$filtered_bam_to_bed_actual \
          -g $chrom_sizes_dir/$chrom_sizes \
        > $bedGraph_dir/$raw_bedGraph_actual
  done
