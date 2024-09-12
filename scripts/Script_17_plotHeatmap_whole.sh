#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_17_create heatmap and metaplot for the focused peaks 
# CTCF: SRR8581594, SRR8581590, SRR8581589
# H3K27ac: SRR8581612, SRR8581608, SRR8581607, SRR8581599
# RNAPIIS5P: SRR8581624, SRR8581622, SRR8581618
##########
# create deeptools output directory
mkdir -p ~/Desktop/GSE126612/deeptools_computeMatrix
mkdir -p ~/Desktop/GSE126612/deeptools_plotHeatmap
mkdir -p ~/Desktop/GSE126612/log
mkdir -p ~/Desktop/GSE126612/log/plotHeatmap

# Define log file name and directory
log_dir=~/Desktop/GSE126612/log/plotHeatmap
log_file="log_plotHeatmap_whole.txt"

# for-loop to create Heatmap and average plot
(
    cd ~/Desktop/GSE126612/bigWig

    for f in *.hg19.canonical.clean.fragments.SFRC.bw; do

        # Extract base filename without extension
        base=${f%%.hg19.canonical.clean.fragments.SFRC.bw}

        # Define directories
        computeMatrix_dir=~/Desktop/GSE126612/deeptools_computeMatrix
        plotHeatmap_dir=~/Desktop/GSE126612/deeptools_plotHeatmap

        # MACS2, w/ IgG
        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SFRC.bw \
            ${base}.hg19.canonical.clean.fragments.SFRC.bw \
            -R ~/Desktop/GSE126612/peak-bed_MACS2/${base}.hg19.canonical.clean.fragments_w-IgG_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS2_bw-SFRC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS2_bw-SFRC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS2_bw-SFRC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS2_bw-SFRC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG MACS2, SFRC"

        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SRPMC.bw \
            ${base}.hg19.canonical.clean.fragments.SRPMC.bw \
            -R ~/Desktop/GSE126612/peak-bed_MACS2/${base}.hg19.canonical.clean.fragments_w-IgG_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS2_bw-SRPMC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS2_bw-SRPMC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS2_bw-SRPMC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS2_bw-SRPMC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG MACS2, SRPMC"


        # MACS2, w/o IgG
        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SFRC.bw \
            ${base}.hg19.canonical.clean.fragments.SFRC.bw \
            -R ~/Desktop/GSE126612/peak-bed-filtered_MACS2/${base}.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS2_bw-SFRC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS2_bw-SFRC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS2_bw-SFRC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS2_bw-SFRC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG MACS2, SFRC"

        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SRPMC.bw \
            ${base}.hg19.canonical.clean.fragments.SRPMC.bw \
            -R ~/Desktop/GSE126612/peak-bed-filtered_MACS2/${base}.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS2_bw-SRPMC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS2_bw-SRPMC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS2_bw-SRPMC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS2_bw-SRPMC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG MACS2, SRPMC"


        # MACS3, w/ IgG
        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SFRC.bw \
            ${base}.hg19.canonical.clean.fragments.SFRC.bw \
            -R ~/Desktop/GSE126612/peak-bed_MACS3/${base}.hg19.canonical.clean.fragments_w-IgG_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS3_bw-SFRC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS3_bw-SFRC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS3_bw-SFRC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS3_bw-SFRC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG MACS3, SFRC"

        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SRPMC.bw \
            ${base}.hg19.canonical.clean.fragments.SRPMC.bw \
            -R ~/Desktop/GSE126612/peak-bed_MACS3/${base}.hg19.canonical.clean.fragments_w-IgG_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS3_bw-SRPMC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS3_bw-SRPMC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS3_bw-SRPMC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_w-IgG_MACS3_bw-SRPMC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG MACS3, SRPMC"


        # MACS3, w/o IgG
        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SFRC.bw \
            ${base}.hg19.canonical.clean.fragments.SFRC.bw \
            -R ~/Desktop/GSE126612/peak-bed-filtered_MACS3/${base}.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS3_bw-SFRC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS3_bw-SFRC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS3_bw-SFRC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS3_bw-SFRC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG MACS3, SFRC"

        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SRPMC.bw \
            ${base}.hg19.canonical.clean.fragments.SRPMC.bw \
            -R ~/Desktop/GSE126612/peak-bed-filtered_MACS3/${base}.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS3_bw-SRPMC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS3_bw-SRPMC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS3_bw-SRPMC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments_wo-IgG_MACS3_bw-SRPMC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG MACS3, SRPMC"


        # SEACR, w/ IgG
        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SFRC.bw \
            ${base}.hg19.canonical.clean.fragments.SFRC.bw \
            -R ~/Desktop/GSE126612/peak-bed_SEACR/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole_bw-SFRC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole_bw-SFRC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole_bw-SFRC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole_bw-SFRC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG SEACR, SFRC, stringent"

        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SRPMC.bw \
            ${base}.hg19.canonical.clean.fragments.SRPMC.bw \
            -R ~/Desktop/GSE126612/peak-bed_SEACR/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole_bw-SRPMC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole_bw-SRPMC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole_bw-SRPMC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole_bw-SRPMC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG SEACR, SRPMC, stringent"


        # SEACR, w/o IgG
        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SFRC.bw \
            ${base}.hg19.canonical.clean.fragments.SFRC.bw \
            -R ~/Desktop/GSE126612/peak-bed-filtered_SEACR/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole_bw-SFRC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole_bw-SFRC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole_bw-SFRC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole_bw-SFRC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG SEACR, SFRC, stringent"

        computeMatrix reference-point \
            -S SRR8581615.hg19.canonical.clean.fragments.SRPMC.bw \
            ${base}.hg19.canonical.clean.fragments.SRPMC.bw \
            -R ~/Desktop/GSE126612/peak-bed-filtered_SEACR/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
            -o $computeMatrix_dir/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole_bw-SRPMC.gz \
            -a 3000 -b 3000 -bs 10 --referencePoint center --missingDataAsZero --skipZeros -p max/2 \
            --samplesLabel IgG ${base}

        plotHeatmap -m $computeMatrix_dir/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole_bw-SRPMC.gz \
            -o $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole_bw-SRPMC.pdf \
            --outFileSortedRegions $plotHeatmap_dir/${base}.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole_bw-SRPMC.bed \
            --missingDataColor 1 --colorMap Reds -min 0 --yMin 0 --heatmapHeight 14 --refPointLabel "Center" --plotTitle "${base} w/ IgG SEACR, SRPMC, stringent"
    done
) 2>$log_dir/$log_file
