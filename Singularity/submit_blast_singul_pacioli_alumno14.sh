#!/bin/bash

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab6-singularity
#SBATCH -J blast-output.std
#SBATCH --output=result-blast.out
#SBATCH --error=blast-output.err
#SBATCH --cpus-per-task=1

#cargar modulo singularity
module load singularity/3.7.0 

# Comandos para ejecutar dentro del contenedor de Singularity
singularity exec /nas/hdd-0/singularity_images/blast_2.9.0--pl526h3066fca_4.sif bash -c .
    # Descomprimir la base de datos usando gzip
    gzip -d zebrafish.1.protein.faa.gz

    # Preparar la base de datos zebrafish usando makeblastdb
    makeblastdb -in zebrafish.1.protein.faa -dbtype prot

    # Realizar la alineación usando blastp
    blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results-blast.txt
