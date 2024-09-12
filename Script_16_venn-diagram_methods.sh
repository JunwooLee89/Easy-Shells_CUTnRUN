#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# intervene to check overlap between different peak calling methods (1)
# IgG sample: SRR8581615
# CTCF: SRR8581594, SRR8581590, SRR8581589
# H3K27ac: SRR8581612, SRR8581608, SRR8581607, SRR8581599
# RNAPIIS5P: SRR8581624, SRR8581622, SRR8581618
# Intervene Venn diagram module: https://intervene.readthedocs.io/en/latest/modules.html#venn-diagram-module
##########
# Create intervene output directory
mkdir -p ~/Desktop/GSE126612/intervene_methods
mkdir -p ~/Desktop/GSE126612/log
mkdir -p ~/Desktop/GSE126612/log/intervene

# Set current working directory
cd ~/Desktop/GSE126612/bed-for-comparison

# Define log file name and directory
log_dir=~/Desktop/GSE126612/log/intervene
log_file="log_intervene_methods.txt"

# for-loop to compare different peak calling method results
(
    for f in *_MACS2_w-IgG_whole_merged.bed; do

        # Extract base filename without extension
        base=${f%%_MACS2_w-IgG_whole_merged.bed}

        # Define output directory
        intervene_methods_dir=~/Desktop/GSE126612/intervene_methods

        # Intervene: MACS2 vs MACS3, with vs without IgG
        intervene venn \
        --input \
        ${base}_MACS2_w-IgG_whole_merged.bed \
        ${base}_MACS2_wo-IgG_whole_merged.bed \
        ${base}_MACS3_w-IgG_whole_merged.bed \
        ${base}_MACS3_wo-IgG_whole_merged.bed \
        --names=MACS2_w-IgG,MACS2_wo-IgG,MACS3_w-IgG,MACS3_wo-IgG \
        --output $intervene_methods_dir/${base}_MACS2-vs-MACS3 \
        --title ${base}_MACS2-vs-MACS3 \
        --save-overlaps --figtype pdf --fontsize 24

        # Intervene: SEACR, stringent, norm vs SFRC vs SRPMC
        intervene venn \
        --input \
        ${base}_SEACR_w-IgG_norm_stringent_whole_merged.bed \
        ${base}_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
        ${base}_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
        --names=norm,SFRC,SRPMC \
        --output $intervene_methods_dir/${base}_SEACR_w-IgG_stringent_norm-vs-SFRC-vs-SRPMC \
        --title ${base}_SEACR_w-IgG_stringent_norm-vs-SFRC-vs-SRPMC \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
        --names=norm,SFRC,SRPMC \
        --output $intervene_methods_dir/${base}_SEACR_wo-IgG_stringent_norm-vs-SFRC-vs-SRPMC \
        --title ${base}_SEACR_wo-IgG_stringent_norm-vs-SFRC-vs-SRPMC \
        --save-overlaps --figtype pdf --fontsize 24

        # Intervene: SEACR, relaxed, norm vs SFRC vs SRPMC
        intervene venn \
        --input \
        ${base}_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
        ${base}_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
        ${base}_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
        --names=norm,SFRC,SRPMC \
        --output $intervene_methods_dir/${base}_SEACR_w-IgG_relaxed_norm-vs-SFRC-vs-SRPMC \
        --title ${base}_SEACR_w-IgG_relaxed_norm-vs-SFRC-vs-SRPMC \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
        --names=norm,SFRC,SRPMC \
        --output $intervene_methods_dir/${base}_SEACR_wo-IgG_relaxed_norm-vs-SFRC-vs-SRPMC \
        --title ${base}_SEACR_wo-IgG_relaxed_norm-vs-SFRC-vs-SRPMC \
        --save-overlaps --figtype pdf --fontsize 24

        # Intervene: SEACR, wtih-vs-without IgG, stringent-vs-relaxed
        intervene venn \
        --input \
        ${base}_SEACR_w-IgG_norm_stringent_whole_merged.bed \
        ${base}_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
        ${base}_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
        ${base}_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
        --names=w-IgG_stringent,wo-IgG_stringent,w-IgG_relaxed,wo-IgG_relaxed \
        --output $intervene_methods_dir/${base}_SEACR_w-vs-wo-IgG_stringent-vs-relaxed_norm \
        --title ${base}_SEACR_w-vs-wo-IgG_stringent-vs-relaxed_norm \
        --save-overlaps --figtype pdf --fontsize 24
        
        intervene venn \
        --input \
        ${base}_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
        ${base}_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
        --names=w-IgG_stringent,wo-IgG_stringent,w-IgG_relaxed,wo-IgG_relaxed \
        --output $intervene_methods_dir/${base}_SEACR_w-vs-wo-IgG_stringent-vs-relaxed_SFRC \
        --title ${base}_SEACR_w-vs-wo-IgG_stringent-vs-relaxed_SFRC \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
        ${base}_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
        --names=w-IgG_stringent,wo-IgG_stringent,w-IgG_relaxed,wo-IgG_relaxed \
        --output $intervene_methods_dir/${base}_SEACR_w-vs-wo-IgG_stringent-vs-relaxed_SRPMC \
        --title ${base}_SEACR_w-vs-wo-IgG_stringent-vs-relaxed_SRPMC \
        --save-overlaps --figtype pdf --fontsize 24

        # Intervene: MACS2 vs MACS3 vs SEACR
        intervene venn \
        --input \
        ${base}_MACS2_w-IgG_whole_merged.bed \
        ${base}_MACS3_w-IgG_whole_merged.bed \
        ${base}_SEACR_w-IgG_norm_stringent_whole_merged.bed \
        ${base}_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
        ${base}_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
        --names=MACS2,MACS3,SEACR-norm,SEACR-SFRC,SEACR-SRPMC \
        --output $intervene_methods_dir/${base}_MACS2-vs-MACS3-vs-SEACR-stringent_w-IgG \
        --title ${base}_MACS2-vs-MACS3-vs-SEACR-stringent_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_MACS2_wo-IgG_whole_merged.bed \
        ${base}_MACS3_wo-IgG_whole_merged.bed \
        ${base}_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
        --names=MACS2,MACS3,SEACR-norm,SEACR-SFRC,SEACR-SRPMC \
        --output $intervene_methods_dir/${base}_MACS2-vs-MACS3-vs-SEACR-stringent_wo-IgG \
        --title ${base}_MACS2-vs-MACS3-vs-SEACR-stringent_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_MACS2_w-IgG_whole_merged.bed \
        ${base}_MACS3_w-IgG_whole_merged.bed \
        ${base}_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
        ${base}_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
        ${base}_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
        --names=MACS2,MACS3,SEACR-norm,SEACR-SFRC,SEACR-SRPMC \
        --output $intervene_methods_dir/${base}_MACS2-vs-MACS3-vs-SEACR-relaxed_w-IgG \
        --title ${base}_MACS2-vs-MACS3-vs-SEACR-relaxed_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_MACS2_wo-IgG_whole_merged.bed \
        ${base}_MACS3_wo-IgG_whole_merged.bed \
        ${base}_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
        --names=MACS2,MACS3,SEACR-norm,SEACR-SFRC,SEACR-SRPMC \
        --output $intervene_methods_dir/${base}_MACS2-vs-MACS3-vs-SEACR-relaxed_wo-IgG \
        --title ${base}_MACS2-vs-MACS3-vs-SEACR-relaxed_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_MACS2_w-IgG_whole_merged.bed \
        ${base}_MACS3_w-IgG_whole_merged.bed \
        ${base}_SEACR_wo-IgG_norm_stringent_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SFRC_stringent_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SRPMC_stringent_whole_merged.bed \
        --names=MACS2_w-IgG,MACS3_w-IgG,SEACR-norm_wo-IgG,SEACR-SFRC_wo-IgG,SEACR-SRPMC_wo-IgG \
        --output $intervene_methods_dir/${base}_MACS-w-IgG-vs-SEACR-stringent_wo-IgG \
        --title ${base}_MACS-w-IgG-vs-SEACR-stringent_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_MACS2_wo-IgG_whole_merged.bed \
        ${base}_MACS3_wo-IgG_whole_merged.bed \
        ${base}_SEACR_w-IgG_norm_stringent_whole_merged.bed \
        ${base}_SEACR_w-IgG_SFRC_stringent_whole_merged.bed \
        ${base}_SEACR_w-IgG_SRPMC_stringent_whole_merged.bed \
        --names=MACS2_wo-IgG,MACS3_wo-IgG,SEACR-norm_w-IgG,SEACR-SFRC_w-IgG,SEACR-SRPMC_w-IgG \
        --output $intervene_methods_dir/${base}_MACS-wo-IgG-vs-SEACR-stringent_w-IgG \
        --title ${base}_MACS-wo-IgG-vs-SEACR-stringent_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_MACS2_w-IgG_whole_merged.bed \
        ${base}_MACS3_w-IgG_whole_merged.bed \
        ${base}_SEACR_wo-IgG_norm_relaxed_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SFRC_relaxed_whole_merged.bed \
        ${base}_SEACR_wo-IgG_SRPMC_relaxed_whole_merged.bed \
        --names=MACS2_w-IgG,MACS3_w-IgG,SEACR-norm_wo-IgG,SEACR-SFRC_wo-IgG,SEACR-SRPMC_wo-IgG \
        --output $intervene_methods_dir/${base}_MACS-w-IgG-vs-SEACR-relaxed_wo-IgG \
        --title ${base}_MACS-w-IgG-vs-SEACR-relaxed_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input \
        ${base}_MACS2_wo-IgG_whole_merged.bed \
        ${base}_MACS3_wo-IgG_whole_merged.bed \
        ${base}_SEACR_w-IgG_norm_relaxed_whole_merged.bed \
        ${base}_SEACR_w-IgG_SFRC_relaxed_whole_merged.bed \
        ${base}_SEACR_w-IgG_SRPMC_relaxed_whole_merged.bed \
        --names=MACS2_wo-IgG,MACS3_wo-IgG,SEACR-norm_w-IgG,SEACR-SFRC_w-IgG,SEACR-SRPMC_w-IgG \
        --output $intervene_methods_dir/${base}_MACS-wo-IgG-vs-SEACR-relaxed_w-IgG \
        --title ${base}_MACS-wo-IgG-vs-SEACR-relaxed_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24
    done
) 2>$log_dir/$log_file
