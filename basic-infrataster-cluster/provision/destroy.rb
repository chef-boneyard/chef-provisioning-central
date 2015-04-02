require 'chef/provisioning'
require 'chef/provisioning/vagrant_driver'

machine 'provisiontest' do
  action :destroy
end
