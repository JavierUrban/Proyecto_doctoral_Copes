
####Proyect copépodos######
##Javier Urbán #########
library(adegenet)
library(vcfR)
library(poppr)
library(ape)
library(RColorBrewer)

##load file with filtered variants in VCFtools
copepods.vcf <- read.vcfR("../data/out.recode.vcf")
copepods.vcf
##load table with population data
pop_names <- read.table("../data/pop_nom_copepods.txt", sep = "\t", header = TRUE)
all(colnames(copepods.vcf@gt)[-1]==pop_names$Individula.ID)
##Create genligth object with SNPs and delimited populations to use adegenet and poppr
gl.copepods <- vcfR2genlight(copepods.vcf)
##indicate ploidy and concatenate data from SNPs and populations
##check that the data is correct
ploidy(gl.copepods) <- 2
pop(gl.copepods) <- pop_names$Pop
gl.copepods

##Calculate genetic distance for analysis of genetic structure 
copes.dis <- dist(gl.copepods)
copes.dis <- poppr::bitwise.dist(gl.copepods) 
##Genetic distance tree
PhyloCopes <- aboot(gl.copepods, tree = "upgma", distance = bitwise.dist, sample = 100, showtree = F, cutoff = 50, quiet = T)
cols <- brewer.pal(n = nPop(gl.copepods), name = "Dark2")
plot.phylo(PhyloCopes, cex = 0.9, font = 2, adj = 0, tip.color = cols[pop(gl.copepods)])
nodelabels(PhyloCopes$node.label, adj = c(1, -0.4), frame = "n", xpd=TRUE)
legend('topleft', legend = c("ATX", "CAR", "PRE", "QUE"), fill = cols, border = TRUE, bty = "n", cex = 1)
axis(side = 1)
title(xlab = "Distancia genética")
##graphical of the population structure based on a minimum spanning network (MSN)
library(igraph)
copes.msn <- poppr.msn(gl.copepods, copes.dis, showplot = FALSE, include.ties = T)
node.size <- rep(2, times = nInd(gl.copepods))
names(node.size) <- indNames(gl.copepods)
vertex_attr(copes.msn$graph)$size <- node.size
set.seed(9)
plot_poppr_msn(gl.copepods, copes.msn, palette = cols)
##Analysis of PCA
##Graphic to PCA eigenvalues
copes.pca <- glPca(gl.copepods, nf = 3)
barplot(100*copes.pca$eig/sum(copes.pca$eig), col = heat.colors(50), main="PCA Eigenvalues")
title(ylab="Porcentaje")
title(xlab = "Eigenvalues", line = 1)
copes.pca.scores <- as.data.frame(copes.pca$scores)
copes.pca.scores$pop <- pop(gl.copepods)
library(ggplot2)
set.seed(9)
plotpca <- ggplot(copes.pca.scores, aes(x=PC1, y=PC2, colour=pop))+
  geom_point(size=3)+ 
  scale_color_manual(values=cols)+
  geom_hline(yintercept=0)+
  geom_vline(xintercept=0)+
  theme_bw()
plotpca
##The DAPC object includes the population membership probability for each sample to each of the predetermined populations
copes.dapc <- dapc(gl.copepods, n.pca = 3, n.da = 2)
scatter(copes.dapc, col=cols, cex=3, legend = TRUE, clabel=F, posi.leg = "bottomleft", scree.pca = TRUE, posi.pca = "topright", cleg = 0.5)





