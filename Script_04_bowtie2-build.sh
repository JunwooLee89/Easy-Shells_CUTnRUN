##########
### Script_04. Build bowtie2 index from reference genome DNA sequence
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### You may need to download up-to-date reference genome information from GENCODE website (https://www.gencodegenes.org/) or Ensembl website (https://useast.ensembl.org/index.html)
### If you have the reference genome DNA sequence file, build bowtie2 index via bowtie2-build
### You can also download some bowtie2 indexes from bowtie2 sourceforge (https://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
### If you already have bowtie2 indexes, you don't need to build the index again.
### Installing bowtie2 in mac: https://formulae.brew.sh/formula/bowtie2
### Installing bowtie2 in linux: https://www.biostars.org/p/51830/
##########
### making reference genome directory
mkdir -p ~/Desktop/GSE126612/reference # reference genome directory;  You can change the output directory to meet your needs
mkdir -p ~/Desktop/GSE126612/reference/GRCh38.p14_release45 # Human reference genome; You can change the output directory to meet your needs

### making bowtie2 reference genome directory
mkdir -p ~/Desktop/GSE126612/reference/bowtie2 # You can change the output directory to meet your needs


### Define the URL of the GRCh38.p14 genome fasta file to download
url1="https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_46/GRCh38.p14.genome.fa.gz"

### Define the output filename for GRCh38.p14 genome fasta (you can customize this)
output_file1="GRCh38.p14.genome.fa.gz"

### Use wget to download the GRCh38.p14 genome fasta file
cd ~/Desktop/GSE126612/reference/GRCh38.p14_release45
wget -O "$output_file1" "$url1"

### bowtie2-build for GRCh38.p14
#### please change the path and name of reference genome DNA sequence file and bowtie2 index base to meet your needs
bowtie2-build --threads 8 ~/Desktop/GSE126612/reference/GRCh38.p14_release45/GRCh38.p14.genome.fa.gz ~/Desktop/GSE126612/reference/bowtie2/GRCh38.p14_release45


### Define the URL of the R64-1-1 bowtie2 index to download
url2="https://genome-idx.s3.amazonaws.com/bt/R64-1-1.zip"

### Define the output filename for R64-1-1 bowtie2 index (you can customize this)
output_file2="R64-1-1.zip"

### Use wget to download the R64-1-1 bowtie2 index file
cd ~/Desktop/GSE126612/reference/bowtie2
wget -O "$output_file2" "$url2"
unzip "output_file2"
