#!/bin/bash

# This is the template sbatch script for Lab2 at BB2491 spring 2018

# Run the script like this:
# sbatch <OPTIONS> sbatch_template.sh
# Where the OPTIONS are all of:
# –A g2018023 –t 2:00:00 –p node –n 8 --res g2018023_15 –o my_job_name.out
# (you may change the job name "my_job_name.out" to anything you like).

# Any line that starts with '# ' (dash followed by space) is a comment and will not be executed

# Don't forget to add the appropriate modules! See THE MODULE SYSTEM section in the instructions.
module load bioinfo-tools
module load bwa
module load samtools
module load BEDTools

# cd to the directory where the data is (of course, use your own user name):
cd /home/youzha/Lab2/

# Then list the commands that you would like to run. 
# If you'd like to add more jobs, enter them on the following lines. 
# To help you out, the first command of today's lab is provided:
# Make sure to copy the .fastq file to your working directory

# STEP 01
bwa aln /proj/g2018023/BB2491/LAB2/all_chr.hg19.fa ERR001014.filt.fastq > ERR001014.filt.bwa_aln.default.sai
bwa samse /proj/g2018023/BB2491/LAB2/all_chr.hg19.fa ERR001014.filt.bwa_aln.default.sai ERR001014.filt.fastq > ERR001014.filt.bwa_aln.default.sam

# STEP 02
samtools import /proj/g2018023/BB2491/LAB2/all_chr.hg19.fa.fai ERR001014.filt.bwa_aln.default.sam ERR001014.filt.bwa_aln.default.bam
samtools sort -o ERR001014.filt.bwa_aln.default.sorted.bam ERR001014.filt.bwa_aln.default.bam
samtools index ERR001014.filt.bwa_aln.default.sorted.bam

#samtools view ERR001014.filt.bwa_aln.default.sorted.bam
samtools view ERR001014.filt.bwa_aln.default.sorted.bam 'chr22_hg19:18000000-18080000' > chr22_part.ERR001014.filt.bwa_aln.default.sam

# STEP 03
bamToBed -i ERR001014.filt.bwa_aln.default.sorted.bam | awk '/^chr22_hg19/{if($2>=18000000&& $2<=18080000) print "chr22",substr($0,11)}'>chr22_part.ERR001014.filt.bwa_aln.default.sorted.bed

#
