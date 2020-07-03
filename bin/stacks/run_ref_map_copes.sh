##muetras
samples=../ref_cope/BWA_refcop/

##popmap
popmap=../ref_cope/GBS/popmap_refcop.tsv

##salida_de_resultados
res=../ref_cope/stacks.bwa/

##stacks ref map
stacks ref_map.pl --samples $samples --popmap $popmap -o $res 
