###########
### Script_15_heatmap and metaplot analysis via deeptools
### Create "focused" peak bed files centered by highest signal locations for SEACR called peaks and the most statistically significant locations (peak summit) for MACS3 called peaks. 
### Run "computeMatrix reference-point" function to make normalized readcounts matrix at the center of "focused" SEACR and MACS3 called peaks. 
### Run "plotHeatmap" function to generate heatmap and metaplot to visualize normalized readcounts distribution pattern at the center of "focused" SEACR and MACS3 called peaks.  
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
###########
### 1. making bigwig file lists as deeptools tools input
### Setting the bigwig folder as working directory
cd ~/Desktop/GSE126612/bigwig_curated # You can change the output directory to meet your needs

### for-loop to build the list of bigwig files 
for CTCF_bigwig_file in K562_CTCF_SRPMC_*.bw; do
    CTCF_bigwig_files="$CTCF_bigwig_files $CTCF_bigwig_file"
done

for H3K27Ac_bigwig_file in K562_H3K27Ac_SRPMC_*.bw; do
    H3K27Ac_bigwig_files="$H3K27Ac_bigwig_files $H3K27Ac_bigwig_file"
done

for PolIISer5phos_bigwig_file in K562_PolIISer5phos_SRPMC_*.bw; do
    PolIISer5phos_bigwig_files="$PolIISer5phos_bigwig_files $PolIISer5phos_bigwig_file"
done


### 2. create focused peak file for SEACR called peaks
### 2.1. setting SEACR peak calling output directory as working directory
cd ~/Desktop/GSE126612/SEACR # You can change the path to meet your needs

### 2.2. for-loop to generate highest signal focused peak bed file
for f in *_stringent.stringent.bed; do

  # Extract base filename without extension
  base=${f%%_stringent.stringent.bed}

  # Generate focused peak bed file
  awk '{split($6,a,":"); print a[1],a[2],$6}' OFS='\t' ${base}_stringent.stringent.bed | awk '{split($2,b,"-"); print $1,b[1],b[2],$3}' OFS='\t' > ${base}_stringent_focused.bed
  awk '{split($6,a,":"); print a[1],a[2],$6}' OFS='\t' ${base}_relaxed.relaxed.bed | awk '{split($2,b,"-"); print $1,b[1],b[2],$3}' OFS='\t' > ${base}_relaxed_focused.bed
done

### 3. create focused peak for MACS3 called peaks
### 3.1. setting MACS3 peak calling output directory as working directory
cd ~/Desktop/GSE126612/MACS3

### 3.2. for-loop to make focused bed files from MACS3 peak files
for f in *_bdgpeakcall.txt; do

  # Extract base filename without extension
  base=${f%%_bdgpeakcall.txt}

  # Generate focused peak bed file
  tail -n +2 ${base}_bdgpeakcall.txt | awk '{print $1, $2, $3, $4}' OFS='\t' > ${base}_bdgpeakcall_focused.bed
done


### 4. create heatmap and metaplot for the focused SEACR peaks
### 4.1. create deeptools output directory
mkdir -p ~/Desktop/GSE126612/deeptools

### 4.2. setting deeptools output directory as working directory
cd ~/Desktop/GSE126612/bigwig_curated # You can change the output directory to meet your needs

### 4.3. for-loop to perform plotHeatmap
### 4.3.1. CTCF
computeMatrix reference-point -S $CTCF_bigwig_files -R ~/Desktop/GSE126612/SEACR/K562_CTCF_SRPMC_subtracted_cat_SEACR_stringent_focused.bed \
    -o ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_SEACR_stringent_focused_computeMatrix.gz \
    -a 2000 -b 2000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros --smartLabels -p max/2

plotHeatmap -m ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_SEACR_stringent_focused_computeMatrix.gz \
    -o ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_SEACR_stringent_focused_plotHeatmap.pdf \
    --outFileSortedRegions ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_SEACR_stringent_focused_plotHeatmap.bed \
    --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "CTCF center" --plotTitle "CTCF SEACR sgringent"

computeMatrix reference-point -S $CTCF_bigwig_files -R ~/Desktop/GSE126612/SEACR/K562_CTCF_SRPMC_subtracted_cat_SEACR_relaxed_focused.bed \
    -o ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_SEACR_relaxed_focused_computeMatrix.gz \
    -a 2000 -b 2000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros --smartLabels -p max/2

plotHeatmap -m ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_SEACR_relaxed_focused_computeMatrix.gz \
    -o ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_SEACR_relaxed_focused_plotHeatmap.pdf \
    --outFileSortedRegions ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_SEACR_relaxed_focused_plotHeatmap.bed \
    --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "CTCF center" --plotTitle "CTCF SEACR relaxed"

computeMatrix reference-point -S $CTCF_bigwig_files -R ~/Desktop/GSE126612/MACS3/K562_CTCF_SRPMC_subtracted_cat_MACS3_bdgpeakcall_focused.bed \
    -o ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_computeMatrix.gz \
    -a 2000 -b 2000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros --smartLabels -p max/2

plotHeatmap -m ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_computeMatrix.gz \
    -o ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_plotHeatmap.pdf \
    --outFileSortedRegions ~/Desktop/GSE126612/deeptools/K562_CTCF_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_plotHeatmap.bed \
    --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 7 --refPointLabel "CTCF center" --plotTitle "CTCF MACS3"


### 4.3.2. H3K27Ac
computeMatrix reference-point -S $H3K27Ac_bigwig_files -R ~/Desktop/GSE126612/SEACR/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_stringent_focused.bed \
    -o ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_stringent_focused_computeMatrix.gz \
    -a 2000 -b 2000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros --smartLabels -p max/2

plotHeatmap -m ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_stringent_focused_computeMatrix.gz \
    -o ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_stringent_focused_plotHeatmap.pdf \
    --outFileSortedRegions ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_stringent_focused_plotHeatmap.bed \
    --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "H3K27Ac center" --plotTitle "H3K27Ac SEACR sgringent"

computeMatrix reference-point -S $H3K27Ac_bigwig_files -R ~/Desktop/GSE126612/SEACR/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_relaxed_focused.bed \
    -o ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_relaxed_focused_computeMatrix.gz \
    -a 2000 -b 2000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros --smartLabels -p max/2

plotHeatmap -m ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_relaxed_focused_computeMatrix.gz \
    -o ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_relaxed_focused_plotHeatmap.pdf \
    --outFileSortedRegions ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_SEACR_relaxed_focused_plotHeatmap.bed \
    --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "H3K27Ac center" --plotTitle "H3K27Ac SEACR relaxed"

computeMatrix reference-point -S $H3K27Ac_bigwig_files -R ~/Desktop/GSE126612/MACS3/K562_H3K27Ac_SRPMC_subtracted_cat_MACS3_bdgpeakcall_focused.bed \
    -o ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_computeMatrix.gz \
    -a 2000 -b 2000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros --smartLabels -p max/2

plotHeatmap -m ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_computeMatrix.gz \
    -o ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_plotHeatmap.pdf \
    --outFileSortedRegions ~/Desktop/GSE126612/deeptools/K562_H3K27Ac_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_plotHeatmap.bed \
    --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 7 --refPointLabel "H3K27Ac center" --plotTitle "H3K27Ac MACS3"


### 4.3.3. PolIISer5phos
computeMatrix reference-point -S $PolIISer5phos_bigwig_files -R ~/Desktop/GSE126612/SEACR/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_stringent_focused.bed \
    -o ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_stringent_focused_computeMatrix.gz \
    -a 2000 -b 2000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros --smartLabels -p max/2

plotHeatmap -m ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_stringent_focused_computeMatrix.gz \
    -o ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_stringent_focused_plotHeatmap.pdf \
    --outFileSortedRegions ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_stringent_focused_plotHeatmap.bed \
    --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 7 --refPointLabel "PolIISer5phos center" --plotTitle "PolIISer5phos SEACR sgringent"

computeMatrix reference-point -S $PolIISer5phos_bigwig_files -R ~/Desktop/GSE126612/SEACR/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_relaxed_focused.bed \
    -o ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_relaxed_focused_computeMatrix.gz \
    -a 2000 -b 2000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros --smartLabels -p max/2

plotHeatmap -m ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_relaxed_focused_computeMatrix.gz \
    -o ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_relaxed_focused_plotHeatmap.pdf \
    --outFileSortedRegions ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_SEACR_relaxed_focused_plotHeatmap.bed \
    --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 7 --refPointLabel "PolIISer5phos center" --plotTitle "PolIISer5phos SEACR relaxed"

computeMatrix reference-point -S $PolIISer5phos_bigwig_files -R ~/Desktop/GSE126612/MACS3/K562_PolIISer5phos_SRPMC_subtracted_cat_MACS3_bdgpeakcall_focused.bed \
    -o ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_computeMatrix.gz \
    -a 2000 -b 2000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros --smartLabels -p max/2

plotHeatmap -m ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_computeMatrix.gz \
    -o ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_plotHeatmap.pdf \
    --outFileSortedRegions ~/Desktop/GSE126612/deeptools/K562_PolIISer5phos_SRPMC_subtracted_cat_MCAS3_bdgpeakcall_focused_plotHeatmap.bed \
    --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 4 --refPointLabel "PolIISer5phos center" --plotTitle "PolIISer5phos MACS3"

