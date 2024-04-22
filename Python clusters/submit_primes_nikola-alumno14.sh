#!/bin/bash

#SBATCH -p hpc-bio-nikola-gpu
#SBATCH --chdir=/home/alumno14/lab3FLR
#SBATCH --job-name=primes
#SBATCH --output=nikola_%u_%j.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1


module load anaconda/2023.03

# Intervalos 
interval_1="$1"
interval_2="$2"

# Cálculo
echo "El intervalo elegido para el cálculo de números primos es: [${interval_1}, ${interval_2}]"
ipython primes-exercise-reducido-alumno14.ipynb -- $interval_1 $interval_2
echo
echo "Ejecutado en $SLURMD_NODENAME"
