require 'chef/provisioning/aws_driver'

with_driver 'aws'

# Create a Chef server specific to this cluster that still has access to existing cookbooks
with_chef_local_server chef_repo_path: [
  my_app.driver_repo_path, # This is where new nodes, clients, etc. go
  my_app.chef_repo_path, # This is where the myapp cookbook is
  my_app.dependencies_repo_path # This is where berkshelf vendored its stuff
]
