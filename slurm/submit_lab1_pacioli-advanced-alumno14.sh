#!/bin/bash
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab1FLR
#SBATCH -J fastqc-output.std
#SBATCH --output=fastqc-output.std.out
#SBATCH --cpus-per-task=1
#SBATCH --output=fastqc-output.std

#Cargar el modulo fastqc
module load fastqc/0.11.8

# Sacar por pantalla el modelo de fastqc
echo "version:"
fastqc -v

# Ejecuta la aplicación fastqc secuencialmente sobre cada uno de los 4 ficheros de muestra midiendo
# el tiempo total empleado usando el comando time
echo "tiempo empleado en la ejecución de 4 ficheros:"
time fastqc fastq/Sample1.fastq; fastqc fastq/Sample2.fastq; fastqc fastq/Sample3.fastq; fastqc fastq/Sample4.fastq


# Utiliza un bucle for para ejecutar 10 veces la aplicación fastqc sobre cada uno de los 4 ficheros
# de muestra midiendo el tiempo total empleado usando el comando time
echo "tiempo empleado en la ejecución de 4 ficheros 10 veces:"
time for (( i=1; i <= 10; i++ ))
do
fastqc fastq/Sample1.fastq; fastqc fastq/Sample2.fastq; fastqc fastq/Sample3.fastq; fastqc fastq/Sample4.fastq
done
module unload fastqc/0.11.8
