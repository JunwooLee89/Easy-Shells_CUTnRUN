##########
### Script_02. Initial quality check of sequencing files
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### fastqc installation in linux: https://bioinformaticschool.com/install-fastqc-linux-guide/
### fastqc installation in MAC: https://formulae.brew.sh/formula/fastqc
##########
### Making output directory
mkdir -p ~/Desktop/GSE126612/fastqc.1st # You can change the output directory to meet your needs

### Setting the fastq directory as working directory
cd ~/Desktop/GSE126612/fastq # You can change the output directory to meet your needs

### for-loop to run fastqc for all files in working directory
for f in *.fastq.gz;
do
  fastqc $f -o ~/Desktop/GSE126612/fastqc.1st -t 6; # Type "fastqc -h" in terminal to check the description of options.
done
