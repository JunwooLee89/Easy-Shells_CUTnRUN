#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.

##########
# installation helper for macOS
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
# Homebrew is used to install some of the programs easily.
# If you face any issue with installation, don't hesitate to ask help in https://github.com/JunwooLee89/Easy-Shells_CUTnRUN/issues
##########
# Install Homebrew
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update Homebrew
    echo "Updating Homebrew..."
    brew update

# Install SRA Toolkit
    echo "Installing SRA Toolkit..."
    brew install sratoolkit

# Install FastQC
    echo "Installing FastQC..."
    brew install fastqc

# Install Cutadapt
    echo "Installing Cutadapt..."
    pip install cutadapt

# Install Trim Galore
    echo "Installing Trim Galore..."
    brew install trim-galore

# Install Bowtie2
    echo "Installing Bowtie2..."
    brew install bowtie2

# Install Samtools
    echo "Installing Samtools..."
    brew install samtools

# Install BEDTools
    echo "Installing BEDTools..."
    brew install bedtools

# Install bedGraphToBigWig
    echo "Installing bedGraphToBigWig..."
    brew install kent-tools

# Install Picard tools for CollectInsertSizeMetrics
    echo "Installing Picard tools..."
    brew install picard-tools

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
    mv SEACR-1.3 /usr/local/bin/SEACR
    chmod +x /usr/local/bin/SEACR/SEACR_1.3.sh

# Install Intervene
    echo "Installing Intervene..."
    pip install intervene

# Install DeepTools
    echo "Installing DeepTools..."
    pip install deeptools

# Final message
    echo "Installation complete!"
