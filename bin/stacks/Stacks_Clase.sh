#!/bin/bash
echo "Empieza a las";
date;
mkdir div_files;
mkdir outfiles_{1..6};
denovo_map.pl --samples fastq_files/ --popmap fastq_files/popmap_file.txt -o outfiles_1/ -M 2 -n 1 -X "populations: -r 0.50 --min_maf 0.01 --genepop";
mv outfiles_1/populations.haps.genepop div_files/OUTfile_1.gen;
grep -A 10 "Depths of Coverage" outfiles_1/denovo_map.log | sed 's/x//' > div_files/Depht_1.txt
denovo_map.pl --samples fastq_files/ --popmap fastq_files/popmap_file.txt -o outfiles_2/ -M 8 -n 1 -X "populations: -r 0.50 --min_maf 0.01 --genepop";
mv outfiles_2/populations.haps.genepop div_files/OUTfile_2.gen;
grep -A 10 "Depths of Coverage" outfiles_2/denovo_map.log | sed 's/x//' > div_files/Depht_2.txt
denovo_map.pl --samples fastq_files/ --popmap fastq_files/popmap_file.txt -o outfiles_3/ -M 2 -n 8 -X "populations: -r 0.50 --min_maf 0.01 --genepop";
mv outfiles_3/populations.haps.genepop div_files/OUTfile_3.gen;
grep -A 10 "Depths of Coverage" outfiles_3/denovo_map.log | sed 's/x//' > div_files/Depht_3.txt
denovo_map.pl --samples fastq_files/ --popmap fastq_files/popmap_file.txt -o outfiles_4/ -M 5 -n 5 -X "populations: -r 0.50 --min_maf 0.01 --genepop";
mv outfiles_4/populations.haps.genepop div_files/OUTfile_4.gen;
grep -A 10 "Depths of Coverage" outfiles_4/denovo_map.log | sed 's/x//' > div_files/Depht_4.txt
denovo_map.pl --samples fastq_files/ --popmap fastq_files/popmap_file.txt -o outfiles_5/ -M 9 -n 9 -X "populations: -r 0.50 --min_maf 0.01 --genepop";
mv outfiles_5/populations.haps.genepop div_files/OUTfile_5.gen;
grep -A 10 "Depths of Coverage" outfiles_5/denovo_map.log | sed 's/x//' > div_files/Depht_5.txt
ref_map.pl --samples ref_gen/ --popmap ref_gen/popmap_file.txt -o outfiles_6/ -X "populations: -r 0.70 --min_maf 0.01 --genepop" 
mv outfiles_6/populations.haps.genepop div_files/OUTfile_6.gen;
grep -A 10 "n_used_fw_reads" outfiles_6/gstacks.log.distribs | cut -f 1,5 > div_files/Depht_6.txt
sleep 3
echo "Stack listo!"
Rscript Clase.r
echo "No te preocupes por los warnings"
echo "Resultados en el directorio -div_files-"
echo "Listo a las";
date;
