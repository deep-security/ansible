# Ansible

An Ansible playbook for the Deep Security Agent. This playbook allows you to easily deploy the Deep Security Agent as well as take some common actions from the agent.

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

Below is a sample playbook:

```yaml
- hosts: all
  roles:
    - role: deep-security.deep-security-agent
      action: deploy
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

Please refer to the [Variables](#variables) section for required variables.


## Variables<a id="variables"></a>


#### Task : deploy.yml
###### action: deploy

The <code>deploy</code> task includes the <code>install</code> and <code>activate</code> playbooks internally.

Key | Type | Description | Default
----|------|-------------|--------
dsm_agent_download_hostname | String | The hostname of the Deep Security Manager. | app.deepsecurity.trendmicro.com
dsm_agent_download_port | Int | The port to connect to the Deep Security Manager to download the agents. This is typically the same port as the one used to access the Deep Security Manager administration interface. | 443
dsm_agent_activation_hostname | String | The hostname for the agents to communicate with once deployed. For Marketplace and software deployments, this is typically the same hostname as 'dsm_agent_download_hostname'. | agents.deepsecurity.trendmicro.com
dsm_agent_activation_port | Int | The port used for the agent heartbeat (the regular communication). For Marketplace and software deployments, the default is 4120. | 443
tenant_id | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
token/tenant_password | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. In latest Deep Security Manager, "tenant_password" has been replaced with "token". "tenant_password" has been kept for backwards compatibility |
policy_id | String | The Deep Security ID assigned to the policy and applied to the agents on activation. |
group_id | String | The Deep Security ID assigned to the computer group and applied to the agents on activation. |
force_reactivation | Boolean | Force re-activation even if the Deep Security Agent has already been activated. | false


#### Task : install.yml
###### action: install

The <code>install</code> task downloads and installs the Deep Security Agent. The installation is skipped if an agent of the same version is already installed. If a newer version of Deep Security Installer is already installed, then the version is upgraded.

Key | Type | Description | Default
----|------|-------------|--------
dsm_agent_download_hostname | String | The hostname of the Deep Security Manager. | app.deepsecurity.trendmicro.com
dsm_agent_download_port | Int | The port to connect to the Deep Security Manager to download the agents. This is typically the same port as the one used to access the Deep Security Manager administration interface. | 443


#### Task : activate.yml
###### action: activate

The <code>activate</code> task activates the Deep Security Agent by registering it in Trend Micro Deep Security Manager. By default, activation is skipped if the agent is already activated, unless the <code>force_reactivation</code> attribute is set to <code>true</code>.

Key | Type | Description | Default
----|------|-------------|--------
dsm_agent_activation_hostname | String | The hostname for the agents to communicate with once they are deployed. For Marketplace and software deployments this is typically the same hostname as 'dsm_agent_download_hostname'. | agents.deepsecurity.trendmicro.com
dsm_agent_activation_port | Int | The port to use for the agent heartbeat (the regular communication). For Marketplace and software deployments, the default is 4120. | 443
tenant_id | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. |
token/tenant_password | String | In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with. In latest Deep Security Manager, "tenant_password" has been replaced with "token". "tenant_password" has been kept for backwards compatibility |
policy_id | String | The Deep Security ID assigned to the policy and applied to the agents on activation. |
group_id | String | The Deep Security ID assigned to the computer group and applied to the agents on activation. |
force_reactivation | Boolean | Force re-activation even though the Deep Security Agent has already been activated. | false


#### Task : manage.yml
###### action:

* check-in-with-manager
* create-diagnostic-package
* create-integrity-baseline
* run-recommendation-scans
* scan-for-integrity-changes
* scan-for-malware

The <code>manage</code> task lets you operate the Deep Security Agent without requiring you to log in to the Deep Security Manager. All of the available actions assume that the Deep Security Agent is installed and activated properly. Most of the actions can be triggered without any additional variables. Only <code>set-policy</code> and <code>set-policyid</code> need a corresponding policy name or id.

###### action: set-policy-by-name

Key | Type | Description | Default
----|------|-------------|--------
policy_name | String | The name of the Deep Security policy | 

###### action: set-policy-by-id

Key | Type | Description | Default
----|------|-------------|--------
policy_id | Int | The ID of the Deep Security policy | 

```yaml
- hosts: all
  roles:
    - role: deep-security.deep-security-agent
      action: check-in-with-manager | create-diagnostic-package | ...
      
- name: "Set policy for webservers"
  hosts: web
  roles:
    - role: deep-security.deep-security-agent
      action: set-policy-by-name
      policy_name: MyCompany - Webserver            
```

## How to contribute

We're always open to PRs from the community. To submit one:

1. Fork the repo.
2. Create a new feature branch.
3. Make your changes.
4. Submit a PR with an explanation of your changes or additions.

We'll review your content and work with you to make sure the fix gets pushed out quickly. For further help, please contact the Trend Micro open source support team at deepsecurityopensource@trendmicro.com.
