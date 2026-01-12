<h1 align="center"> Expanding before Inferring: Enhancing Factuality in Large Language Models through Premature Layers Interpolation </h1>

<div align="center"> 

[![Paper](https://img.shields.io/badge/Paper-arXiv-b5212f.svg?style=flat-square&logo=arxiv)](https://arxiv.org/abs/2506.02973)
<a href="https://aclanthology.org/2025.emnlp-main.645/">
  <img src="https://2025.emnlp.org/assets/images/logos/emnlp_2025_logo_v1.png" width="120" style="vertical-align:middle">
</a>
<!-- [![](https://raw.githubusercontent.com/SwanHubX/assets/main/badge2.svg)](https://swanlab.cn/@yux1ang/Tree-GRPO/overview) -->

</div>


# 📣 News
- **[20/August/2025]** 🎉 Our paper is accepted by **EMNLP 2025 Main Conference(The 2025 Conference on Empirical Methods in Natural Language Processing)**!


## Table of contents

- [Overview](#overview)
- [Quick start](#quick-start)
- [Acknowledgement](#acknowledgement)
- [Citation](#citation)

## Overview
we propose **PLI** (**P**remature **L**ayers **I**nterpolation), a novel, training-free, and plug-and-play intervention designed to enhance factuality. PLI mitigates hallucinations by inserting premature layers formed through mathematical interpolation with adjacent layers. Inspired by stable diffusion and sampling steps, PLI extends the depth of information processing and transmission in LLMs, improving factual coherence. Experiments on four publicly available datasets demonstrate that PLI effectively reduces hallucinations while outperforming existing baselines in most cases. Further analysis suggests that the success of layer interpolation is closely linked to LLMs’ internal mechanisms.

<p align="center">
  <img alt="intro" src="assets/framework.png" />
  <i>
  The overview of PLI framework.
  </i>
</p>

## Quick Start

### Environment
```bash
conda create -n pli python==3.10
conda activate pli
pip install -r requirements.txt
unzip transformers.zip
cd ./transformers
pip install --editable ./
```
### Run
For experiments on TruthfulQA (or FACTOR, simliarly), please try:
```sh
cd ./exp_scripts
sh base_pli_truthfulqa.sh
```

For experiments on GSM8K (or StrategyQA, simliarly), please try:
```sh
cd ./exp_scripts
sh base_pli_gsm8k.sh
```

### How to conduct experiments with more variations
Our core code is in PLI/src/decoding_algorithm/pli.py:
```python
class InterpolatedLayer
# categories: spherical_interpolation, log_space_interpolation, bezier_interpolation

def extend_model_with_interpolation(model, layer_index, alpha)

self.model = extend_model_with_interpolation(self.model, layer_index=28, alpha=0.9)
self.model = extend_model_with_interpolation(self.model, layer_index=23, alpha=0.8)
```

For simplicity and experiment iteration, you can try modifying or copying the above code in **pli.py** to efficiently achieve multiple PLI operations or mixed categories of PLIs.

## Acknowledgement
The codebase is built upon [ICD](https://github.com/HillZhang1999/ICD) and [DoLa](https://github.com/voidism/DoLa).
We express our gratitude to these open-source projects.

## Citation
If you are interested in our work, please cite:
```bibtex
@inproceedings{chen-etal-2025-expanding,
    title = "Expanding before Inferring: Enhancing Factuality in Large Language Models through Premature Layers Interpolation",
    author = "Chen, Dingwei and Liu, Ziqiang and Fang, Feiteng and Leong, Chak Tou and Ni, Shiwen and Argha, Ahmadreza and Alinejad-Rokny, Hamid and Yang, Min and Li, Chengming",
    editor = "Christodoulopoulos, Christos and Chakraborty, Tanmoy and Rose, Carolyn and Peng, Violet",
    booktitle = "Proceedings of the 2025 Conference on Empirical Methods in Natural Language Processing",
    month = nov,
    year = "2025",
    address = "Suzhou, China",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2025.emnlp-main.645/",
    doi = "10.18653/v1/2025.emnlp-main.645",
    pages = "12770--12785",
    ISBN = "979-8-89176-332-6",
}
```
