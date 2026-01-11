TS=$(date "+%Y%0m%0d_%T")

project_root_path="../../"
cli_path="${project_root_path}/src/evaluation/truthfulqa_eval.py"
data_path="${project_root_path}/data/truthfulqa"

model_name="path/to/your/model"

#You can set the amateur_model to produce the result of ICD + PLI
amateur_model_name="path/to/your/amateur_model"

generation_args="
    --relative_top 0.0
"

### Our method
output_path="${project_root_path}/exp_results/truthfulqa/${TS}/icd_pli_llama3_8b"
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
        --is-chat \
        --mode contrastive-decoding \
        --parallel \
        --total-shard 8 \
        --shard-id $i \
        ${generation_args} \
        >${output_path}/shard_${i}.log 2>&1 &"
    echo $CMD
    eval $CMD

done
wait
