#! /usr/bin/bash

# Install software on the VM instance

# In the SSH session, to update the Debian package list, execute the following command:

sudo apt-get update

# To install Python, execute the following command:

sudo apt-get install python3-setuptools python3-dev build-essential

# To install pip, execute the following command:

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

sudo python3 get-pip.py

# Verify Python installation

python3 --version

pip3 --version

# The output provides the version of Python and pip that you installed.

# Install FastAPI and Uvicorn using pip:

sudo python3 -m pip install fastapi uvicorn[standard]

# Verify uvicorn installation

uvicorn --version

# With that, you have FastAPI and Uvicorn installed and are ready to learn how to use them.
# FastAPI is the framework you’ll use to build your API, and Uvicorn is the server that will use the API you build to serve requests.
