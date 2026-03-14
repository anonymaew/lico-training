# First Slurm Job

ใช้เทมเพลต `Common Job`

## Template Information

- Job Name: `6666666666_hello`
- Workspace: `MyFolder/lico_share_dir`

> [!IMPORTANT]
> เปลี่ยนเลข `Job Name` เป็น**เลขนักศึกษา**เพื่อใช้ในการเช็คชื่อ

## Template Parameters

```bash
echo "hello world"
python -V
```

## Resource Options

- Queue: `GPU_FOR_AI_STU`
- Nodes: `1`
- CPU Cores Per Node: `1`
- GPU Per Node: `0`
- Memory Used(MB): `512`
- Wall Time: `5m`
