#!/bin/bash
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab1FLR
#SBATCH -J submit_lab1
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE

echo "Machine name: $(hostname)"
echo "User: $USER"
echo "Current directory: $(pwd)"

tree -L 1

# Por medio de un bucle for dentro de un shell script,
# ejecuta 3 veces la aplicación helloflops3-AVX

for (( i=1; i <= 3; i++ )) # i++: se va sumando 1 a i.
do
echo "La aplicación se ha ejecutado <<$i>> veces"
./helloflops3-AVX
done


cpufetch

