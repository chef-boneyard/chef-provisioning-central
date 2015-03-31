# chef_provisioning example

This is an example of how to use chef-provisioning to provision VMs with Vagrant and use infrataster to test against them.

It is taken from https://github.com/dyninc/chef_infrataster

This repository is a demonstration of how to use `chef-provisioning` to provision a VM with `vagrant` and then use `infrataster` to run a test against it.

    server 'server1'
      http 'http://192.168.20.10/' with {:params=>{}, :method=>:get, :headers=>{}}
        responds with 200
    
    server 'server2'
      http 'http://192.168.20.11/' with {:params=>{}, :method=>:get, :headers=>{}}
        responds with 200
    
    server 'testclient'
      can wget from server1
      can wget from server2
    
    Finished in 1.84 seconds (files took 0.54254 seconds to load)
    4 examples, 0 failures

# Requirements
  * Ruby (tested with 1.9.3)
  * Vagrant

# Usage
## Common

    bundle install
    rake generate

## One Test VM

    rake test

## Three Test VMs (two servers, one client)

    rake test_cluster

## Updating recipes and retesting

If you make an alteration to the recipes in the `recipes/` folder or include a new cookbook in the Berksfile you must run `rake update` to update the cookbooks in the test environment.

# What it does

The cookbook will create a virtual machine using Vagrant. Once created it will converge the apache2 cookbook on the VM. Finally it uses infrataster to check that the web server responds.

# How it works

1. Uses chef-provisioning to create the VM defined in `provision/provision.rb` using the vagrant driver defined in `provision/vagrant.rb`
2. chef-provisioning converges the run_list as specified in `provision/provision.rb`
3. rspec runs infrataster the server is defined in `spec/spec_helper.rb` with the example test in `spec/infrataster/default_spec.rb`
