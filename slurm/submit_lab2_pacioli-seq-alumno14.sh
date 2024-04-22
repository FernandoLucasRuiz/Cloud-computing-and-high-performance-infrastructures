#!/bin/bash
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab2FLR
#SBATCH -J submit_lab1
#SBATCH --output=%u-%j.out
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE

echo "1) Secuencial"
echo
for (( i=1; i <= 4; i++ ))
	do
	echo "secuencial numero:" $i
	time ./helloflops1-AVX
done


echo
echo "2) Paralelo 1"
echo
for (( i=1; i <= 4; i++ ))
	do
	./helloflops1-AVX &
done
time wait

echo
echo "3) Paralelo 2"
echo
#SBATCH --ntasks=4
time srun ./helloflops1-AVX

echo " Trabajo finalizado"
