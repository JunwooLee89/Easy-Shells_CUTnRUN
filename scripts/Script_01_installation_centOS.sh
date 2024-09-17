#!/bin/bash

##########
# installation helper for Centos Linux OS
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
    sudo yum update -y

# Install SRA Toolkit
    echo "Installing SRA Toolkit..."
    sudo yum install -y sra-tools

# Install FastQC
    echo "Installing FastQC..."
    sudo yum install -y fastqc

# Install Cutadapt
    echo "Installing Cutadapt..."
    pip install cutadapt

# Install Trim Galore
    echo "Installing Trim Galore..."
    sudo yum install -y epel-release
    sudo yum install -y trim-galore

# Install Bowtie2
    echo "Installing Bowtie2..."
    sudo yum install -y bowtie2

# Install Samtools
    echo "Installing Samtools..."
    sudo yum install -y samtools

# Install BEDTools
    echo "Installing BEDTools..."
    sudo yum install -y bedtools

# Install bedGraphToBigWig
    echo "Installing bedGraphToBigWig..."
    sudo yum install -y kenttools

# Install Picard tools for CollectInsertSizeMetrics
    echo "Installing Picard tools (CollectInsertSizeMetrics)..."
    sudo yum install -y picard

# Install MACS2
    echo "Installing MACS2..."
    pip install macs2

# Install MACS3
    echo "Installing MACS3..."
    pip install macs3==3.0.2

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
