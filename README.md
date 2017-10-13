deep-security-agent
=========
[![Build Status](https://travis-ci.org/matic-insurance/ansible-deep-security-agent.svg?branch=feature%2Fupdate_playbook)](https://travis-ci.org/matic-insurance/ansible-deep-security-agent)

Role used to download, configure and run Trend Micro Deep Security agent

Requirements
------------

Ubuntu 14.04 is tested.

Role Variables
--------------

Here is the list of Required variables with default values:
```yaml
# Host name of your deep security manager
dsm_host_name: your.deep-security.server

```
These variables are optional and can be changed if needed
```yaml
# Host name of manager or relay where agent installation can be downloaded
dsm_agent_download_hostname: '{{ dsm_host_name }}'
# Download port for agent
dsm_agent_download_port: 443

# Host name of manager where agent should be registered
dsa_activation_hostname: '{{ dsm_host_name }}'
# Port name for agent activation
dsa_activation_port: 4120

# Agent activation token for automatic activation
dsa_activation_token:
# Auto assign policy id
dsa_policy_id:
# Auto assign policy name
dsa_policy_name:
```

Dependencies
------------

No dependencies

Example Playbook
----------------

Simpliest playbook can be following:

```yaml
- hosts: all
  roles:
    - role: matic-insurance.deep-security-agent
      dsm_host_name: 'your.deep-security.server'
```

This playbook will:
1. try to download agent from `https://your.deep-security.server`
1. install it
1. Activate it at `dsm://your.deep-security.server:4120`
1. Request recommendation scan

Advanced playbook with automatic activation and policy:
```yaml
- hosts: webservers
  roles:
    - role: matic-insurance.deep-security-agent
      dsm_host_name: 'your.deep-security.server'
      dsa_activation_token: 'TYoSZtEWL1Iosqud7R0klSs8PvPhB2'
      dsa_policy_name: 'Linux Server'
```

This playbook will:
1. try to download agent from `https://your.deep-security.server`
1. install it
1. Activate it at `dsm://your.deep-security.server:4120` with token `TYoSZtEWL1Iosqud7R0klSs8PvPhB2` 
1. Assign policy with name `Linux Server`

License
-------

MIT

Author Information
------------------

Matic is disrupting the homeowner's insurance
industry by providing insurance at the point of sale —
when borrowers apply for a mortgage.
