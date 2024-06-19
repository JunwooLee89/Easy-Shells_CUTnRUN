###########
### Script_08. bed to SRPMC-normalized bedgraph
### This script normalized bed files to create Spike-in normalized Reads Per Million mapped reads in the negative Control (SRPMC) normalized bedgraph files
### First, this script will create chromosome size for reference genome of interest
### Second, this script will perform SRPMC normalization and normalized bedgraph file creation.
### Installing bedtools: https://bedtools.readthedocs.io/en/latest/content/installation.html
### About SRPMC normalization factor: https://mdeber.github.io/articles/SpikeInNormalization.html
###########
### Creating chromosome size for reference genome of interest
#### Setting reference genome of interest directory as working directory
cd ~/Desktop/GSE126612/reference/GRCh38.p14_release45 # You can change the output directory to meet your needs

### Creating chromosome size reference file
gzip GRCh38.p14.genome.fa.gz
faidx GRCh38.p14.genome.fa -i chromsizes > sizes.genome

### Creating SRPMC normalized bedgraph file
#### Create output directory to save normalized bedgraph files
mkdir -p ~/Desktop/GSE126612/bedgraph # You can change the output directory to meet your needs

#### Setting bam-to-bed directory as working directory
cd ~/Desktop/GSE126612/bam-to-bed # You can change the output directory to meet your needs

### for-loop to create SRPMC normalized bedgraph file
  # Loop through all .bed format files in the directory
for f in *_R64-1-1_sortn.bed; do

  # Extract base filename without extension
  base=${f%%_R64-1-1_sortn.bed}

  # Create SRPMC normalized bedgraph files
  sample_exp_bed="${base}_fragments.bed"
  sample_spikein_bed="${base}_R64-1-1_fragments.bed"
  control_exp_bed="SRR8581615_GSM3609773_K562_IgG_hi-Ca_20180314_SH_HsSc_IgG_0305_Homo_sapiens_OTHER_fragments.bed"
  control_spikein_bed="SRR8581615_GSM3609773_K562_IgG_hi-Ca_20180314_SH_HsSc_IgG_0305_Homo_sapiens_OTHER_R64-1-1_fragments.bed"

  # Function to calculate total lines (reads) from bed file
  total_reads() {
    wc -l < "$1"  # Count lines using wc (word count)
  }

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
  
  # Print values to terminal
  log_file="${base}_SRPMC_normalization.log"
  {
    printf "\nFile: %s\n" "$f"
    printf "Sample exp reads: %d\n" "$sample_exp_reads"
    printf "Sample spikein reads: %d\n" "$sample_spikein_reads"
    printf "Control exp reads: %d\n" "$control_exp_reads"
    printf "Control spikein reads: %d\n" "$control_spikein_reads"
    printf "Sample RPS: %.10f\n" "$sample_RPS"
    printf "Control RPS: %.10f\n" "$control_RPS"
    printf "Sample NF: %.10f\n" "$sample_NF"
    printf "Control NF: %.10f\n" "$control_NF"
  } > ~/Desktop/GSE126612/bedgraph/"$log_file"  # Redirect output to the log file

  # Apply normalization factors to sample bed file
  bedtools genomecov -scale $sample_NF -bg -i $sample_exp_bed -g ~/Desktop/GSE126612/reference/GRCh38.p14_release45/sizes.genome > ~/Desktop/GSE126612/bedgraph/${base}_SRPMC.bedGraph
done

