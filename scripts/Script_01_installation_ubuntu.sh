##########
# Script_01. Install programs required for Easy_Shells_CUTnRUN
# OS: macOS
# This script is written to basic, limited support to install programs required for Easy_Shells_CUTnRUN for macOS system
# This script is written to download majority of the programs at ~/program directory.
# For proper installation, users may need to check and follow the original installation guideline written in the progam website
# If you need a help, you can write down request for supporting in https://github.com/JunwooLee89/Easy-Shells_CUTnRUN/issues
##########
#!/bin/bash #This clarify the type of this script as bash script. It does not required actual operation of the bash script.
# 1. Setting shell
    # 
    chsh -s $(which bash)


# 2. Install SRAtoolkit
    # SRAtookit supports downloading publicly available dataset from 'Gene Expression Omnibus (GEO)'
    # Installation guideline: https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit

    # Setup home directory as current working directory
    cd ~

    # if-esle statement for installation
    # It checks the existance and availability first
    # If the program is installed and executable, it skips the installation step of this program.
    # If the program is not installed, download and install the program
    if command -v fastq-dump &> /dev/null; then
        
        # Print to show that the program is installed
        echo "SRAtoolkit is installed."
    else
        # Print to show that the program is not installed yet
        echo "SRAtoolkit is not installed."

        # Create program folder under home directory
        mkdir -p 

        # Download the program
        wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-mac64.tar.gz -O  

        # unzip the 

    fi
