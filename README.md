# PBUS Linux Env
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/MrPrinceRawat/PBUS-Linux-Env/rust.yml)
![GitHub License](https://img.shields.io/github/license/MrPrinceRawat/PBUS-Linux-Env)

Standalone Custom Linux Environment to be deployed on a server. No other services are running besides what's needed for PBUS Core Software. 

## Releases
You can grab a pre-build release from [releases](https://github.com/MrPrinceRawat/PBUS-Linux-Env/releases) page. 

Or build it yourself, just follow the instructions below.

## Build Instructions
There are two major folders that is needed for it to work (even boot!).
1. S-BUS - initramfs
2. isodir

### Linux Kernel
Grab the latest Linux Kernel available from [kernel](https://kernel.org/).

Unzip it using ``` tar -xJf linux-[version].tar.xz ```

Then build it.
```
> make menuconfig
> make
```

### BusyBox
BusyBox provides us with important static binaries for core utilities which are needed in our Linux env.

Grab the latest version of Busybox from [BusyBox](https://busybox.net/)

Unzip it ```tar -xjf busybox-[version].tar.bz2```

Then proceed to build
```
> make menuconfig
> make install
> make
```

Now you'll have a ```_install``` folder in your BusyBox folder, copy all the content to ```S-BUS```.
```
> cp busybox-[version]/_install/* /S-BUS/
```

### Build initramfs
Now that you have your file structure in S-BUS sorted, it's time to build it. Go ahead run make to make it.
```
> cd S-BUS
> make
```
It will make ```initramfs.cpio.gz``` in the parent directory.

### SYSLINUX
Syslinux contains important binaries to boot into your system. Get the latest syslinux from [kernel/syslinux](https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/).

Then Unzip it.

### Final Build
Now it's time for the final build. From the root directory run:
```
> make
```
And wait and watch the magic ✨✨

It will create ```S-BUS.iso```

## Contributions
This Repo is open to any and all contributions.

## License
This project is licensed under the terms of the MIT license.








