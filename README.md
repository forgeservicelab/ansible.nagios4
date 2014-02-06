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

This playbook does not include all resources so it is necessary to run it in two steps:

- Run the `resource-fetch.yml` playbook, this should retrieve all the required files

    > $ ansible-playbook -i nagios.inventory resource-fetch.yml

- Run the `nagios.yml` playbook, this will install nagios on the target machine(s)

    > $ ansible-playbook -i nagios.inventory nagios.yml

Your target machine should have the nagios web interface available on http://<host>/nagios

### To override the default Web Interface password:
The Web interface password is defined on the nagios4 role via the ```nagios_web_password``` variable, this can be overriden by redefining its value on ```roles/nagios4/vars/main.yml```, note that you need to run the ```resource-fetch.yml``` playbook prior to this.

ToDo:
-----

Template nagios configuration items to monitor remote systems.
