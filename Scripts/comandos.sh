# copiar muscle

muscle2=/u/scratch/d/dechavez/Bioinformatica-PUCE/RepotenBio/Oli/muscle3.8.31_i86linux64
cp $muscle2 ./

# Descargar archivos Fastq desde ENA para SRA de E.coli

wget https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR258/003/SRR2584863/SRR2584863_1.fastq.gz
wget https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR258/003/SRR2584863/SRR2584863_2.fastq.gz

# Descargar archivos Fastq desde ENA parRC. jejuni

wget https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR312/024/SRR31218424/SRR31218424_1.fastq.gz
wget https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR312/024/SRR31218424/SRR31218424_2.fastq.gz

# Descargar genomas de referencia para E.coli, descomprimir y cambiar nombre

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz
gunzip GCF_000005845.2_ASM584v2_genomic.fna.gz
mv GCF_000005845.2_ASM584v2_genomic.fna ecoli_genome.fasta

# Descargar genomas de referencia para Campylobacter jejuni, descomprimir y cambiar nombre

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/009/085/GCF_000009085.1_ASM908v1/GCF_000009085.1_ASM908v1_genomic.fna.gz
gunzip GCF_000009085.1_ASM908v1_genomic.fna.gz
mv GCF_000009085.1_ASM908v1_genomic.fna jejuni_genome.fasta

# Cargar programas bwa y samtools

module load bwa/0.7.17
module load samtools/

# Indexar los genomas para E.coli y C.jejuni

bwa index ecoli_genome.fasta
samtools faidx ecoli_genome.fasta

bwa index jejuni_genome.fasta
samtools faidx jejuni_genome.fasta

# Transformar los archivos de E.coli a Bam y alinear

bwa mem ecoli_genome.fasta SRR2584863_1.fastq.gz SRR2584863_2.fastq.gz > ecoli.sam
samtools view -bS ecoli.sam > ecoli.bam
samtools sort ecoli.bam -o ecoli_sorted.bam
samtools index ecoli_sorted.bam

# Transformar los archivos de C.jejuni a Bam y alinear 

bwa mem jejuni_genome.fasta SRR31218424_1.fastq.gz SRR31218424_2.fastq.gz > jejuni.sam
samtools view -bS jejuni.sam > jejuni.bam
samtools sort jejuni.bam -o jejuni_sorted.bam
samtools index jejuni_sorted.bam

# Extraer el gen rpoB de las locaciones del genoma 

samtools faidx ecoli_genome.fasta NC_000913.3:759933-763325 > rpoB_ecoli.fasta
samtools faidx jejuni_genome.fasta NC_002163.1:840500-843900 > rpoB_jejuni.fasta

# Alinear con muscle 
cat rpoB_ecoli.fasta rpoB_jejuni.fasta > rpoB_combined.fasta
./muscle3.8.31_i86linux64 -in rpoB_combined.fasta -out muscle_rpoB.fasta
