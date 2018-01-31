if os[:family] == 'windows'
  describe package('Trend Micro Deep Security Agent') do
    it { should be_installed }
  end
elsif os[:family] == 'debian'
  describe package('ds-agent') do
    it { should be_installed }
  end
else
  describe package('ds_agent') do
    it { should be_installed }
  end
end

dsa_cert_directory = nil
dsa_cert_file = nil
dsm_cert_file = nil

if os[:family] == 'windows'
  program_data = os_env('PROGRAMDATA').content
  dsa_cert_directory = program_data + '\Trend Micro\Deep Security Agent\dsa_core'
  dsa_cert_file = program_data + '\Trend Micro\Deep Security Agent\dsa_core\ds_agent.crt'
  dsm_cert_file = program_data + '\Trend Micro\Deep Security Agent\dsa_core\ds_agent_dsm.crt'
else
  dsa_cert_directory = '/var/opt/ds_agent/dsa_core'
  dsa_cert_file = '/var/opt/ds_agent/dsa_core/ds_agent.crt'
  dsm_cert_file = '/var/opt/ds_agent/dsa_core/ds_agent_dsm.crt'
end

describe file("#{dsa_cert_directory}") do
  it { should exist }
  it { should be_directory }
end

describe file("#{dsa_cert_file}") do
  it { should exist }
  it { should be_file }
end

describe file("#{dsm_cert_file}") do
  it { should exist }
  it { should be_file }
end
