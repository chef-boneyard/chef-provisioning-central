# encoding: UTF-8
require 'infrataster/rspec'
require 'infrataster-plugin-chef'

Infrataster::ChefServer.define(
  'server1',
  '192.168.20.10',
  chefnode: File.expand_path('provision/repo/nodes/server1.json'),
  vagrant: true
)

Infrataster::ChefServer.define(
  'server2',
  '192.168.20.11',
  chefnode: File.expand_path('provision/repo/nodes/server2.json'),
  vagrant: true
)

Infrataster::ChefServer.define(
  'testclient',
  '192.168.20.12',
  chefnode: File.expand_path('provision/repo/nodes/testclient.json'),
  vagrant: true
)
