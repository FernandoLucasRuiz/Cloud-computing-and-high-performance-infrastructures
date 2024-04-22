#!/bin/bash

# Comando 1
echo "Hostname en ibsen"
hostname
echo
echo "hostname en el contenedor my-python.sif de Singularity"
singularity exec my-python.sif hostname
echo

# Comando 2
echo "cat /etc/os-release en ibsen"
cat /etc/os-release
echo
echo "cat /etc/os-release en el contenedor my-python.sif de Singularity"
singularity exec my-python.sif cat /etc/os-release
echo

# Comando 3
echo "pwd en ibsen"
pwd
echo
echo "pwd en el contenedor my-python.sif de Singularity"
singularity exec my-python.sif pwd
echo

# Comando 4
echo "ls -l /home en ibsen"
ls -l /home
echo
echo "ls -l /home en el contenedor my-python.sif de Singularity"
singularity exec my-python.sif ls -l /home
echo

# Comando 5
echo "python --version en ibsen"
python --version
echo
echo "python --version en el contenedor my-python.sif de Singularity"
singularity exec my-python.sif python --version
echo

# Comando 6
echo "Ejecutando notebook pi.ipynb en ibsen"
ipython ../source/pi.ipynb 100000
echo
echo "Ejecutando notebook pi.ipynb en el contenedor my-python.sif de Singularity"
singularity exec my-python.sif ipython /app/pi.ipynb 100000
echo

