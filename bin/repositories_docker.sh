

##download repositories docker
#sequences alignment to a reference
docker pull biocontainers/bwa:v0.7.17_cv1
docker run -v /Volumes/SALVA_07: -it biocontainers/bwa:v0.7.17_cv1 bash

docker pull biocontainers/samtools:v1.9-4-deb_cv1
docker run -v /Volumes/SALVA_07: -it biocontainers/samtools:v1.9-4-deb_cv1 bash

docker pull biocontainers/bcftools:v1.9-1-deb_cv1
docker run -v /Volumes/SALVA_07: -it biocontainers/bcftools:v1.9-1-deb_cv1 bash

docker pull biocontainers/bedtools:v2.28.0_cv2
docker run -v /Volumes/SALVA_07: -it biocontainers/bedtools:v2.28.0_cv2 bash

docker pull biocontainers/vcftools:0.1.15
docker run -v /Volumes/SALVA_07: -it biocontainers/vcftools:0.1.15 bash

docker pull ezlabgva/busco:v4.0.5_cv1
docker run -v /Volumes/SALVA_07: -it ezlabgva/busco:v4.0.5_cv1 bash
