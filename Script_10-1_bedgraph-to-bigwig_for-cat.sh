###########
### Script_10-1. compressing concatenated bedgraph to bigwig
### This script compresses both unsubtracted and subtracted concatenated bedgraph files to bigwig ones
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### This script will be run in Scrpt_13.
### Installing bedGraphToBigWig: https://hgdownload.soe.ucsc.edu/admin/exe/
###########
### Creating directory to save BigWig files
mkdir -p ~/Desktop/GSE126612/bigwig_curated # You can change the output directory to meet your needs

### Setting bedGraph directory as working directory
cd ~/Desktop/GSE126612/bedgraph_curated # You can change the output directory to meet your needs

### for-loop to run  bdgcmp
  # Loop through all .bed format files in the directory
for f in *_cat.bedGraph; do

  # Extract base filename without extension
  base=${f%%_cat.bedGraph}

  # Create subtracted SRPMC normalized bedgraph files
  bedGraphToBigWig ${base}_cat.bedGraph ~/Desktop/GSE126612/reference/GRCh38.p14_release45/sizes.genome ~/Desktop/GSE126612/bigwig_curated/${base}_cat.bw
done
