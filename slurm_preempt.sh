#!/bin/bash
#SBATCH --job-name=hrm
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
#SBATCH --partition=preempt
#SBATCH --nodes=1
#SBATCH --time=40:00:00
#SBATCH --gres=gpu:L40S:4
#SBATCH --requeue
#SBATCH --signal=B:USR1@120

source ~/.bashrc
conda activate picard
export OMP_NUM_THREADS=4
torchrun --nproc-per-node 4 pretrain.py arch=hrm_v2_params_matched
