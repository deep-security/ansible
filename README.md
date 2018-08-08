# Ansible

An Ansible playbook for the Deep Security Agent. This playbook allows you to easily deploy the Deep Security Agent as well as take some common operations from the Agent.

## Support

This is a community project that is supported by the Trend Micro Deep Security team.

Tutorials, feature-specific help, and other information about Deep Security is available from the [Deep Security Help Center](https://help.deepsecurity.trendmicro.com/Welcome.html). 

For Deep Security specific issues, please use the regular Trend Micro support channels. For issues with the code in this repository, please [open an issue here on GitHub](https://github.com/deep-security/ansible/issues).

## Requirements

All of the tasks in this repository require a working Deep Security infrastructure. The key component is the Trend Micro Deep Security Manager. The Deep Security Agents (which these playbooks help you manage) do the heavy lifting but the Deep Security Manager gives the orders. 

There are no specific technical requirements beyond a standard Ansible deployment.


## Dependencies

There are no dependencies.


## Usage

Currently we have provided two ways to retrieve this role:

### Download from Ansible-Galaxy
 * Please visit our role in [Ansible-Galaxy](https://galaxy.ansible.com/deep-security/deep-security-agent)
 * Command to download this role
```bash
ansible-galaxy install deep-security.deep-security-agent
```

#### For deploying Agents to a non-multi-tenant Deep Security Manager
```yaml
- hosts: all
  roles:
    - role: deep-security.deep-security-agent
      operation: deploy
      dsm_agent_download_hostname: deep.security.manager.host
      dsm_agent_download_port: 4119
      dsm_agent_activation_hostname: deep.security.manager.host
      dsm_agent_activation_port: 4120
      policy_id: 1
      group_id: 1
      force_reactivation: false
```

#### For deploying Agents to a multi-tenant Deep Security Manager (like Deep Security as a Service)
```yaml
- hosts: all
  roles:
    - role: deep-security.deep-security-agent
      operation: deploy
      dsm_agent_download_hostname: app.deepsecurity.trendmicro.com
      dsm_agent_download_port: 443
      dsm_agent_activation_hostname: agents.deepsecurity.trendmicro.com
      dsm_agent_activation_port: 443
      tenant_id: 111A111A-1A1A-11AA-AAA-11AA11111111
      token | tenant_password: 111A111A-1A1A-11AA-AAA-11AA11111111
      policy_id: 1
      group_id: 1
      force_reactivation: false
```

### Clone from this repo
 * Command to clone this repository:
```bash
git clone git@github.com:deep-security/ansible.git <folder-name>
```

 * For users have cloned Deep Security Ansible script from this repo, we suggest to have following folder structure for playbook and role:

```
project
│   playbook.yaml
└───roles
    └───<folder-name>
        │   LICENSE
        │   README.md
        └───defaults
        └───meta
        └───tasks
```

#### For deploying Agents to a non-multi-tenant Deep Security Manager
```yaml
- hosts: all
  roles:
    - role: <folder-name>
      operation: deploy
      dsm_agent_download_hostname: deep.security.manager.host
      dsm_agent_download_port: 4119
      dsm_agent_activation_hostname: deep.security.manager.host
      dsm_agent_activation_port: 4120
      policy_id: 1
      group_id: 1
      force_reactivation: false
```

#### For deploying Agents to a multi-tenant Deep Security Manager (like Deep Security as a Service)
```yaml
- hosts: all
  roles:
    - role: <folder-name>
      operation: deploy
      dsm_agent_download_hostname: app.deepsecurity.trendmicro.com
      dsm_agent_download_port: 443
      dsm_agent_activation_hostname: agents.deepsecurity.trendmicro.com
      dsm_agent_activation_port: 443
      tenant_id: 111A111A-1A1A-11AA-AAA-11AA11111111
      token | tenant_password: 111A111A-1A1A-11AA-AAA-11AA11111111
      policy_id: 1
      group_id: 1
      force_reactivation: false
```

<a id="operations"></a>
## Operations
Definition for possible operations to be performed in this role, for required variables please refer to [Variables](#variables).

Operation | Description | Variables
------------|-------------|-------------------
deploy | The <code>deploy</code> task includes the <code>install</code> and <code>activate</code> playbooks internally. | dsm_agent_download_hostname <br /> dsm_agent_download_port <br /> dsm_agent_activation_hostname	 <br/> dsm_agent_activation_port <br/> policy_id/policy_name (Optional) <br/> group_id (Optional) <br/> force_reactivation (Optional) <br/><br/> **For multi-tenancy only:** <br/> tenant_id <br /> token/tenant_password
install | The install task downloads and installs the Deep Security Agent. The installation is skipped if an Agent of the same version is already installed. If a newer version of Deep Security Installer is already installed, then the version is upgraded. | dsm_agent_download_hostname <br/> dsm_agent_download_port
activate | The activate task activates the Deep Security Agent by registering it in Trend Micro Deep Security Manager. By default, activation is skipped if the Agent is already activated, unless the force_reactivation attribute is set to true. | dsm_agent_activation_hostname <br/> dsm_agent_activation_port <br/> policy_id/policy_name (Optional) <br/> group_id (Optional) <br/> force_reactivation (Optional) <br/><br/> **For multi-tenancy only:** <br/> tenant_id <br/> token/tenant_password
set-policy-by-id | Change the Agent's policy via policy id | policy_id
set-policy-by-name | Change the Agent's policy via policy name | policy_name
check-in-with-manager | Ask the Agent to contact the Manager now. | N/A
create-diagnostic-package | Generate an Agent diagnostic package. | N/A
create-integrity-baseline | Rebuild the integrity monitoring baseline on the computer. | N/A
run-recommendation-scans | Initiate a recommendation scan on the computer. | N/A
scan-for-integrity-changes | Scan for changes for integrity monitoring | N/A
scan-for-malware | Initiate a manual anti-malware scan | N/A
update-configuration | Instruct the Deep Security Manager to perform a "Send Policy" operation. | N/A

<a id="variables"></a>
## Variables

Key | Type | Description | Sample
----|------|-------------|--------
action | String | Name of the operation to be performed **(deprecated&mdash;please use operation instead)** | See [Operations](#operations)
operation | String | Name of the operation to be performed | See [Operations](#operations)
dsm_agent_activation_hostname | String | The hostname for the Agents to communicate with once deployed. For Marketplace and software deployments, this is typically the same hostname as 'dsm_agent_download_hostname'. | agents.deepsecurity.trendmicro.com
dsm_agent_activation_port | Integer | The port used for the Agent heartbeat (the regular communication). For Marketplace and software deployments, the default is 4120. | 443
dsm_agent_download_hostname | String | The hostname of the Deep Security Manager. | app.deepsecurity.trendmicro.com
dsm_agent_download_port | Integer | The port to connect to the Deep Security Manager to download the Agents. This is typically the same port as the one used to access the Deep Security Manager administration interface. | 443
force_reactivation | Boolean | Force re-activation even if the Deep Security Agent has already been activated. | false
group_id | String | The Deep Security ID assigned to the computer group and applied to the Agents on activation. | 1
policy_id | String | ID of the Deep Security Policy to be assigned to the Agents. | 1
policy_name | String | Name of the Deep Security Policy to be assigned to the Agents. <br /> **Will be ignored if policy_id has been set.** | Base Policy
tenant_id | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the Agent with. <br /> **Multi-tenancy only** | 111A111A-1A1A-11AA-AAA-11AA11111111
token/tenant_password | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the Agent with. In latest Deep Security Manager, "tenant_password" has been replaced with "token". "tenant_password" has been kept for backwards compatibility.<br /> **Multi-tenancy only** | 111A111A-1A1A-11AA-AAA-11AA11111111



## How to contribute

We're always open to PRs from the community. To submit one:

1. Fork the repo.
2. Create a new feature branch.
3. Make your changes.
4. Submit a PR with an explanation of your changes or additions.

We'll review your content and work with you to make sure the fix gets pushed out quickly. For further help, please contact the Trend Micro open source support team at deepsecurityopensource@trendmicro.com.
