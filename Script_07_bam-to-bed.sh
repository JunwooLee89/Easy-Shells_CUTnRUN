##########
### Script_07. change bam to bed format
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### Filteration will be done for reference genome of interest only; will not be done for spike-in reference genome
### reference of the bam to bed format change: https://github.com/FredHutch/SEACR
### bedtools installation guideline: https://bedtools.readthedocs.io/en/latest/content/installation.html
##########
### Creating output directory to save bed files
mkdir -p ~/Desktop/GSE126612/bam-to-bed # You can change the output directory to meet your needs

### Setting bam file folder as working directory
cd ~/Desktop/GSE126612/bam-files # You can change the output directory to meet your needs

### for-loop to change bam to bed format
  # Loop through all bam format files in the directory
for f in *_sortn.bam; do

  # Extract base filename without extension
  base=${f%%_sortn.bam}

  # change bam to bed
  bedtools bamtobed -bedpe -i ${base}_sortn.bam > ~/Desktop/GSE126612/bam-to-bed/${base}_sortn.bed
done


### Setting bed file folder as working directory
cd ~/Desktop/GSE126612/bam-to-bed

### for-loop to filter bed files which were mapped with reference genome of interest
  # Loop through all bam format files in the directory
for f in *_sortn.bed; do

  # Extract base filename without extension
  base=${f%%_sortn.bed}
  
  # Filtering and creating fragments bed file
  awk '$1 !="." && $1==$4 && $6-$2 < 1000 {print $0}' ${base}_sortn.bed > ${base}_clean.bed
  cut -f 1,2,6 ${base}_clean.bed | sort -k1,1 -k2,2n -k3,3n > ${base}_fragments.bed
done     # End of the 'for' loop
