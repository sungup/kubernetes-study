# 기타 명령어

## Virt-manager를 활용한 KVM 복제 명령어

```bash
for name in master-01 master-02 master-03 node-01 node-02 node-03; do
    sudo virt-clone --original ubuntu-20.04.4 \
                    --mac RANDOM \
                    --name k8s-${name}.sungup.io \
                    --file /var/lib/libvirt/images/k8s-${name}.sungup.io.qcow2; 
done
```

Reference: [How to clone existing KVM virtual machine images on Linux
](https://www.cyberciti.biz/faq/how-to-clone-existing-kvm-virtual-machine-images-on-linux/)

## Ubuntu에서 netplan을 활용한 네트워크 정보 변경

ubuntu server 설치 후 /etc/netplan/00-installer-config.yaml 파일을 아래와 같이 변경하여 static address로 변경.

```yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    ens3:
      dhcp: false
      optiona: true
      addresses: [10.0.3.11/24]
      gateway4: 10.0.3.1
      nameservers:
        addresses: [10.0.3.1]
  version: 2
```

수정 후 아래 명령어로 반영함

```bash
netplan generate
netplan apply
```

Reference: [ubuntu netplan 으로 고정 ip 설정하기(static ip config)](https://www.lesstif.com/lpt/ubuntu-netplan-ip-static-ip-config-61899302.html)
