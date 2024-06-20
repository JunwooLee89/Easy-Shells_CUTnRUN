##########
### Script_01. Downloading GSE126612 CUT&RUN dataset
### Reference. https://sra-explorer.info/#
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
##########
### Making output directory
mkdir -p ~/Desktop/GSE126612 # You can change the output directory to meet your needs
mkdir -p ~/Desktop/GSE126612/fastq # You can change the output directory to meet your needs

### Setting the created output dicrectory as working directory
cd ~/Desktop/GSE126612/fastq # You can change the output directory to meet your needs

### Download fastq files
#### IgG; background sample; single
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/005/SRR8581615/SRR8581615_1.fastq.gz \
    -o SRR8581615_GSM3609773_K562_IgG_hi-Ca_20180314_SH_HsSc_IgG_0305_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/005/SRR8581615/SRR8581615_2.fastq.gz \
    -o SRR8581615_GSM3609773_K562_IgG_hi-Ca_20180314_SH_HsSc_IgG_0305_Homo_sapiens_OTHER_2.fastq.gz

#### CTCF; chromatin-binding protein; with pA; single
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/004/SRR8581594/SRR8581594_1.fastq.gz \
    -o SRR8581594_GSM3609752_K562_CTCF_pA_hi-Ca_27m_20181026_SH_HsSc_CTCF_27m_1018_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/004/SRR8581594/SRR8581594_2.fastq.gz \
    -o SRR8581594_GSM3609752_K562_CTCF_pA_hi-Ca_27m_20181026_SH_HsSc_CTCF_27m_1018_Homo_sapiens_OTHER_2.fastq.gz

#### CTCF; chromatin-binding protein; with pAG; duplicates
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/000/SRR8581590/SRR8581590_1.fastq.gz \
    -o SRR8581590_GSM3609748_K562_CTCF_pAG_hi-Ca_27m_20181026_SH_HsSc_CTCF_G27m_1018_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/000/SRR8581590/SRR8581590_2.fastq.gz \
    -o SRR8581590_GSM3609748_K562_CTCF_pAG_hi-Ca_27m_20181026_SH_HsSc_CTCF_G27m_1018_Homo_sapiens_OTHER_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/009/SRR8581589/SRR8581589_1.fastq.gz \
    -o SRR8581589_GSM3609748_K562_CTCF_pAG_hi-Ca_27m_20181026_SH_HsSc_CTCF_G27m_1018_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/009/SRR8581589/SRR8581589_2.fastq.gz \
    -o SRR8581589_GSM3609748_K562_CTCF_pAG_hi-Ca_27m_20181026_SH_HsSc_CTCF_G27m_1018_Homo_sapiens_OTHER_2.fastq.gz

#### H3K27Ac; active histone mark; with Abcam; single
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/009/SRR8581599/SRR8581599_1.fastq.gz \
    -o SRR8581599_GSM3609757_K562_H3K27Ac_Abcam_hi-Ca_27min_20180306_SH_HsSc_Kac_27m_0227_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/009/SRR8581599/SRR8581599_2.fastq.gz \
    -o SRR8581599_GSM3609757_K562_H3K27Ac_Abcam_hi-Ca_27min_20180306_SH_HsSc_Kac_27m_0227_Homo_sapiens_OTHER_2.fastq.gz

#### H3K27Ac; active histone mark; with Milli; with pA; single
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/002/SRR8581612/SRR8581612_1.fastq.gz \
    -o SRR8581612_GSM3609770_K562_H3K27Ac_Milli_pA_hi-Ca_27m_20181026_SH_HsSc_KAc_27m_1018_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/002/SRR8581612/SRR8581612_2.fastq.gz \
    -o SRR8581612_GSM3609770_K562_H3K27Ac_Milli_pA_hi-Ca_27m_20181026_SH_HsSc_KAc_27m_1018_Homo_sapiens_OTHER_2.fastq.gz

#### H3K27Ac; active histone mark; with Milli; with pAG; duplicates
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/007/SRR8581607/SRR8581607_1.fastq.gz \
    -o SRR8581607_GSM3609766_K562_H3K27Ac_Milli_pAG_hi-Ca_27m_20181026_SH_HsSc_KAc_G27m_1018_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/007/SRR8581607/SRR8581607_2.fastq.gz \
    -o SRR8581607_GSM3609766_K562_H3K27Ac_Milli_pAG_hi-Ca_27m_20181026_SH_HsSc_KAc_G27m_1018_Homo_sapiens_OTHER_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/008/SRR8581608/SRR8581608_1.fastq.gz \
    -o SRR8581608_GSM3609766_K562_H3K27Ac_Milli_pAG_hi-Ca_27m_20181026_SH_HsSc_KAc_G27m_1018_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/008/SRR8581608/SRR8581608_2.fastq.gz \
    -o SRR8581608_GSM3609766_K562_H3K27Ac_Milli_pAG_hi-Ca_27m_20181026_SH_HsSc_KAc_G27m_1018_Homo_sapiens_OTHER_2.fastq.gz

#### RNAPII-S5P; initiation form of RNAPII; three samples
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/008/SRR8581618/SRR8581618_1.fastq.gz -o SRR8581618_GSM3609776_K562_PolIISer5phos_mouseAb_pAG_hi-Ca_pellet_9min_20190129_SH_HsSc_S5m9p_12119_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/008/SRR8581618/SRR8581618_2.fastq.gz -o SRR8581618_GSM3609776_K562_PolIISer5phos_mouseAb_pAG_hi-Ca_pellet_9min_20190129_SH_HsSc_S5m9p_12119_Homo_sapiens_OTHER_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/002/SRR8581622/SRR8581622_1.fastq.gz -o SRR8581622_GSM3609780_K562_PolIISer5phos_rabbitAb_pAG_hi-Ca_pellet_9min_20190129_SH_HsSc_S5_9p_12119_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/002/SRR8581622/SRR8581622_2.fastq.gz -o SRR8581622_GSM3609780_K562_PolIISer5phos_rabbitAb_pAG_hi-Ca_pellet_9min_20190129_SH_HsSc_S5_9p_12119_Homo_sapiens_OTHER_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/004/SRR8581624/SRR8581624_1.fastq.gz -o SRR8581624_GSM3609782_K562_PolIISer5phos_rabbitAb_pAG_hi-Ca_supn_9min_20190129_SH_HsSc_S5_9_012119_Homo_sapiens_OTHER_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR858/004/SRR8581624/SRR8581624_2.fastq.gz -o SRR8581624_GSM3609782_K562_PolIISer5phos_rabbitAb_pAG_hi-Ca_supn_9min_20190129_SH_HsSc_S5_9_012119_Homo_sapiens_OTHER_2.fastq.gz








