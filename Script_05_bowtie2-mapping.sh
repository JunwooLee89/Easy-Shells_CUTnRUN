##########
### Script_05. Bowtie2 mapping
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### When you use this script for your own dataset, please change the detail of this script to match with your sequencing file name format and reference genomes.
##########
### making bowtie2 mapping output directory
mkdir -p ~/Desktop/GSE126612/bowtie2.mapped # You can change the output directory to meet your needs

### setting trimmed fasta file location as working directlry
cd ~/Desktop/GSE126612/trimmed # You can change the output directory to meet your needs

### for-loop to run bowtie2 mapping
for f in *_1_val_1.fq.gz; do
  # Extract base filename without extension
  base=${f%%_1_val_1.fq.gz}

  # Build full paths for paired-end reads
  # Check your file name format carefully. Your actual file can have different name format. Change this script to match with your file name format.
  read1="${base}_1_val_1.fq.gz"
  read2="${base}_2_val_2.fq.gz"

  # Perform bowtie2 alignment with reference genomes
  # Please type "bowtie2 --help" in terminal and read the description about options.
  # .log files include the summary of mapping results.

  # Bowt2 alignment with reference genome of interest
  (bowtie2 -p 12 --end-to-end --very-sensitive --no-mixed --no-discordant -q --phred33 -I 10 -X 700 \
  -x ~/Desktop/GSE126612/reference/bowtie2/GRCh38.p14_release45 -1 "$read1" -2 "$read2" \
  -S ~/Desktop/GSE126612/bowtie2.mapped/${base}.sam) 2>~/Desktop/GSE126612/bowtie2.mapped/${base}.log

  # Bowtie2 alignment with spike-in genome
  (bowtie2 -p 12 --end-to-end --very-sensitive --no-mixed --no-discordant -q --phred33 -I 10 -X 700 \
  -x ~/Desktop/GSE126612/reference/bowtie2/R64-1-1/R64-1-1 -1 "$read1" -2 "$read2" \
  -S ~/Desktop/GSE126612/bowtie2.mapped/${base}_R64-1-1.sam) 2>~/Desktop/GSE126612/bowtie2.mapped/${base}_R64-1-1.log
done

