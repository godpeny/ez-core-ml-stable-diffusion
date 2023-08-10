from huggingface_hub import snapshot_download
from pathlib import Path
import argparse

repo_id = "apple/coreml-stable-diffusion-v1-4"
variant = "original/packages"
model_dir = "models"

parser = argparse.ArgumentParser()
parser.add_argument("--model_dir", type=str, default=model_dir)
parser.add_argument("--repo_id", type=str, default=repo_id)
parser.add_argument("--variant", type=str, default=variant)

args = parser.parse_args()

model_path = Path(model_dir) / (repo_id.split("/")[-1])
snapshot_download(repo_id, allow_patterns=f"{variant}/*", local_dir=model_path, local_dir_use_symlinks=False)
print(f"Model downloaded at {model_path}")
