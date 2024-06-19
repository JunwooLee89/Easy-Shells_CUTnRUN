##########
### Script_03. Trimming and filtering fastq files using Trim_Galore
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### Installing Cutadapt: https://cutadapt.readthedocs.io/en/stable/installation.html
### Installing trim_galore: https://github.com/FelixKrueger/TrimGalore
### Installing parallel in linux: https://askubuntu.com/questions/12764/where-do-i-get-a-package-for-gnu-parallel
### Installing parallel in mac: https://formulae.brew.sh/formula/parallel#:~:text=Search%20K,9
##########
### Making output directory
mkdir -p ~/Desktop/GSE126612/trimmed # You can change the output directory to meet your needs

### setting working directory
cd ~/Desktop/GSE126612/fastq

### xapply to run trim_galore for all files within the working directory
parallel --xapply trim_galore --paired --fastqc -o ~/Desktop/GSE126612/trimmed ::: *_1.fastq.gz ::: *_2.fastq.gz

# Type "trim_galore --help" in terminal to check the description of the options

