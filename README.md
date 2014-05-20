Nagios 4
========

Ansible Playbook to get nagios core version 4 installed from source on a Debian system.
Requires ansible version >= 1.6

Prerequisites
-------------

- The target machine(s) have to be already instantiated, this playbook does not launch computing instances
- It is needed to create an inventory file (use inventory.tpl as template and rename it as nagios.inventory) with either a group or a host aliased as `nagios`

How To Use
----------

This playbook is intended to be checked out from git and uses git submodules to include the roles it is dependent on.

The preferred way to get this playbook is using ansible itself:

    $ echo '127.0.0.1' > inventory
    $ ansible 127.0.0.1 -i inventory -m git -a "repo=https://git.forgeservicelab.fi/ansible/nagios4.git dest=nagios4" --connection=local

This will clone the git repository and all its nested submodules.

If you clone the repository with git itself you will need to manually initalize and update all submodules for this repository and all possible nested submodules on the included roles.

Your target nagios core machine should have the nagios web interface available on `http://[hostname]/nagios`. It will use LDAP authentication as specified below.

### The Secrets file
This playbook requires a number of variables that are confidential and as such not distributed with the playbook. They are expected on the `host_vars/secrets.yml` file, the variables are:

- `ldap_auth_string` - This contains a couple of Apache configuration lines to allow LDAP authentication; it uses backreferences on a regular expression search, a sample looks as follows:
    
    > '\1AuthBasicProvider ldap\n\1AuthLDAPURL "ldap[s]://<ldap.server.ip>[:<port>]/ou=<your-ldap-base-search>,dc=<example>,dc=<com>?<ldap-attribute>"\n\1AuthLDAPBindDN "cn={{ ldap_bind_name }},<all othe bind dn parameters>"\n\1AuthLDAPBindPassword "{{ ldap_password }}"\n\1Require ldap-group <ldap, group, dn>'
    
  Please, see [Apache's Authnz LDAP module documentation](http://httpd.apache.org/docs/2.2/mod/mod_authnz_ldap.html#authldapbinddn) to learn more about how to fill in the required values on this line.

- `ldap_bind_name` - The username needed to bind to the LDAP server. Note that this is to be replaced on the string above, the actual values will depend on how you fill in `ldap_auth_string`.
- `ldap_password` - The password for the user to bind to the LDAP server.
- `cas_username` - A valid user to test CAS authentication service.
- `cas_password` - The matching password for the username above.
- `redmine_api_key` - A valid Redmine REST API key, needed to file bug reports against redmine when a monitored service fails.
