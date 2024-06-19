##########
### Script_06. compressing and sorting mapped reads
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### If you faces space limitation, it may be better to erase sam files after creating bam files
### Installing samtools (1): https://www.htslib.org/download/
### Installing samtools (2): https://www.biostars.org/p/328831/
##########
### Making output directory to save bam files
mkdir -p ~/Desktop/GSE126612/bam-files # You can change the output directory to meet your needs

### Compressing bowtie2 mapped reads
#### Setting bowtie2 mapped reads directory as working directlry
cd ~/Desktop/GSE126612/bowtie2.mapped # You can change the output directory to meet your needs

#### for-loop to compress bowtie2 mapped reads and save the compressed one into bam file directory
for f in *.sam; do
  # Extract base filename without extension
  base=${f%%.sam}

  # samtools to create bam files
  # Please type "samtools view --help" in termial and read the description of options
  samtools view -bhS -@ 12 ${base}.sam -o ~/Desktop/GSE126612/bam-files/${base}.bam
done

### Sorting the compressed bowtie2 mapped reads by query
#### Please type "samtools sort --help" in terminal and read the description of options
#### No need to index the sorted bam files
#### setting working directory
cd ~/Desktop/GSE126612/bam-files

#### for-loop to sort bam files by query
for f in *.bam; do
  # Extract base filename without extension
  base=${f%%.bam}

  # samtools to sort bam files by query
  samtools sort -n -@ 12 ${base}.bam -o ${base}_sortn.bam
done

