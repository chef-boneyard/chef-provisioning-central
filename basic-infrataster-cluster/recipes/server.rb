include_recipe 'apache2'
include_recipe 'apache2::mod_status'

apache_site "default" do
  action :enable
end
