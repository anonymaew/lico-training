# MNIST training

ใช้เทมเพลต `Singularity`

## Prerequisite

สร้าง directory และวางไฟล์ตามแผนผัง

```
mnist_trainnig
├── main.py
└── requirements.txt
```

โค้ดมีให้ตามข้างบน

## Template Information

| | |
| - | - |
| Job Name | `mnist_training` |
| Workspace | `MyFolder/lico_share_dir` |

## Template Parameters

| | |
| - | - |
| Container Image | `pytorch` |

```bash
cd ~/mnist_training
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python main.py
```

## Resource Options

| | |
| - | - |
| Queue | `GPU_FOR_AI_STU` |
| CPU Cores Per Node | `3` |
| GPU Per Node | `0` |
| Memory Used(MB) | `8192` |
| Wall Time | `10m` |
