#!/bin/bash
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab2FLR
#SBATCH -J submit_lab1
#SBATCH --output=%u-%j.out
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=4
#SBATCH --mail-type=NONE

echo
echo "1)"
echo
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
./helloflops3-AVX

echo
echo "2)"
echo
for i in 1 2 4
do
   	echo "Ejecutando con OMP_NUM_THREADS=$i"
	export OMP_NUM_THREADS=$i
	./helloflops3-AVX
   	echo
done
echo
echo "3)"
echo
echo "tiempo secuencial"
# Cargar el modulo fastqc
module load fastqc/0.11.8
time fastqc fastq/Sample*.fastq
echo
echo "tiempo paralelo"

time fastqc -t 4 fastq/Sample*.fastq

echo
echo "4)"
echo
env | grep SLURM
