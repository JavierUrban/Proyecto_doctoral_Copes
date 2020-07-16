
busco -i genomes/genome_copepodo_masorka.fasta -l arthropoda_odb10 -o buscores -m genome
python3 ../busco/scripts/generate_plot.py -wd python/

 bwa mem ../bwa_Eaff/assemblies_genome_Eurytemora_affinis_fasta/ncbi-genomes-2020-06-26/GCA_000591075.2_Eaff_2.0_genomic.fna.gz ../bwa_Eaff/ATX1_HHTTHBGX5_s_1_fastq.gz > ../bwa_Eaff/BWA_Eaff/al_Eaff_ATX1.sam
