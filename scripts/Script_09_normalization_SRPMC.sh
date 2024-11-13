#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

###########
# Script_09_bed to SRPMC-normalized bedgraph
###########
# Create output directory to save normalized bedGraph, bigWig and log files
  mkdir -p ~/Desktop/GSE126612/bedGraph
  mkdir -p ~/Desktop/GSE126612/bigWig
  mkdir -p ~/Desktop/GSE126612/log
  mkdir -p ~/Desktop/GSE126612/log/SRPMC

# Set current working directory
  cd ~/Desktop/GSE126612/bam-to-bed

# for-loop to create SRPMC normalized bedgraph file with rabbit IgG control
  for f in *.hg19.canonical.clean.fragments.bed; do

    # Extract base filename without extension
    base=${f%%.hg19.canonical.clean.fragments.bed}
    
    # Set file names and directories
      # to calculate normalization factor
      bam_to_bed_dir=~/Desktop/GSE126612/bam-to-bed
      sample_exp_bed="${base}.hg19.canonical.clean.fragments.bed"
      sample_spikein_bed="${base}.R64-1-1.fragments.bed"
      control_exp_bed="SRR8581615.hg19.canonical.clean.fragments.bed"
      control_spikein_bed="SRR8581615.R64-1-1.fragments.bed"

      # to create normalized readcounts bedGraph and bigWig files
      chrom_sizes_dir=~/Desktop/Easy-Shells_CUTnRUN/chrom-sizes
      chrom_sizes="hg19.canonical.chrom.sizes"

      bedGraph_dir=~/Desktop/GSE126612/bedGraph
      SRPMC_bedGraph="${base}.hg19.canonical.clean.fragments.SRPMC.bedGraph"
      
      bigWig_dir=~/Desktop/GSE126612/bigWig
      SRPMC_bigWig="${base}.hg19.canonical.clean.fragments.SRPMC.bw"

      # to create log files
      log_dir=~/Desktop/GSE126612/log/SRPMC
      log_file="log_${base}.hg19.canonical.clean.fragments.SRPMC.txt"

    # Function to calculate total lines (reads) from bed file
    total_reads() {
      wc -l < "$1"  # Count lines using wc (word count)
    }

    # set the current working directory again
    cd $bam_to_bed_dir

    # Calculate total reads (lines)
    sample_exp_reads=$(total_reads "$sample_exp_bed")
    sample_spikein_reads=$(total_reads "$sample_spikein_bed")
    control_exp_reads=$(total_reads "$control_exp_bed")
    control_spikein_reads=$(total_reads "$control_spikein_bed")

    # Calculate RPS values
    sample_RPS=$(echo "scale=10; $sample_exp_reads / $sample_spikein_reads" | bc)
    control_RPS=$(echo "scale=10; $control_exp_reads / $control_spikein_reads" | bc)

    # Calculate normalization factors (NF)
    sample_NF=$(echo "scale=10; ($sample_RPS / $control_RPS) * (1000000 / $sample_exp_reads)" | bc)
    control_NF=$(echo "scale=10; ($control_RPS / $control_RPS) * (1000000 / $control_exp_reads)" | bc)
    (
      # Print values to terminal   
      printf "\nFile: %s\n" "$f"
      printf "Sample exp reads: %d\n" "$sample_exp_reads"
      printf "Sample spikein reads: %d\n" "$sample_spikein_reads"
      printf "Control exp reads: %d\n" "$control_exp_reads"
      printf "Control spikein reads: %d\n" "$control_spikein_reads"
      printf "Sample RPS: %.10f\n" "$sample_RPS"
      printf "Control RPS: %.10f\n" "$control_RPS"
      printf "Sample NF: %.10f\n" "$sample_NF"
      printf "Control NF: %.10f\n" "$control_NF"
    
      # Apply normalization factors to sample bed file
      bedtools genomecov \
        -scale $sample_NF -bg -i $sample_exp_bed \
        -g $chrom_sizes_dir/$chrom_sizes \
        > $bedGraph_dir/$SRPMC_bedGraph

      # Create normalized bigWig file
      bedGraphToBigWig \
        $bedGraph_dir/$SRPMC_bedGraph \
        $chrom_sizes_dir/$chrom_sizes \
        $bigWig_dir/$SRPMC_bigWig
    ) >$log_dir/$log_file
  done

