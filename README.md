# Ansible

An Ansible playbook for the Deep Security agent. This allows for the easy deployment of the Deep Security agent as well as taking some common actions from the agent.

<a name="vars"></a>
## Vars

For play dsa-deploy the follow vars need to be set. The are contained in the [vars/dsa-deploy.yml](vars/dsa-deploy.yml) file.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>dsm_agent_download_hostname</tt></td>
    <td>String</td>
    <td>Hostname of the Deep Security manager</td>
    <td><tt>app.deepsecurity.trendmicro.com</tt></td>
  </tr>
  <tr>
    <td><tt>dsm_agent_download_port</tt></td>
    <td>Int</td>
    <td>The port to connect to the Deep Security manager on to download the agents. This is typically the same port as the admin web access</td>
    <td><tt>443</tt></td>
  </tr>
  <tr>
    <td><tt>dsa_activation_hostname</tt></td>
    <td>String</td>
    <td>The hostname for the agents to communicate with once deployed. For Marketplace AMI and software deployments this is typically the same hostname as 'dsm_agent_download_hostname'</td>
    <td><tt>agents.deepsecurity.trendmicro.com</tt></td>
  </tr>
  <tr>
    <td><tt>dsa_activation_port</tt></td>
    <td>Int</td>
    <td>The post to use for the agent heartbeat (the regular communication). For Marketplace AMI and software deployments, the default is 4118</td>
    <td><tt>443</tt></td>
  </tr>
  <tr>
    <td><tt>tenant_id</tt></td>
    <td>String</td>
    <td>In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>tenant_password</tt></td>
    <td>String</td>
    <td>In a multi-tenant installation (like Deep Security as a Service), this identifies the tenant account to register the agent with</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>policy_id</tt></td>
    <td>String</td>
    <td>The Deep Security ID assigned to the policy to apply to the agents on activation</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

## Contributing

We're always open to PRs from the community. To submit one:

1. Fork the repo
1. Create a new feature branch
1. Make your changes
1. Submit a PR with an explanation of what/why/cavaets/etc.

We'll review and work with you to make sure that the fix gets pushed out quickly.