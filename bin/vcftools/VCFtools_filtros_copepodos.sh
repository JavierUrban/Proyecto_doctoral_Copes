
##Cargar docker biocontainers/vcftools:0.1.15 en un volumen con el archivo variants.copepods.vcf
vcftools="docker run --rm -v /Users/javier/Documents/docker/ProyectoFinal:/bin biocontainers/vcftools:0.1.15 vcftools"
#read .vcf file
$vcftools --vcf data/variants.copepodos.vcf
#calculates the frequency of alleles in the file variants.copepodos.vcf
$vcftools --vcf data/variants.copepodos.vcf --freq --out data/frecuencias_copes
 #filter for allele frequency less than equal 0.5, filtered by missing data,
$vcftools --vcf data/variants.copepodos.vcf --max-maf 0.5 --max-missing 1.0 --out --recode
#After filtering, kept 11254 out of a possible 109299 Sites genera un output out.recode.vcf
#convert vcf files to plink format
$vcftools --vcf data/variants.copepodos.vcf --plink
$vcftools --vcf data/out.recode.vcf --plink
