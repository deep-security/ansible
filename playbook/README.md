# Plays

<dl>
	<dt><a href="dsa-deploy.yml">dsa-deploy.yml</a></dt>
	<dd>Deploys the Deep Security agent to the node<sup>1</sup></dd>

	<dt><a href="dsa-check-in-with-manager.yml">dsa-check-in-with-manager.yml</a></dt>
	<dd>Asks the Deep Security agent to check in with the Deep Security manager (forced heartbeat</a></dd>

	<dt><a href="dsa-create-diagnostic-package.yml">dsa-create-diagnostic-package.yml</a></dt>
	<dd>Creates a diagnostic package for the agent and send it to the Deep Security manager</dd>

	<dt><a href="dsa-create-integrity-baseline.yml">dsa-create-integrity-baseline.yml</a></dt>
	<dd>Create a baseline for the integrity monitoring engine</dd>

	<dt><a href="dsa-recommend-security-policy.yml">dsa-recommend-security-policy.yml</a></dt>
	<dd>Scans the node and recommends a security policy based on the current profile of the node</dd>

	<dt><a href="dsa-scan-for-integrity-changes.yml">dsa-scan-for-integrity-changes.yml</a></dt>
	<dd>Scans the node for changes to the filesystem and memory based on the rules running in the integrity monitoring engine</dd>

	<dt><a href="dsa-scan-for-malware.yml">dsa-scan-for-malware.yml</a></dt>
	<dd>Scans the node for malware</dd>
</dl>

<sup>1</sup>Only the <a href="dsa-deploy.yml">dsa-deploy.yml</a> play requires any data to be passed through vars/. These requirements are outlined in the <a href="vars">/README.md#vars</a> section of the main README. All other recipes run without any additional vars.