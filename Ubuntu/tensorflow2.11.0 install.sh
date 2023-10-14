# Tensorflow compatibility list: https://www.tensorflow.org/install/source#gpu


help() {
    
}

PYTHON_VERSION=3.9

if [[ $# -eq 0 ]]; then
    help
    exit 1
elif [[ $1 = "--python" ]]; then
    if [[ $# -eq 2 ]];
        PYTHON_VERSION=$2
    fi
fi

# From: https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#common-installation-instructions-for-ubuntu
sudo apt install cuda-11-7
sudo apt install nvidia-gds

# From: https://phoenixnap.com/kb/how-to-install-tensorflow-ubuntu
conda create -n tensorflow python=$PYTHON_VERSION
conda activate tensorflow
conda install -c conda-forge cudatoolkit=11.2 cudnn=8.1.0 -y
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
pip install --upgrade pip
pip install tensorflow==2.11.0
