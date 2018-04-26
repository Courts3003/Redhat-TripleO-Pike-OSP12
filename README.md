# Redhat-TripleO-Pike-OSP12

Here are the configuration files for my project to install Redhat TripleO on 9 Dell R-Series Servers (7 x R210II and 2 x R210). For optimisation (and this topic lends itself to some discussion) all the Openstack machines will be VMs on Linux KVM. So all the Servers are KVM hosts.

I will start with the simple 2 machine configuration of 1 Compute and 1 Controller. Here is the Openstack deploy script so far for the simple configuration.

deploy_minimal.sh

THT=/usr/share/openstack-tripleo-heat-templates
openstack overcloud deploy --templates $THT \
-e $THT/environments/network-isolation.yaml \
-e /home/stack/templates/network-environment.yaml \
-e $THT/environments/hyperconverged-ceph.yaml \
-e $THT/environments/ceph-ansible/ceph-ansible.yaml \
--control-flavor oakleyse_tester \
--control-scale 1 \
--compute-flavor oakleyse_tester \
--compute-scale 1 \
--libvirt-type qemu \
--ntp-server pool.ntp.org \
--timeout 180 \
--debug
