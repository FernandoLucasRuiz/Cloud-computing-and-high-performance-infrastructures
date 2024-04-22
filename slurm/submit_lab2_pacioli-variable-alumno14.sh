#!/bin/bash
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab2FLR
#SBATCH -J submit_lab1
#SBATCH --output=%u-%j.out
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE

# Con la variable en linea comando
echo
if [ "$#" -eq 1 ]; then
	echo "comando pwd de la variable en línea de comando: "
	echo "$(pwd)"
fi
echo

# Con la variable de entorno
echo
echo "con la variable entorno: "
echo "$SLURM_SUBMIT_DIR"
echo
