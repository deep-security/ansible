A collection of playbooks to help deploy and manage the Trend Micro Deep Security Agent.

## Requirements

All of the tasks in this repository require a working Deep Security infrastructure. The key component is the Trend Micro Deep Security Manager. The Deep Security Agents (which these playbooks help you manage) do the heavy lifting but the Deep Security Manager gives the orders. 

There are no specific technical requirements beyond a standard Ansible deployment.


## Dependencies

No dependency is required.


## Usage

A sample playbook:

```yaml
- hosts: all
  roles:
    -role: deep-security.deep-security-agent
    action: deploy
    dsm_agent_download_hostname: app.deepsecurity.trendmicro.com
    dsm_agent_download_port: 443
    dsm_agent_activation_hostname: agents.deepsecurity.trendmicro.com
    dsm_agent_activation_port: 443
    tenant_id: 111A111A-1A1A-11AA-AAA-11AA11111111
    token: 111A111A-1A1A-11AA-AAA-11AA11111111
    policy_id: 1
    force_reactivation: false
```

Please refer to the following sections for required variables.


## Variables


#### Task : deploy.yml
###### action: deploy

The "deploy" task includes the "install" and "activate" playbooks internally.

Key | Type | Description | Default
----|------|-------------|--------
dsm_agent_download_hostname | String | The hostname of the Deep Security Manager. | app.deepsecurity.trendmicro.com
dsm_agent_download_port | Int | The port to connect to the Deep Security Manager to download the agents. This is typically the same port as the one used to access the Deep Security Manager admin interface. | 443
dsm_agent_activation_hostname | String | The hostname for the agents to communicate with once deployed. For Marketplace and software deployments this is typically the same hostname as 'dsm_agent_download_hostname'. | agents.deepsecurity.trendmicro.com
dsm_agent_activation_port | Int | The port to use for the agent heartbeat (the regular communication). For Marketplace and software deployments, the default is 4120. | 443
tenant_id | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
token | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
policy_id | String | The Deep Security ID assigned to the policy and applied to the agents on activation. |
force_reactivation | Boolean | Force re-activation even though the Deep Security Agent has already been activated. | false


#### Task : install.yml
###### action: install

The "install" task will download and install the Deep Security Agent. The installation will be skipped if agent with the same version is already installed. If a newer version of Deep Security Installer is already installed, then the version will be upgraded.

Key | Type | Description | Default
----|------|-------------|--------
dsm_agent_download_hostname | String | The hostname of the Deep Security Manager. | app.deepsecurity.trendmicro.com
dsm_agent_download_port | Int | The port to connect to the Deep Security Manager to download the agents. This is typically the same port as the one used to access the Deep Security Manager admin interface. | 443


#### Task : activate.yml
###### action: activate

The "activate" task will activate the Deep Security Agent by registering into Trend Micro Deep Security Manager. By default, activation will be skipped if the agent is already activated, unless the 'force_reactivation' attribute is set to 'true'.

Key | Type | Description | Default
----|------|-------------|--------
dsm_agent_activation_hostname | String | The hostname for the agents to communicate with once they are deployed. For Marketplace and software deployments this is typically the same hostname as 'dsm_agent_download_hostname'. | agents.deepsecurity.trendmicro.com
dsm_agent_activation_port | Int | The port to use for the agent heartbeat (the regular communication). For Marketplace and software deployments, the default is 4120. | 443
tenant_id | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
token | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
policy_id | String | The Deep Security ID assigned to the policy and applied to the agents on activation. |
force_reactivation | Boolean | Force re-activation even though the Deep Security Agent has already been activated. | false


#### Task : manage.yml
###### action:

* check-in-with-manager
* create-diagnostic-package
* create-integrity-baseline
* run-recommendation-scans
* scan-for-integrity-changes
* scan-for-malware

The "manage" task will help users operate the Deep Security Agent without logining into the Deep Security Manager. All of the available actions assume that the Deep Security Agent is installed and activated properly and can be triggered without any additional variables.

```yaml
- hosts: all
  roles:
    - role: deep-security.deep-security-agent
      action: check-in-with-manager | create-diagnostic-package | ...
```