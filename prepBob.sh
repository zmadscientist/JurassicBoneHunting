#! /bin/bash

echo "creating new environment"
conda create --clone pytorch --name openvinopytorch
echo "Activating environment"
conda activate openvinopytorch
echo "Installing Torch 1.12"
~/.conda/envs/openvinopytorch/bin/pip  install torch==1.12.0+cpu torchvision==0.13.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
echo "Installing intel_extension_for_pytorch 1.12"
python -m pip install intel_extension_for_pytorch==1.12+cpu -f https://developer.intel.com/ipex-whl-stable-cpu
echo "Instalingl openvino-dev"
~/.conda/envs/openvinopytorch/bin/pip install --user openvino-dev[pytorch]
echo "Registering new kernel in Jupyter"
python -m ipykernel install --user --name openvinopytorch
echo "Installing OpenVINO lan requirements"
pip install -r requirements_openvino.txt
