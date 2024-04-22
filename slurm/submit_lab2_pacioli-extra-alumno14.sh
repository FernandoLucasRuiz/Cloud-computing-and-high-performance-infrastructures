#!/bin/bash

#!/bin/bash
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab2FLR
#SBATCH -J submit_lab1
#SBATCH --output=convirtiendo_imagenes_%u-%j.out
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE

# Crea el directorio png si no existe
mkdir -p png

# Modo secuencial
echo "Convirtiendo imágenes en modo secuencial..."
for file in figs/*.bmp figs/*.eps figs/*.jpg; do
    base_name=$(basename "$file")
    output_file="png/${base_name%.*}.png"
    time convert "$file" "$output_file"
done
echo

# Modo paralelo
echo "Convirtiendo imágenes en modo paralelo..."
for file in figs/*.bmp figs/*.eps figs/*.jpg; do
    base_name=$(basename "$file")
    output_file="png/${base_name%.*}.png"
    srun convert "$file" "$output_file" &
done
# Espera a que todos los trabajos paralelos finalicen

echo "Tiempo de ejecución en modo paralelo: "
time wait
