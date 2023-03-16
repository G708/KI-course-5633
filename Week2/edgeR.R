library(edgeR)

###################################
# loading data
###################################
load("/home/oba/Tutorials/KI-course-5633/data/ExpressionTables.RData")
load("/home/oba/Tutorials/KI-course-5633/data/Annotation.RData")
load("/home/oba/Tutorials/KI-course-5633/data/Cohort.RData")


##################################
# DE analysis of paired samples
###################################
IDs<-paste(cohort$OB_NO,as.factor(cohort$IDs),sep=".")
Condition<-cohort$newcond2
df.pairs<-phase2.female.counts

# DE Analysis
y <- DGEList(counts=df.pairs,group = cohort$newcond2)
design<-model.matrix(~0+Condition+IDs,data=y$samples)
design <- design[,!grepl("f0", colnames(design))]
design<-design[, colSums(design != 0) > 0]
colnames(design)<-make.names(colnames(design))
y <- calcNormFactors(y,norm.method="RLE")
y <- estimateDisp(y,design)
fit <- glmFit(y,design,robust=T)
my.contrasts<-makeContrasts(
  HivsF.NO=ConditionNO.h0,
  HivsF.OB.0=ConditionOBESE.h0,
  HivsF.OB.2=ConditionOBESE.h2-ConditionOBESE.f2,
  levels=design)

contrasts<-colnames(my.contrasts)
myfun <- function(filex) {
  print(filex)
  lrt <- glmLRT(fit, contrast=my.contrasts[,filex])
  out.top=topTags(lrt,n=Inf,adjust.method='BH')
  out.adj=out.top$table
  out.adj.1<-out.adj
  if(nrow(out.adj.1)==0){
    return()
  }else{
    out.adj.1$Contrast<-filex
    out.adj.1$TC<-rownames(out.adj.1)
    out.adj.1$updown<-ifelse(out.adj.1$logFC>0,"up","down")
    return(out.adj.1)
  }
}

y.list<-(lapply(contrasts, myfun))
tab<-do.call(rbind, y.list)
tab$Sign<-ifelse(tab$FDR<0.05,"sign","no")
res.count <- table(tab[tab$Sign=="sign",]$Contrast,tab[tab$Sign=="sign",]$updown )
res.count 

save(tab,file="/home/oba/Tutorials/KI-course-5633/data/DE_23NO_23OB_23POB.RData")
