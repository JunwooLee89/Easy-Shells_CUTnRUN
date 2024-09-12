#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# Script_16_intervene to check overlap between replicates: SEACR
# IgG sample: SRR8581615
# CTCF: SRR8581594, SRR8581590, SRR8581589
# H3K27ac: SRR8581612, SRR8581608, SRR8581607, SRR8581599
# RNAPIIS5P: SRR8581624, SRR8581622, SRR8581618
# Intervene Venn diagram module: https://intervene.readthedocs.io/en/latest/modules.html#venn-diagram-module
##########
# Create intervene output directory
mkdir -p ~/Desktop/GSE126612/intervene_replicates
mkdir -p ~/Desktop/GSE126612/log
mkdir -p ~/Desktop/GSE126612/log/intervene

# Define directories
intervene_replicates_dir=~/Desktop/GSE126612/intervene_replicates
log_dir=~/Desktop/GSE126612/log/intervene
log_file="log_intervene_replicates.txt"

(
        # Intervene: SEACR-wo-IgG-norm.stringent
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_wo-IgG_norm_stringent \
        --title CTCF_SEACR_wo-IgG_norm_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_wo-IgG_norm_stringent \
        --title H3K27ac_SEACR_wo-IgG_norm_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.stringent_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_wo-IgG_norm_stringent \
        --title RNAPII-S5P_SEACR_wo-IgG_norm_stringent \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SEACR-w-IgG-norm.stringent
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_w-IgG_norm_stringent \
        --title CTCF_SEACR_w-IgG_norm_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_w-IgG_norm_stringent \
        --title H3K27ac_SEACR_w-IgG_norm_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.stringent_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_w-IgG_norm_stringent \
        --title RNAPII-S5P_SEACR_w-IgG_norm_stringent \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SFRC_SEACR-wo-IgG.stringent
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_wo-IgG_SFRC_stringent \
        --title CTCF_SEACR-wo-IgG_SFRC_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_wo-IgG_SFRC_stringent \
        --title H3K27ac_SEACR_wo-IgG_SFRC_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.stringent_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_wo-IgG_SFRC_stringent \
        --title RNAPII-S5P_SEACR_wo-IgG_SFRC_stringent \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SFRC_SEACR-w-IgG.stringent
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_w-IgG_SFRC_stringent \
        --title CTCF_SEACR_w-IgG_SFRC_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_w-IgG_SFRC_stringent \
        --title H3K27ac_SEACR_w-IgG_SFRC_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.stringent_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_w-IgG_SFRC_stringent \
        --title RNAPII-S5P_SEACR_w-IgG_SFRC_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        # Intervene: SRPMC_SEACR-wo-IgG.stringent
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_wo-IgG_SRPMC_stringent \
        --title CTCF_SEACR_wo-IgG_SRPMC_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_wo-IgG_SRPMC_stringent \
        --title H3K27ac_SEACR_wo-IgG_SRPMC_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.stringent_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_wo-IgG_SRPMC_stringent \
        --title RNAPII-S5P_SEACR_wo-IgG_SRPMC_stringent \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SRPMC_SEACR-w-IgG.stringent
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_w-IgG_SRPMC_stringent \
        --title CTCF_SEACR_w-IgG_SRPMC_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_w-IgG_SRPMC_stringent \
        --title H3K27ac_SEACR_w-IgG_SRPMC_stringent \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.stringent_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_w-IgG_SRPMC_stringent \
        --title RNAPII-S5P_SEACR_w-IgG_SRPMC_stringent \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SEACR-wo-IgG-norm.relaxed
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_wo-IgG_norm_relaxed \
        --title CTCF_SEACR_wo-IgG_norm_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_wo-IgG_norm_relaxed \
        --title H3K27ac_SEACR_wo-IgG_norm_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments_SEACR-wo-IgG-norm.relaxed_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_wo-IgG_norm_relaxed \
        --title RNAPII-S5P_SEACR_wo-IgG_norm_relaxed \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SEACR-w-IgG-norm.relaxed
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_w-IgG_norm_relaxed \
        --title CTCF_SEACR_w-IgG_norm_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_w-IgG_norm_relaxed \
        --title H3K27ac_SEACR_w-IgG_norm_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments_SEACR-w-IgG-norm.relaxed_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_w-IgG_norm_relaxed \
        --title RNAPII-S5P_SEACR_w-IgG_norm_relaxed \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SFRC_SEACR-wo-IgG.relaxed
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_wo-IgG_SFRC_relaxed \
        --title CTCF_SEACR-wo-IgG_SFRC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_wo-IgG_SFRC_relaxed \
        --title H3K27ac_SEACR_wo-IgG_SFRC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments.SFRC_SEACR-wo-IgG.relaxed_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_wo-IgG_SFRC_relaxed \
        --title RNAPII-S5P_SEACR_wo-IgG_SFRC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SFRC_SEACR-w-IgG.relaxed
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_w-IgG_SFRC_relaxed \
        --title CTCF_SEACR_w-IgG_SFRC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_w-IgG_SFRC_relaxed \
        --title H3K27ac_SEACR_w-IgG_SFRC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments.SFRC_SEACR-w-IgG.relaxed_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_w-IgG_SFRC_relaxed \
        --title RNAPII-S5P_SEACR_w-IgG_SFRC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SRPMC_SEACR-wo-IgG.relaxed
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581589.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581590.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581594.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_wo-IgG_SRPMC_relaxed \
        --title CTCF_SEACR_wo-IgG_SRPMC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581599.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581607.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581608.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581612.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_wo-IgG_SRPMC_relaxed \
        --title H3K27ac_SEACR_wo-IgG_SRPMC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581618.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581622.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_SEACR/SRR8581624.hg19.canonical.clean.fragments.SRPMC_SEACR-wo-IgG.relaxed_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_wo-IgG_SRPMC_relaxed \
        --title RNAPII-S5P_SEACR_wo-IgG_SRPMC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: SRPMC_SEACR-w-IgG.relaxed
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581589.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581590.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581594.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_SEACR_w-IgG_SRPMC_relaxed \
        --title CTCF_SEACR_w-IgG_SRPMC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581599.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581607.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581608.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581612.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_SEACR_w-IgG_SRPMC_relaxed \
        --title H3K27ac_SEACR_w-IgG_SRPMC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581618.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581622.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
                ~/Desktop/GSE126612/peak-bed_SEACR/SRR8581624.hg19.canonical.clean.fragments.SRPMC_SEACR-w-IgG.relaxed_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_SEACR_w-IgG_SRPMC_relaxed \
        --title RNAPII-S5P_SEACR_w-IgG_SRPMC_relaxed \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: MACS2 without IgG
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581589.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581590.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581594.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_MACS2_wo-IgG \
        --title CTCF_MACS2_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581599.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581607.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581608.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581612.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_MACS2_wo-IgG \
        --title H3K27ac_MACS2_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581618.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581622.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS2/SRR8581624.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_MACS2_wo-IgG \
        --title RNAPII-S5P_MACS2_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: MACS2 with IgG
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581589.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581590.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581594.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_MACS2_w-IgG \
        --title CTCF_MACS2_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581599.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581607.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581608.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581612.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_MACS2_w-IgG \
        --title H3K27ac_MACS2_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581618.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581622.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS2/SRR8581624.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_MACS2_w-IgG \
        --title RNAPII-S5P_MACS2_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: MACS3 without IgG
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581589.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581590.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581594.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_MACS3_wo-IgG \
        --title CTCF_MACS3_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581599.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581607.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581608.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581612.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_MACS3_wo-IgG \
        --title H3K27ac_MACS3_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581618.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581622.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed-filtered_MACS3/SRR8581624.hg19.canonical.clean.fragments_wo-IgG_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_MACS3_wo-IgG \
        --title RNAPII-S5P_MACS3_wo-IgG \
        --save-overlaps --figtype pdf --fontsize 24


        # Intervene: MACS3 with IgG
        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581589.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581590.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581594.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        --names=SRR8581589,SRR8581590,SRR8581594 \
        --output $intervene_replicates_dir/CTCF_MACS3_w-IgG \
        --title CTCF_MACS3_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581599.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581607.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581608.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581612.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        --names=SRR8581599,SRR8581607,SRR8581608,SRR8581612 \
        --output $intervene_replicates_dir/H3K27ac_MACS3_w-IgG \
        --title H3K27ac_MACS3_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24

        intervene venn \
        --input ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581618.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581622.hg19.canonical.clean.fragments_w-IgG_whole.bed \
                ~/Desktop/GSE126612/peak-bed_MACS3/SRR8581624.hg19.canonical.clean.fragments_w-IgG_whole.bed \
        --names=SRR8581618,SRR8581622,SRR8581624 \
        --output $intervene_replicates_dir/RNAPII-S5P_MACS3_w-IgG \
        --title RNAPII-S5P_MACS3_w-IgG \
        --save-overlaps --figtype pdf --fontsize 24
) 2>$log_dir/$log_file
