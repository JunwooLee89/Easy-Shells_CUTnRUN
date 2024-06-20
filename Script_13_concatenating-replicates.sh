###########
### Script_13_making concatenated bed, bedgraph and bigwig files
### First, this script concatenates filtered bed files
### Second, this script normalizes the concatenated bed files to create Spike-in normalized Reads Per Million mapped reads in the negative Control (SRPMC) normalized bedgraph files
### Third, this script created compressed concatenated bedgraph files as bigwig format.
### This script will be run in Scrpt_13.
###########
### 1. input file lists preparation
### 1.1. setting working directory to read bed files
cd ~/Desktop/GSE126612/bed_curated # You can change the output directory to meet your needs

### 1.2. for-loop to generate CTCF input file lists
for CTCF_file in *_K562_CTCF_*_OTHER_fragments.bed; do
    CTCF_files="$CTCF_files $CTCF_file"
done

### 1.3. for-loop to generate CTCF spike-in input file lists
for CTCF_R64_file in *_K562_CTCF_*_OTHER_R64-1-1_fragments.bed; do
    CTCF_R64_files="$CTCF_R64_files $CTCF_R64_file"
done

### 1.4. for-loop to generate H3K27Ac input file lists
for H3K27Ac_file in *_K562_H3K27Ac_*_OTHER_fragments.bed; do
    H3K27Ac_files="$H3K27Ac_files $H3K27Ac_file"
done

### 1.5. for-loop to generate H3K27Ac spike-in input file lists
for H3K27Ac_R64_file in *_K562_H3K27Ac_*_OTHER_R64-1-1_fragments.bed; do
    H3K27Ac_R64_files="$H3K27Ac_R64_files $H3K27Ac_R64_file"
done

### 1.6. for-loop to generate PolIISer5phos input file lists
for PolIISer5phos_file in *_K562_PolIISer5phos_*_OTHER_fragments.bed; do
    PolIISer5phos_files="$PolIISer5phos_files $PolIISer5phos_file"
done

### 1.7. for-loop to generate PolIISer5phos spike-in input file lists
for PolIISer5phos_R64_file in *_K562_PolIISer5phos_*_OTHER_R64-1-1_fragments.bed; do
    PolIISer5phos_R64_files="$PolIISer5phos_R64_files $PolIISer5phos_R64_file"
done

### 1.8. writing a log file to save concatenated file list
log_file="concatenated-file-list.log"
{
    printf "\nCTCF_fragmengs.bed files: %s\n" "$CTCF_files"
    printf "\nCTCF_R64-1-1_fragmengs.bed files: %s\n" "$CTCF_R64_files"
    printf "\nH3K27Ac_fragmengs.bed files: %s\n" "$H3K27Ac_files"
    printf "\nH3K27Ac_R64-1-1_fragmengs.bed files: %s\n" "$H3K27Ac_R64_files"
    printf "\nPolIISer5phos_fragmengs.bed files: %s\n" "$PolIISer5phos_files"
    printf "\nPolIISer5phos_R64-1-1_fragmengs.bed files: %s\n" "$PolIISer5phos_R64_files"
} >  ~/Desktop/GSE126612/bed_curated/"$log_file"


### 2. cat replicates bed files
cat $CTCF_files | sort -k1,1 -k2,2n -k3,3n > K562_CTCF_fragments_cat.bed
cat $CTCF_R64_files | sort -k1,1 -k2,2n -k3,3n > K562_CTCF_R64-1-1_fragments_cat.bed

cat $H3K27Ac_files | sort -k1,1 -k2,2n -k3,3n > K562_H3K27Ac_fragments_cat.bed
cat $H3K27Ac_R64_files | sort -k1,1 -k2,2n -k3,3n > K562_H3K27Ac_R64-1-1_fragments_cat.bed

cat $PolIISer5phos_files | sort -k1,1 -k2,2n -k3,3n > K562_PolIISer5phos_fragments_cat.bed
cat $PolIISer5phos_R64_files | sort -k1,1 -k2,2n -k3,3n > K562_PolIISer5phos_R64-1-1_fragments_cat.bed


### 3. Run Scrpt_08-1 to create SRPMC normalized concatenated bedgraph files
bash ~/Desktop/GSE126612/script/Script_08-1_bed-to-SRPMC-bedgraph_for-cat.sh

### 4. Run Script_09-1 to subtract mock readcounts from sample readcounts
bash ~/Desktop/GSE126612/script/Script_09-1_subtracting-background_for-cat.sh

### 5. Run Script_10-1 to create compressed readcounts file in bigwig format
bash ~/Desktop/GSE126612/script/Script_10-1_bedgraph-to-bigwig_for-cat.sh

