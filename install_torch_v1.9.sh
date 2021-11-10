install_torch()
{
    wget https://nvidia.box.com/shared/static/2cqb9jwnncv9iii4u60vgd362x4rnkik.whl -O /tmp/torch-1.9.0-cp36-cp36m-linux_aarch64.whl
    sudo apt-get install python3-pip libopenblas-base libopenmpi-dev -y
    pip3 install Cython
    pip3 install numpy /tmp/torch-1.9.0-cp36-cp36m-linux_aarch64.whl
}

install_torchvision()
{
    sudo apt-get install libjpeg-dev zlib1g-dev libpython3-dev libavcodec-dev libavformat-dev libswscale-dev -y
    git clone --branch release/0.10 https://github.com/pytorch/vision /tmp/torchvision   # see below for version of torchvision to download
    cd /tmp/torchvision
    export BUILD_VERSION=0.10.0
    python3 setup.py install --user
}

# Avoid numpy/OpenBLAS bug on aarch64 https://github.com/numpy/numpy/issues/18131
export OPENBLAS_CORETYPE=ARMV8;

# install_torch
install_torchvision
