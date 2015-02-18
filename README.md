Nagios 4
========

Ansible Playbook to get nagios core version 4 installed from source on a Debian system.

Requires ansible version **>= 1.8**

Prerequisites
-------------

- The target machine(s) have to be already instantiated, this playbook does not launch computing instances
- It is needed to create an inventory file (use inventory.tpl as template and rename it as nagios.inventory) with either a group or a host aliased as `nagios`

How To Use
----------

This playbook is intended to be checked out from git and uses ansible-galaxy to include the roles it is dependent on.

After checking out the playbook, run:

    $ ansible-galaxy install -r requirements.yml

Your target nagios core machine should have the nagios web interface available on `http://[hostname]/nagios`. It will use LDAP authentication as specified below.

### The Secrets file
This playbook requires a number of variables that are confidential and as such not distributed with the playbook. They are expected on the `host_vars/secrets.yml` file, the variables are:

- `ldap_auth_url` - The URL of the LDAP server, as required by Apache's `AuthLDAPURL` directive.
- `ldap_bind_name` - The username needed to bind to the LDAP server. Note that this is to be replaced on the string above, the actual values will depend on how you fill in `ldap_auth_string`.
- `ldap_password` - The password for the user to bind to the LDAP server.
- `ldap_group_base` - Base DN of the LDAP tree where user groups are defined. Needed only if `allowed_ldap_groups` is defined.
- `allowed_ldap_groups` - List of group CNs to which allowed users must belong (users are members of at least one).

  Please, see [Apache's Authnz LDAP module documentation](http://httpd.apache.org/docs/2.2/mod/mod_authnz_ldap.html#authldapbinddn) to learn more about how to fill in the required values on this line.

- `cas_username` - A valid user to test CAS authentication service.
- `cas_password` - The matching password for the username above.
- `redmine_api_key` - A valid Redmine REST API key, needed to file bug reports against redmine when a monitored service fails.
