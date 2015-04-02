require 'chef/provisioning'

machine_batch 'servers' do
  machine 'server1' do
    run_list [
      'recipe[chef_infrataster::server]'
    ]
    add_machine_options :vagrant_options => {
      'vm.hostname' => 'server1'
    }, :vagrant_config => <<-EOM
    config.vm.network 'private_network', ip: '192.168.20.10'
    EOM
  end

  machine 'server2' do
    run_list [
      'recipe[chef_infrataster::server]'
    ]
    add_machine_options :vagrant_options => {
      'vm.hostname' => 'server2'
    }, :vagrant_config => <<-EOM
    config.vm.network 'private_network', ip: '192.168.20.11'
    EOM
  end
end

machine_batch 'client' do
  machine 'testclient' do
    run_list [
      'recipe[chef_infrataster::default]'
    ]
    add_machine_options :vagrant_options => {
      'vm.hostname' => 'testclient'
    }, :vagrant_config => <<-EOM
    config.vm.network 'private_network', ip: '192.168.20.12'
    EOM
  end
end
