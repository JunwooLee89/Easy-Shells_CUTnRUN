#!/bin/bash

##########
# installation helper for Ubuntu OS
# program list
    # SRA Toolkit
    # FastQC
    # Cutadapt
    # Trim_Galore
    # bowtie2
    # Samtools
    # bedtools
    # bedGraphToBigWig
    # Picard CollectInsertSizeMetrics
    # MACSv2
    # MACSv3
    # SEACRv1.3
    # Intervene
    # Deeptoolsv3
# You need to install some of these programs as root user. Therefore, you need to type root password to run this installation script.
# If you face any issue with installation, don't hesitate to ask help in https://github.com/JunwooLee89/Easy-Shells_CUTnRUN/issues
##########
# Update system
    echo "Updating system..."
    sudo apt update && sudo apt upgrade -y

# Install python3 pip
    echo "Installing python3 pip..."
    sudo apt install -y python3-pip

# Install SRA Toolkit
    echo "Installing SRA Toolkit..."
    sudo apt install -y sra-toolkit

# Install FastQC
    echo "Installing FastQC..."
    sudo apt install -y fastqc

# Install Cutadapt
    echo "Installing Cutadapt..."
    pip install cutadapt

# Install Trim Galore
    echo "Installing Trim Galore..."
    sudo apt install -y trim-galore

# Install Bowtie2
    echo "Installing Bowtie2..."
    sudo apt install -y bowtie2

# Install Samtools
    echo "Installing Samtools..."
    sudo apt install -y samtools

# Install BEDTools
    echo "Installing BEDTools..."
    sudo apt install -y bedtools

# Install bedGraphToBigWig
    echo "Installing bedGraphToBigWig..."
    sudo apt install -y ucsc-kent-utils

# Install Picard tools for CollectInsertSizeMetrics
    echo "Installing Picard tools..."
    sudo apt install -y picard-tools

# Install MACS2
    echo "Installing MACS2..."
    pip install macs2

# Install MACS3
    echo "Installing MACS3..."
    pip install macs3

# Install SEACR
    echo "Installing SEACR 1.3..."
    wget https://github.com/FredHutch/SEACR/archive/refs/tags/v1.3.tar.gz
    tar -zxvf v1.3.tar.gz
    sudo mv SEACR-1.3 /usr/local/bin/SEACR
    sudo chmod +x /usr/local/bin/SEACR/seacr.sh

# Install Intervene
    echo "Installing Intervene..."
    pip install intervene

# Install DeepTools
    echo "Installing DeepTools..."
    pip install deeptools

# Final message
    echo "Installation complete!"
