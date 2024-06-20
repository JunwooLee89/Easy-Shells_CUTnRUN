###########
### Script_12. comparison between samples
### This script compares between samples to show similarity between replicates and difference from samples
### Subtracted bigwig files will be used to compare between replicates and samples 
### This script was wrote to create one working directory in "~/Desktop". You can change the working directory to meet your needs.
### Installing deeptools: https://deeptools.readthedocs.io/en/develop/content/installation.html
###########
### Creating directory to save correlation comparison results
mkdir -p ~/Desktop/GSE126612/correlation-comparison # You can change the output directory to meet your needs

### Setting the bigwig folder as working directory
cd ~/Desktop/GSE126612/bigwig # You can change the output directory to meet your needs

### for-loop to build the list of bigwig files 
for bigwig_file in *_SRPMC.bw; do
    bigwig_files="$bigwig_files $bigwig_file"
done

printf "\nbigwig files: %s\n" "$bigwig_files"

### Run multiBigwigSummary
multiBigwigSummary bins -b $bigwig_files -o ~/Desktop/GSE126612/correlation-comparison/bigwig_summary_bs500.npz -p 12 -bs 500
multiBigwigSummary bins -b $bigwig_files -o ~/Desktop/GSE126612/correlation-comparison/bigwig_summary_bs1000.npz -p 12 -bs 2000
multiBigwigSummary bins -b $bigwig_files -o ~/Desktop/GSE126612/correlation-comparison/bigwig_summary_bs5000.npz -p 12 -bs 5000
multiBigwigSummary bins -b $bigwig_files -o ~/Desktop/GSE126612/correlation-comparison/bigwig_summary_bs10000.npz -p 12 -bs 10000

### Setting the comparison folder as working directory
cd ~/Desktop/GSE126612/correlation-comparison

### Run plotCorrelation for bigwig_summary.npz
plotCorrelation -in bigwig_summary_bs500.npz -c pearson -p heatmap -o plot_pearson_bigwig_summary_bs500.pdf -T "SRPMC normalized, bin 500, pearson" \
    --colorMap bwr --skipZeros --removeOutliers -min 0 -max 1 --plotNumbers --plotHeight 28.5 --plotWidth 33
plotCorrelation -in bigwig_summary_bs1000.npz -c pearson -p heatmap -o plot_pearson_bigwig_summary_bs1000.pdf -T "SRPMC normalized, bin 2000, pearson" \
    --colorMap bwr --skipZeros --removeOutliers -min 0 -max 1 --plotNumbers --plotHeight 28.5 --plotWidth 33
plotCorrelation -in bigwig_summary_bs5000.npz -c pearson -p heatmap -o plot_pearson_bigwig_summary_bs5000.pdf -T "SRPMC normalized, bin 5000, pearson" \
    --colorMap bwr --skipZeros --removeOutliers -min 0 -max 1 --plotNumbers --plotHeight 28.5 --plotWidth 33
plotCorrelation -in bigwig_summary_bs10000.npz -c pearson -p heatmap -o plot_pearson_bigwig_summary_bs10000.pdf -T "SRPMC normalized, bin 10000, pearson" \
    --colorMap bwr --skipZeros --removeOutliers -min 0 -max 1 --plotNumbers --plotHeight 28.5 --plotWidth 33

### Run plotPCA for bigwig_summary.npz
plotPCA -in bigwig_summary_bs500.npz -o plot_PCA_bigwig_summary_bs500.pdf -T "SRPMC normalized, bin 500" \
    --ntop 10000 --transpose --plotHeight 30 --plotWidth 32.5
plotPCA -in bigwig_summary_bs1000.npz -o plot_PCA_bigwig_summary_bs1000.pdf -T "SRPMC normalized, bin 2000" \
    --ntop 10000 --transpose --plotHeight 30 --plotWidth 32.5
plotPCA -in bigwig_summary_bs5000.npz -o plot_PCA_bigwig_summary_bs5000.pdf -T "SRPMC normalized, bin 5000" \
    --ntop 10000 --transpose --plotHeight 30 --plotWidth 32.5
plotPCA -in bigwig_summary_bs10000.npz -o plot_PCA_bigwig_summary_bs10000.pdf -T "SRPMC normalized, bin 10000" \
    --ntop 10000 --transpose --plotHeight 30 --plotWidth 32.5


### for-loop to build the list of subtracted bigwig files 
for bigwig_file in *_SRPMC.subtracted.bw; do
    bigwig_files="$bigwig_files $bigwig_file"
done

printf "\nbigwig files: %s\n" "$bigwig_files"

### Run multiBigwigSummary
multiBigwigSummary bins -b $bigwig_files -o ~/Desktop/GSE126612/correlation-comparison/subtracted_bigwig_summary_bs500.npz -p 12 -bs 500
multiBigwigSummary bins -b $bigwig_files -o ~/Desktop/GSE126612/correlation-comparison/subtracted_bigwig_summary_bs1000.npz -p 12 -bs 2000
multiBigwigSummary bins -b $bigwig_files -o ~/Desktop/GSE126612/correlation-comparison/subtracted_bigwig_summary_bs5000.npz -p 12 -bs 5000
multiBigwigSummary bins -b $bigwig_files -o ~/Desktop/GSE126612/correlation-comparison/subtracted_bigwig_summary_bs10000.npz -p 12 -bs 10000

### Setting the comparison folder as working directory
cd ~/Desktop/GSE126612/correlation-comparison

### Run plotCorrelation for bigwig_summary.npz
plotCorrelation -in subtracted_bigwig_summary_bs500.npz -c pearson -p heatmap -o plot_pearson_bigwig_summary_subracted_bs500.pdf -T "SRPMC normalized, subtracted, bin 500, pearson" \
    --colorMap bwr --skipZeros --removeOutliers -min 0 -max 1 --plotNumbers --plotHeight 28.5 --plotWidth 33
plotCorrelation -in subtracted_bigwig_summary_bs1000.npz -c pearson -p heatmap -o plot_pearson_bigwig_summary_subracted_bs1000.pdf -T "SRPMC normalized, subtracted, bin 2000, pearson" \
    --colorMap bwr --skipZeros --removeOutliers -min 0 -max 1 --plotNumbers --plotHeight 28.5 --plotWidth 33
plotCorrelation -in subtracted_bigwig_summary_bs5000.npz -c pearson -p heatmap -o plot_pearson_bigwig_summary_subracted_bs5000.pdf -T "SRPMC normalized, subtracted, bin 5000, pearson" \
    --colorMap bwr --skipZeros --removeOutliers -min 0 -max 1 --plotNumbers --plotHeight 28.5 --plotWidth 33
plotCorrelation -in subtracted_bigwig_summary_bs10000.npz -c pearson -p heatmap -o plot_pearson_bigwig_summary_subracted_bs10000.pdf -T "SRPMC normalized, subtracted, bin 10000, pearson" \
    --colorMap bwr --skipZeros --removeOutliers -min 0 -max 1 --plotNumbers --plotHeight 28.5 --plotWidth 33

### Run plotPCA for bigwig_summary.npz
plotPCA -in subtracted_bigwig_summary_bs500.npz -o plot_PCA_bigwig_summary_subtracted_bs500.pdf -T "SRPMC normalized, subtracted, bin 500" \
    --ntop 10000 --transpose --plotHeight 30 --plotWidth 32.5
plotPCA -in subtracted_bigwig_summary_bs1000.npz -o plot_PCA_bigwig_summary_subtracted_bs1000.pdf -T "SRPMC normalized, subtracted, bin 2000" \
    --ntop 10000 --transpose --plotHeight 30 --plotWidth 32.5
plotPCA -in subtracted_bigwig_summary_bs5000.npz -o plot_PCA_bigwig_summary_subtracted_bs5000.pdf -T "SRPMC normalized, subtracted, bin 5000" \
    --ntop 10000 --transpose --plotHeight 30 --plotWidth 32.5
plotPCA -in subtracted_bigwig_summary_bs10000.npz -o plot_PCA_bigwig_summary_subtracted_bs10000.pdf -T "SRPMC normalized, subtracted, bin 10000" \
    --ntop 10000 --transpose --plotHeight 30 --plotWidth 32.5

