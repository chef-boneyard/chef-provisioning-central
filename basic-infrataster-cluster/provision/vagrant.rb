require 'chef/provisioning'
require 'chef/provisioning/vagrant_driver'

with_driver "vagrant:#{File.join(File.dirname(__FILE__), '..')}"

vagrant_box 'ubuntu-14.04' do
  url 'https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box'
end

with_machine_options vagrant_options: {
  'vm.box' => 'ubuntu-14.04'
}
