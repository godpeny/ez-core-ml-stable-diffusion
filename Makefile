SHELL := /bin/zsh
REPO_HOST = apple
REPO_NAME = coreml-stable-diffusion-v1-4
VARIANT = original/packages
MODEL_DIR = models
OUTPUT_PATH = output

.PHONY: download-model
download-model:
	python install.py --repo_id=$(REPO_HOST)/$(REPO_NAME) --variant=$(VARIANT) --model_dir=$(MODEL_DIR)

.PHONY: install-requirements
install-requirements:
	python -m pip install -e .

.PHONY: set-up
set-up: install-requirements download-model

.PHONY: run
run:
	python -m python_coreml_stable_diffusion.pipeline --prompt "$(prompt)" -i $(MODEL_DIR)/$(REPO_NAME)/$(VARIANT) -o $(OUTPUT_PATH) --compute-unit ALL --seed 93