#!/bin/bash

#SBATCH -p hpc-bio-nikola-gpu
#SBATCH --chdir=/home/alumno14/lab3FLR
#SBATCH --job-name=pi_calc_extra
#SBATCH --output=slurm-%j-extra.out
#SBATCH --error=slurm-%j-extra.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

module load anaconda/2023.03

num_dardos=$1

# Que sea un número
if ! [[ "$num_dardos" =~ ^[0-9]+$ ]]; then
    echo "Error: No se ha proporcionado un número válido."
    exit 1
fi

# Ejecución de los distintos archivos python

echo "Ejecutando cálculo de Pi con $num_dardos dardos:"
echo
echo "Con el paquete numba, para que te permita usar varios núcleos de la CPU:"

ipython execs/parallell_numba_extra.ipynb -- $num_dardos

echo
echo "Con el paquete multiprocessing, para que te permita usar varios núcleos de la CPU"
ipython execs/multiprocessing_extra.ipynb -- $num_dardos

echo
echo "Con el paquete cupy, para que te permita usar una GPU:"
ipython execs/cupy_extra.ipynb -- $num_dardos

