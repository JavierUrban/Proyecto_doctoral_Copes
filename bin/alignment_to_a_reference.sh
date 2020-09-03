#!/bin/bash
##download repositories docker
#sequences alignment to a reference
docker pull biocontainers/bwa:v0.7.17_cv1
docker run -v /Volumes/SALVA_07: -it biocontainers/bwa:v0.7.17_cv1 bash
docker pull biocontainers/samtools:v1.9-4-deb_cv1
docker run -v /Volumes/SALVA_07: -it biocontainers/samtools:v1.9-4-deb_cv1 bash

## Sequence alignment to a reference genome (Acartia) with bwa using the mem function
bwa index ~/Acartia_tonsa_copeGCA_900241095.1_Aton1.0_genomic.fna
M_muestras="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24"
ref=~/Acartia_tonsa_copeGCA_900241095.1_Aton1.0_genomic.fna

for X in $M_muestras ;do
    mues=~/ATX$X*
    out=aln_rC_ATX$X.sam
    bwa mem $ref $mues > $out
done

docker pull biocontainers/samtools:v1.9-4-deb_cv1
docker run -v /Volumes/SALVA_07: -it biocontainers/samtools:v1.9-4-deb_cv1 bash

##Use samtools to index, sort and convert to bam format
M_muestras="1_ 2_ 3_ 4_ 5_ 6_ 7_ 8_ 9_ 10_ 11_ 12_ 13_ 14_ 15_ 16_ 17_ 18_ 19_ 20_ 21_ 22_ 23_24"

for X in $M_muestras ;do
        samtools view -S -b ~/ATX$X*.sam > ~/ATX$X.aliRc.bam

        samtools sort ~/ATX$X.aliRc.bam -o ~/ATX$X.aliRc.sorted.bam

        samtools index ~/ATX$X.aliRc.sorted.bam

done
