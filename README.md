# Ansible

An Ansible playbook for the Deep Security agent. This allows for the easy deployment of the Deep Security agent as well as taking some common actions from the agent.

## Support

This is a community project that is supported by the Deep Security team.

Tutorials, feature-specific help, and other information about Deep Security is available from the [Deep Security Help Center](https://help.deepsecurity.trendmicro.com/Welcome.html). 

For Deep Security specific issues, please use the regular Trend Micro support channels. For issues with the code in this repository, please [open an issue here on GitHub](https://github.com/deep-security/ansible/issues).

## Usage

* Clone this git repo.
* Create an inventory file. Refer to follow pages for further information. 
  * http://docs.ansible.com/ansible/latest/intro_inventory.html
  * http://docs.ansible.com/ansible/devel/plugins/inventory/yaml.html
* Filled in the required variables for playbook. The are contained in the [vars/default.yml](vars/default.yml) file.
* Play the default playbook. 

  ``
  ansible-playbook playbook/default.yml --inventory inventory
  ``

  Or you can run on speific host.

  ``
  ansible-playbook playbook/default.yml --inventory inventory --limit "linux"
  ``

## Contributing

We're always open to PRs from the community. To submit one:

1. Fork the repo
2. Create a new feature branch
3. Make your changes
4. Submit a PR with an explanation of what/why/cavaets/etc.

We'll review and work with you to make sure that the fix gets pushed out quickly.