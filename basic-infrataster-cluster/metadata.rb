# rubocop:disable LineLength,SingleSpaceBeforeFirstArg
name                'chef_infrataster'
maintainer          'Paul Thomas'
maintainer_email    'paul+github@paulthomas.eu'
license             'MIT'
description         'An example of how to use chef-provisioning and infrataster'
long_description    IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version             '0.0.1'
recipe              'default', 'Set up a single web server as a demo'

# Only tested on ubuntu 14.04
supports  'ubuntu'

# Uses apache2 to illustrate the example
depends   'apache2'
