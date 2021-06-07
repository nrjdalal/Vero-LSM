# Vero - Linux Server Manager

```bash
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nrjdalal/Vero-LSM/master/install.sh)"
```
#!/bin/zsh

# if [ ! -d ~/.svir/.machines/Ubuntu-LTS-arm ]; then
#   echo "Error: Primary instance not present"
#   echo "Create using $(tput setaf 3)svir create ubuntu-lts-arm$(tput sgr0)"
#   exit 1
# fi

MASTER_DIR=~/.svir/.machines/ubuntu-lts-arm
WORK_DIR=~/.svir

data=("$@")

case ${data[1]} in
create)
  case ${data[2]} in
  ubuntu-lts-arm)
    mkdir -p $MASTER_DIR
    curl https://cdimage.ubuntu.com/releases/20.04/release/ubuntu-20.04.2-live-server-arm64.iso -o $MASTER_DIR/ubuntu-lts-arm.iso
    qemu-img create -f qcow2 $MASTER_DIR/virtual-disk.qcow2 10G
    cp $(dirname $(which qemu-img))/../share/qemu/edk2-aarch64-code.fd $MASTER_DIR
    dd if=/dev/zero conv=sync bs=1m count=64 of=$MASTER_DIR/ovmf_vars.fd
    qemu-system-aarch64 \
      -machine virt,accel=hvf,highmem=off \
      -cpu cortex-a72 -smp 4 -m 4G \
      -device virtio-gpu-pci \
      -device virtio-keyboard-pci \
      -drive "format=raw,file=$MASTER_DIR/edk2-aarch64-code.fd,if=pflash,readonly=on" \
      -drive "format=raw,file=$MASTER_DIR/ovmf_vars.fd,if=pflash" \
      -drive "format=qcow2,file=$MASTER_DIR/virtual-disk.qcow2" \
      -cdrom $MASTER_DIR/ubuntu-lts-arm.iso
    rm $MASTER_DIR/ubuntu-lts-arm.iso
    ;;
  esac
  ;;
launch)
  INAME=$(base64 </dev/urandom | tr -dc 'A-Z' | head -c6)
  echo "Launching $INAME"
  cp -R $MASTER_DIR $WORK_DIR/$INAME
  qemu-system-aarch64 \
    -nographic \
    -machine virt,accel=hvf,highmem=off \
    -cpu cortex-a72 -smp 4 -m 4G \
    -device virtio-gpu-pci \
    -device virtio-keyboard-pci \
    -drive "format=raw,file=$WORK_DIR/$INAME/edk2-aarch64-code.fd,if=pflash,readonly=on" \
    -drive "format=raw,file=$WORK_DIR/$INAME/ovmf_vars.fd,if=pflash" \
    -drive "format=qcow2,file=$WORK_DIR/$INAME/virtual-disk.qcow2" \
    -nic hostfwd=tcp:127.0.0.1:9922-0.0.0.0:22,hostfwd=tcp:127.0.0.1:9980-0.0.0.0:80 2>/dev/null &
  rm -f ~/.ssh/known_hosts && ssh svir@127.0.0.1 -p 9922
  ;;
list)
  ls $WORK_DIR
  ;;
delete)
  rm -rf $WORK_DIR/${data[2]}
  ;;
esac
