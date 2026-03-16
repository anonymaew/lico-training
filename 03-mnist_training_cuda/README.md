# MNIST training on CUDA

Copy job มาจาก [job ที่แล้ว](../02-mnist_training)

สิ่งที่ต้องเปลี่ยน

## Template Information

| | |
| - | - |
| Job Name | `mnist_training_gpu` |

## Template Parameters

```bash
cd ~/mnist_training
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
export CUDA_VISIBLE_DEVICES="$(nvidia-smi -L | grep -Eo 'MIG-[0-9a-f]{8}(-[0-9a-f]{4}){3}-[0-9a-f]{12}' | head -n 1)"
echo "Using MIG $CUDA_VISIBLE_DEVICES"
python main.py
```

## Resource Options

| | |
| - | - |
| GPU Per Node | `1` |
| GPU Resource Type | `gpu:STU_GPU` |
