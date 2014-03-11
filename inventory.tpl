127.0.0.1

[nagios-core]
core1 ansible_ssh_host=<your.ip.address.here> ansible_ssh_user=<remote_username>

[nagios-remotes]
auth ansible_ssh_host=<your.ip.address.here> ansible_ssh_user=<remote_username>
git ansible_ssh_host=<your.ip.address.here> ansible_ssh_user=<remote_username>
support ansible_ssh_host=<your.ip.address.here> ansible_ssh_user=<remote_username>
