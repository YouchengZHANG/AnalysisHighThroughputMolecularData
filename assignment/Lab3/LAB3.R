


source("http://www.bioconductor.org/biocLite.R")
biocLite("DESeq")

library(DESeq)

RIN_BB2491 <- read.table('RIN_BB2491.count',header = TRUE)

tail(RIN_BB2491)
max(RIN_BB2491[1:21958,2:7], na.rm=TRUE)

RIN_BB2491_max <- RIN_BB2491[1:21958,2:7]
max(RIN_BB2491_max, na.rm=TRUE) # row 17340
RIN_BB2491

sum(RIN_BB2491_max ==0)

conds = c("RIN10","RIN10","RIN10","RIN6","RIN6","RIN6") 
cds = newCountDataSet(RIN_BB2491_max,conds) 
cds = estimateSizeFactors(cds) 
cds = estimateDispersions(cds) 
res = nbinomTest(cds,"RIN10","RIN6")

res_no_NA <- na.omit(res)
rownames(res_no_NA) <- seq(length=nrow(res_no_NA))
res_no_NA_FDR5 <- res_no_NA[res_no_NA$padj < 0.05, ]
dim(res_no_NA_FDR5)


par(mfrow=c(1,3), mar=c(4,4,2,1))
plot(x=log10(res_no_NA$baseMean),y=res_no_NA$log2FoldChange,xlim = c(-1,5),ylim=c(-3,3),pch =20,cex=0.1,xlab = 'logbaseMean',ylab = 'logFC')
plot(x=log10(res_no_NA$baseMeanA),y=res_no_NA$log2FoldChange,xlim = c(-1,5),ylim=c(-3,3),pch =20,cex=0.1,xlab = 'logbaseMeanA',ylab = 'logFC')
plot(x=log10(res_no_NA$baseMeanB),y=res_no_NA$log2FoldChange,xlim = c(-1,5),ylim=c(-3,3),pch =20,cex=0.1,xlab = 'logbaseMeanB',ylab = 'logFC')








