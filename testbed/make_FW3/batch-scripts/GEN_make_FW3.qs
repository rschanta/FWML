#!/bin/bash -l
#
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=32
#SBATCH --job-name=GEN_make_FW3
#SBATCH --partition=thsu
#SBATCH --time=7-00:00:00
#SBATCH --output=./make_FW3/slurm_logs/GEN_out.out
#SBATCH --error=./make_FW3/slurm_logs/GEN_err.out
#SBATCH --mail-user='rschanta@udel.edu'
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --export=ALL
#
#UD_QUIET_JOB_SETUP=YES
#UD_USE_SRUN_LAUNCHER=YES
#UD_DISABLE_CPU_AFFINITY=YES
#UD_MPI_RANK_DISTRIB_BY=CORE
#UD_DISABLE_IB_INTERFACES=YES
#UD_SHOW_MPI_DEBUGGING=YES
#

. /work/thsu/rschanta/RTS/functions/utility/bash-utils.sh
#
vpkg_require matlab
run_MATLAB_script "./make_FW3/make_FW3.m"
