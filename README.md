Nagios 4
========

Ansible Playbook to get nagios core version 4 installed from source on a Debian system.

Prerequisites
-------------

- The target machine(s) have to be already instantiated, this playbook does not launch computing instances
- It is needed to create an inventory file with either a group or a host aliased as ```nagios```
- This playbook runs tasks on the local machine, the inventory file needs to include a line with ```127.0.0.1```

How To Use
----------

This playbook does not include all resources so it is necessary to run it in two steps:

- Run the ```resource-fetch.yml``` playbook, this should retrieve all the required files
- Run the ```nagios.yml``` playbook, this will install nagios on the target machine(s)

ToDo:
-----

Template nagios configuration items to monitor remote systems.
