echo -n "VM Name: "
read vmname
echo -n "VM Size: "
read vmsize
echo -n "VM Memory: "
read vmmem
echo -n "VM Cores: "
read vmcore
echo -n "BIOS OR UEFI: "
read vmbou

mkdir $vmname
cd $vmname
qemu-img create -f qcow2 image.img $vmsize
touch run.sh
if [ $vmbou == "UEFI" ]
then
	vmbou=" -bios /usr/share/ovmf/x64/OVMF.fd "
else
	vmbou=" "
fi

echo "qemu-system-x86_64 -enable-kvm$vmbou-cdrom media.iso -boot menu=on -drive file=image.img -m $vmmem -cpu host -smp $vmcore -vga virtio -display sdl,gl=on -soundhw all" > run.sh

chmod +x run.sh
