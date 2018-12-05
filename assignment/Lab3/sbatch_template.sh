#!/bin/bash
# This is the template sbatch script for Lab3 at BB2491 fall 2018

# Run the script like this:
# sbatch <OPTIONS> sbatch_template.sh
# Where the OPTIONS are all of:
# -A g2018023 -t 2:00:00 -p node -n 8 --res g2018023_20 -o my_job_name.out
#
# You may change the job name (-o my_job_name.out) to anything you like.

# Any line that starts with '# ' (dash followed by space) is a comment and will
# not be executed

# First add the modules needed for the program(s) your're about to run:
module load bioinfo-tools
module load bwa
module load samtools
module load BEDTools
module load python
module load bowtie/1.1.2
module load tophat
module load htseq
module load gcc

# cd to the directory where the data is (of course, use your own user name):
cd ~/Lab3/

# Then list the commands that you would like to run. 
# If you'd like to add more jobs, enter them on the following lines. 

## PART A: RNA-SEQ
# To help you out, the first command of the RNA-seq part is provided:
#tophat -o ~/Lab3/results/healthTiss9F \
#     -p 8 \
#     --bowtie1 \
#     --solexa1.3-quals \
#     /proj/g2018023/BB2491/LAB3/bowtie_index/hg19 \
#     ~/Lab3/rnaseq.healthTiss9F.fastq

#for BAM in ~/Lab3/results/*/accepted_hits.bam; do
#    SAMPLE=$(dirname $BAM)
#    SAMPLE2=$(basename $SAMPLE)
#    htseq-count -m intersection-strict \
#        -t exon \
#        -i gene_id \
#        -f bam \
#        $BAM \
#        /proj/g2018023/BB2491/LAB3/hg19.RefSeq.refFlat.gtf \
#            > ~/Lab3/results/counts.${SAMPLE2}.txt
#done

#htseq-count -m intersection-strict -t exon -i gene_id ~/Lab3/results/healthTiss9F/accepted_hits.sam /proj/g2018023/BB2491/LAB3/hg19.RefSeq.refFlat.gtf > ~/Lab3/my_htseqcount_out.txt


## PART B: ChIP-SEQ
# NOTE: we use Galaxy for this part of the computer exercise; see the lab
# instructions. In case MACS had been installed, the following line would have
# started the peak calling:
# macs -t Sp1_sample.bed --name NAME_OF_OUTPUT --pvalue=1e-6


## PART C: Differential expression with DESeq
