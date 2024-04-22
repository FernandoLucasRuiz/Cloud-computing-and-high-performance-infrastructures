#!/bin/bash

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab3FLR
#SBATCH --job-name=pi_calc
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1


num_dardos=$1

# Que sea un número
if ! [[ "$num_dardos" =~ ^[0-9]+$ ]]; then
    echo "Error: No se ha proporcionado un número válido."
    exit 1
fi

# Ejecución de los distintos archivos python

echo "Ejecutando cálculo de Pi con $num_dardos dardos:"
echo
echo "Versión original sin librerías:"

ipython execs/serial_version_without_using_libraries.ipynb -- $num_dardos

echo
echo "Versión con NumPy sin arrays:"
ipython execs/serial_version_with_numpy_without_arrays.ipynb -- $num_dardos

echo
echo "Versión con NumPy y arrays:"
ipython execs/serial_version_with_numpy_with_arrays.ipynb -- $num_dardos

echo
echo "Versión con Numba:"
ipython execs/version_with_numba_from_original_code.ipynb -- $num_dardos

