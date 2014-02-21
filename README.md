Nagios 4
========

Ansible Playbook to get nagios core version 4 installed from source on a Debian system.

Prerequisites
-------------

- The target machine(s) have to be already instantiated, this playbook does not launch computing instances
- It is needed to create an inventory file (use inventory.tpl as template and rename it as nagios.inventory) with either a group or a host aliased as `nagios`
- This playbook runs tasks on the local machine, the inventory file needs to include a line with `127.0.0.1`

How To Use
----------

This playbook is intended to be checked out from git and uses git submodules to include the roles it is dependent on.

The preferred way to get this playbook is using ansible itself:

    $ echo '127.0.0.1' > inventory
    $ ansible 127.0.0.1 -i inventory -m git -a "repo=https://git.forgeservicelab.fi/ansible/nagios4.git dest=nagios4" --connection=local

This will clone the git repository and all its nested submodules.

If you clone the repository with git itself you will need to manually initalize and update all submodules for this repository and all possible nested submodules on the included roles.

Your target machine should have the nagios web interface available on http://[hostname]/nagios

### To override the default Web Interface password:
The Web interface password is defined on the nagios4 role via the ```nagios_web_password``` variable, this can be overriden by redefining its value on ```roles/nagios4/vars/main.yml```, note that you need to run the ```resource-fetch.yml``` playbook prior to this.

ToDo:
-----

Template nagios configuration items to monitor remote systems.
