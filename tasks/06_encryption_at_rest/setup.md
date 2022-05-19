apt install etcd-client

export ETCDCTL_API=3



# setup apiserver directory

vi /etc/kubernetes/manifests/kube-apiserver.yaml 

    - name: lod-apiserver
      mountPath: /apiserver

  - name: lod-apiserver
    hostPath:
      path: /root/apiserver
      type: DirectoryOrCreate

