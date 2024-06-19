###########
### Script_11. Insert size distribution analysis
### This script performs insert size distribution analysis for mapped reads bam files
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### This scripts use picard CollectInsertSizeMetrics function. Therefore, you may need to download the picard.jar and make it executable.
### This script was wrote to use picard.jar downloaded in "~/Document/program/picard" folder.
### Therefore, If you save picard.jar in other folder, please change the path of picard.jar in this script.
### picard.jar download & usage: https://github.com/broadinstitute/picard / https://broadinstitute.github.io/picard/
###########
### 1. Insert size analysis input file preparation
### 1.1. Setting bam file folder as working directory
cd ~/Desktop/GSE126612/bam-files # You can change the output directory to meet your needs

### 1.2. for-loop to sort and index bam files
for f in *_sortn.bam; do
  # Extract base filename without extension
  base=${f%%_sortn.bam}

  # samtools to generate sorted bam and its index
    samtools sort -@ 8 ${base}.bam -o ${base}.sort.bam
    samtools index -@ 8 ${base}.sort.bam
done

### 2. Insert size distribution analysis via picard.jar CollectInsertSizeMetrics
### 2.1. Creating directory to save correlation comparison results
mkdir -p ~/Desktop/GSE126612/insert-size-distribution # You can change the output directory to meet your needs

### for-loop to run picard.jar CollectInsertSizeMetrics
for f in *.sort.bam; do
  # Extract base filename without extension
  base=${f%%.sort.bam}

  # samtools to generate sorted uniquely mapped bam and its index
  java -jar ~/Documents/program/picard/build/libs/picard.jar CollectInsertSizeMetrics \
  I=~/Desktop/GSE126612/bam-files/${base}.sort.bam \
  O=~/Desktop/GSE126612/insert-size-distribution/${base}.insert.size.metrics.txt \
  H=~/Desktop/GSE126612/insert-size-distribution/${base}.insert.size.histogram.pdf \
  M=0.5
done

