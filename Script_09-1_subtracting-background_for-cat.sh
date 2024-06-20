###########
### Script_09-1. subtracting background signal from concatenated bedgraph files
### This script sbutract background (IgG) signal from SRPMC normalized, concatenated bedgraph files.
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### This script will be run in Scrpt_13.
### Installing macs3: https://macs3-project.github.io/MACS/docs/INSTALL.html#
### Installing macs3 in linux: https://www.biostars.org/p/9504562/
###########
### Setting bedgraph folder as working directory
cd ~/Desktop/GSE126612/bedgraph_curated # You can change the output directory to meet your needs

### for-loop to run macs3 bdgcmp
  # Loop through all .bed format files in the directory
for f in *_cat.bedGraph; do

  # Extract base filename without extension
  base=${f%%_cat.bedGraph}

  # Create subtracted SRPMC normalized bedgraph files
  macs3 bdgcmp -t ${base}_cat.bedGraph -c SRR8581615_GSM3609773_K562_IgG_hi-Ca_20180314_SH_HsSc_IgG_0305_Homo_sapiens_OTHER_SRPMC.bedGraph -m subtract -o ${base}_subtracted_cat.bedGraph
done
