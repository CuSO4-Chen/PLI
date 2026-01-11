# export HTTPS_PROXY="http://star-proxy.oa.com:3128"
TS=$(date "+%Y%0m%0d_%T")
# export TRANSFORMERS_OFFLINE=1

project_root_path="../../"
model_name="path/to/your/model"
#You can set the amateur_model to produce the result of ICD + PLI
amateur_model_name=None

cli_path="${project_root_path}/src/_evaluation/gsm8k_eval.py"
data_path="${project_root_path}/data/gsm8k"

output_path="${project_root_path}/exp_results/gsm8k/${TS}/PLI_llama3_8b"
mkdir -p $output_path
cp $0 "$(dirname "$output_path")"

for i in {0..7}; do
    echo "devices: ${i}"
    CMD="CUDA_VISIBLE_DEVICES=$i nohup python ${cli_path}
        --model-name ${model_name} \
        --amateur-model-name ${amateur_model_name} \
        --num-gpus 1 \
        --amateur-model-nums-gpus 1 \
        --data-path ${data_path} \
        --output-path ${output_path}"/result" \
        --mode greedy \
        --is-chat \
        --total-shard 8 \
        --shard-id $i \
        --parallel \
        ${generation_args} >${output_path}/shard_${i}.log 2>&1 &"

    echo $CMD
    eval $CMD
done
wait