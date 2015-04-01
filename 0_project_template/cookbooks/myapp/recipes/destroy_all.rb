machine_batch do
  action :destroy
  machines Cheffish.chef_server_api(chef_server).get("/nodes").keys
end
