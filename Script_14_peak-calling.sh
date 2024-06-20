###########
### Script_14. Peak calling
### This script performs peak calling using SEACR_1.3.sh and MACS3. Therefore you need to install them.
### Instruction of SEACR: https://github.com/FredHutch/SEACR
### MACS3 installation: https://macs3-project.github.io/MACS/docs/INSTALL.html 
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### This script was wrote to use SEACR_1.3.sh in "~/Document/program/SEACR-1.3".
### You can change the directory of SEACR-1.3.sh to meet the exact location of SEACR_1.3.sh
###########
### 1. Making SEACR_1.3.sh executable
chmod +x ~/Documents/program/SEACR-1.3/SEACR_1.3.sh

### 2. Peak calling via SEACR
### 2.1. Creating peak SEACR calling output directory
mkdir -p ~/Desktop/GSE126612/SEACR

### 2.2. Setting bedgraph folder as working directory
cd ~/Desktop/GSE126612/bedgraph_curated # You can change the output directory to meet your needs

### 2.3. for-loop for SEACR peak calling
for f in *_subtracted_cat.bedGraph; do

  # Extract base filename without extension
  base=${f%%_subtracted_cat.bedGraph}

  # Create subtracted SRPMC normalized bedgraph files
  ~/Documents/program/SEACR-1.3/SEACR_1.3.sh ${base}_subtracted_cat.bedGraph \
  0.01 non stringent ~/Desktop/GSE126612/SEACR/${base}_subtracted_cat_SEACR_stringent
  ~/Documents/program/SEACR-1.3/SEACR_1.3.sh ${base}_subtracted_cat.bedGraph \
  0.01 non relaxed ~/Desktop/GSE126612/SEACR/${base}_subtracted_cat_SEACR_relaxed
done

### 3. Peak calling via MACS3
### 3.1. Creating MACS3 peak calling output directory
mkdir -p ~/Desktop/GSE126612/MACS3

### 3.2. Setting concatenated bedgraph folder as working directory
cd ~/Desktop/GSE126612/bedgraph_curated # You can change the output directory to meet your needs

### 3.3 for-loop for BEDPE file creation
### 3.5. for-loop for macs3 callpeak
for f in *_subtracted_cat.bedGraph; do

  # Extract base filename without extension
  base=${f%%_subtracted_cat.bedGraph}

  # Call peaks using MACS3
  macs3 bdgpeakcall -i ${base}_subtracted_cat.bedGraph --outdir ~/Desktop/GSE126612/MACS3 -o ${base}_subtracted_cat_MACS3_bdgpeakcall.txt
done

