A collection of playbooks to help deploy and manage the Trend Micro Deep Security Agent.

## Requirements

All of the tasks in this repository require a working Deep Security infrastructure. The key component is the Trend Micro Deep Security Manager. The agents (which these playbooks help you manage) do the heavy lifting but the manager gives the marching orders. 

There are no specific technical requirements beyond a standard Ansible deployment.


## Dependencies

No dependency is required.


## Usage

A sample playbook:

```yaml
- hosts: all
  roles:
    - role: deep-security.deep-security-agent
      action: deploy
      dsa_download_hostname: app.deepsecurity.trendmicro.com
      dsa_download_port: 443
      dsa_activation_hostname: agents.deepsecurity.trendmicro.com
      dsa_activation_port: 443
      tenant_id: 111A111A-1A1A-11AA-AAA-11AA11111111
      token: 111A111A-1A1A-11AA-AAA-11AA11111111
      policy_id: 1
      force_reactivation: false
```

A sample playbook in JSON format:

```yaml
- hosts: all
  roles:
    - { 
        role: deep-security.deep-security-agent,
        action: deploy,
        dsa_download_hostname: app.deepsecurity.trendmicro.com,
        dsa_download_port: 443,
        dsa_activation_hostname: agents.deepsecurity.trendmicro.com,
        dsa_activation_port: 443,
        tenant_id: 111A111A-1A1A-11AA-AAA-11AA11111111,
        token: 111A111A-1A1A-11AA-AAA-11AA11111111,
        policy_id: 1,
        force_reactivation: false
      }
```

Please refer the following sections for required variables.


## Variables

#### Task : deploy.yml
#### Action: deploy

The "deploy" task includes the "install" and "activate" playbooks internally.

Key | Type | Description | Default
----|------|-------------|--------
dsa_download_hostname | String | Hostname of the Deep Security Manager. | app.deepsecurity.trendmicro.com
dsa_download_port | Int | The port to connect to the Deep Security Manager to download the agents. This is typically the same port as the one used to access the Deep Security Manager admin interface. | 443
dsa_activation_hostname | String | The hostname for the agents to communicate with once deployed. For Marketplace and software deployments this is typically the same hostname as 'dsm_agent_download_hostname'. | agents.deepsecurity.trendmicro.com
dsa_activation_port | Int | The port to use for the agent heartbeat (the regular communication). For Marketplace and software deployments, the default is 4120. | 443
tenant_id | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
token | String | In a multi-tenant installation (like Trend Micro Deep Security as a Service), this identifies the tenant account to register the agent with. |
policy_id | String | The Deep Security ID assigned to the policy to apply to the agents on activation. |
force_reactivation | Boolean | Whether to force re-activation even Deep Security Agent has been activated. | false


#### Task : install.yml
#### Action: install

"install" task will download and install the Deep Security Agent service. Installation will be skipped if agent with same version already installed. If downloaded Deep Security Installer version is newer, then version upgrade will be performed.

Key | Type | Description | Default
----|------|-------------|--------
dsa_download_hostname | String | Hostname of the Deep Security Manager. | app.deepsecurity.trendmicro.com
dsa_download_port | Int | The port to connect to the Deep Security Manager to download the agents. This is typically the same port as the one used to access the Deep Security Manager admin interface. | 443


#### Task : activate.yml
#### Action: activate

"activate" task will activate the Deep Security Agent service by registering into Trend Micro Deep Security Manager. By default, this recipe will skip activation if agent already in activated state, unless 'force_reactivation' attribute is set to 'true'.

Key | Type | Description | Default
----|------|-------------|--------
dsa_activation_hostname | String | The hostname for the agents to communicate with once deployed. For Marketplace and software deployments this is typically the same hostname as 'dsm_agent_download_hostname'. | agents.deepsecurity.trendmicro.com
dsa_activation_port | Int | The port to use for the agent heartbeat (the regular communication). For Marketplace and software deployments, the default is 4120. | 443
tenant_id | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
token | String | In a multi-tenant installation (like Trend Micro Deep Security as a Service), this identifies the tenant account to register the agent with. |
policy_id | String | The Deep Security ID assigned to the policy to apply to the agents on activation. |
force_reactivation | Boolean | Whether to force re-activation even Deep Security Agent has been activated. | false


#### Task : the other tasks

Task | Action
-----|-------
check-in-with-manager.yml | check-in-with-manager
create-diagnostic-package.yml | create-diagnostic-package
create-integrity-baseline.yml | create-integrity-baseline
recommend-security-policy.yml | recommend-security-policy
scan-for-integrity-changes.yml | scan-for-integrity-changes
scan-for-malware.yml | scan-for-malware

The other tasks assumes that Trend Micro Deep Security Agent is installed and activated properly and can be used without any additional variables.