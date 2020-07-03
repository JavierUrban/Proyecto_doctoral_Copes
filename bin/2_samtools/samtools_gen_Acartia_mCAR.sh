M_muestras="1_ 2_ 3_ 4_ 5_ 6_ 7_ 8_ 9_ 10_ 11_ 12_ 13_ 14_ 15_ 16_ 17_ 18_ 19_ 20_ 21_ 22_ 23_ 24_"

for X in $M_muestras ;do
        samtools view -S -b ../sam_Eaff/BWA1506/CAR$X*.sam > ../sam_Eaff/BWA1506/CAR$X.aliRc.bam

        samtools sort ../sam_Eaff/BWA1506/CAR$X.aliRc.bam -o ../sam_Eaff/BWA1506/CAR$X.aliRc.sorted.bam

        samtools index ../sam_Eaff/BWA1506/CAR$X.aliRc.sorted.bam

done
