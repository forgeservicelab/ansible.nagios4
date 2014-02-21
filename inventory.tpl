127.0.0.1

[nagios-core]
core1 ansible_ssh_host=<your.ip.address.here> ansible_ssh_user=<remote_username>

[nagios-remotes]
Auth ansible_ssh_host=<your.ip.address.here> ansible_ssh_user=<remote_username>
Git ansible_ssh_host=<your.ip.address.here> ansible_ssh_user=<remote_username>
Support ansible_ssh_host=<your.ip.address.here> ansible_ssh_user=<remote_username>
