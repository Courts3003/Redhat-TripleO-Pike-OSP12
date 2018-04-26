THT=/usr/share/openstack-tripleo-heat-templates
openstack overcloud deploy --templates $THT \
-e $THT/environments/network-isolation.yaml \
-e $THT/environments/hyperconverged-ceph.yaml \
-e $THT/environments/ceph-ansible/ceph-ansible.yaml \
-e /home/stack/templates/network-environment.yaml \
--control-flavor oakleyse_tester \
--control-scale 1 \
--compute-flavor oakleyse_tester \
--compute-scale 1 \
--libvirt-type kvm \
--ntp-server 0.pool.ntp.org \
--timeout 180 \
--debug

