script_full_path=$(dirname "$0")
source /home/3wille/pykaldi_env/bin/activate
export LD_PRELOAD=/opt/intel/mkl/lib/intel64/libmkl_def.so:/opt/intel/mkl/lib/intel64/libmkl_avx2.so:/opt/intel/mkl/lib/intel64/libmkl_core.so:/opt/intel/mkl/lib/intel64/libmkl_intel_lp64.so:/opt/intel/mkl/lib/intel64/libmkl_intel_thread.so:/opt/intel/lib/intel64_lin/libiomp5.so
cd /home/3wille/kaldi-model-server
python nnet3_model.py -m 0 -e -c 1 -t -a sinc_fastest -r 48000 --yaml-config kaldi_tuda_de_nnet3_chain2.yaml
cd $script_full_path
