A collection of playbooks to help deploy and manage the Trend Micro Deep Security Agent.

## Requirements

All of the playbooks in this repository require a working Deep Security infrastructure. The key component is the Trend Micro Deep Security Manager. The agents (which these playbooks help you manage) do the heavy lifting but the manager gives the marching orders. 

There are no specific technical requirements beyond a standard Ansible deployment.

## Variables

#### Playbook : default.yml

The "default" playbook imports the "dsa-install" and "dsa-activate" playbooks internally.

Key | Type | Description | Default
----|------|-------------|--------
dsm_agent_download_hostname | String | Hostname of the Deep Security Manager. | app.deepsecurity.trendmicro.com
dsm_agent_download_port | Int | The port to connect to the Deep Security Manager to download the agents. This is typically the same port as the one used to access the Deep Security Manager admin interface. | 443
dsm_agent_activation_hostname | String | The hostname for the agents to communicate with once deployed. For Marketplace and software deployments this is typically the same hostname as 'dsm_agent_download_hostname'. | agents.deepsecurity.trendmicro.com
dsm_agent_activation_port | Int | The port to use for the agent heartbeat (the regular communication). For Marketplace and software deployments, the default is 4120. | 443
tenant_id | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
token | String | In a multi-tenant installation (like Trend Micro Deep Security as a Service), this identifies the tenant account to register the agent with. |
policy_id | String | The Deep Security ID assigned to the policy to apply to the agents on activation. |
force_reactivation | Boolean | Whether to force re-activation even Deep Security Agent has been activated. | false


#### Playbook : dsa-install.yml

"dsa-install" playbook will download and install the Deep Security Agent service. Installation will be skipped if agent with same version already installed. If downloaded Deep Security Installer version is newer, then version upgrade will be performed.

Key | Type | Description | Default
----|------|-------------|--------
dsm_agent_download_hostname | String | Hostname of the Deep Security Manager. | app.deepsecurity.trendmicro.com
dsm_agent_download_port | Int | The port to connect to the Deep Security Manager to download the agents. This is typically the same port as the one used to access the Deep Security Manager admin interface. | 443


#### Playbook : dsa-activate.yml

"dsa-activate" playbook will activate the Deep Security Agent service by registering into Trend Micro Deep Security Manager. By default, this recipe will skip activation if agent already in activated state, unless 'force_reactivation' attribute is set to 'true'.

Key | Type | Description | Default
----|------|-------------|--------
dsm_agent_activation_hostname | String | The hostname for the agents to communicate with once deployed. For Marketplace and software deployments this is typically the same hostname as 'dsm_agent_download_hostname'. | agents.deepsecurity.trendmicro.com
dsm_agent_activation_port | Int | The port to use for the agent heartbeat (the regular communication). For Marketplace and software deployments, the default is 4120. | 443
tenant_id | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
token | String | In a multi-tenant installation (like Trend Micro Deep Security as a Service), this identifies the tenant account to register the agent with. |
policy_id | String | The Deep Security ID assigned to the policy to apply to the agents on activation. |
force_reactivation | Boolean | Whether to force re-activation even Deep Security Agent has been activated. | false


#### The other playbooks assumes that Trend Micro Deep Security Agent is installed and activated properly and they can be used without any additional variables.