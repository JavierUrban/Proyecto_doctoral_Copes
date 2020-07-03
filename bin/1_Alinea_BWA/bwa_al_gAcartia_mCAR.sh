
M_muestras="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24"
ref=../Aline/Acartia_tonsa_copeGCA_900241095.1_Aton1.0_genomic.fna
for X in $M_muestras ;do
    mues=../Aline/datos_gbs/CAR$X*
    out=aln_rC_CAR$X.sam
    bwa mem $ref $mues > $out
done
