# encoding: UTF-8

require 'berkshelf'

desc "Clean up a chef-provisioning test environment"
task :clean do
  puts "Erasing Berksfile-test"
  FileUtils.rm("Berksfile-test") if File.exist? "Berksfile-test"
  puts "Erasing existing Repo..."
  FileUtils.rm_rf(File.join(File.dirname(__FILE__),
                  "provision",
                  "repo")
  )
end

desc "Generate a chef-provisioning test environment"
task :generate do
  cookbookpath = File.join(File.dirname(__FILE__),
                           "provision",
                           "repo",
                           "cookbooks")
  if File.exist? cookbookpath
    puts "Configuration already exists run clean or update"
    exit 1
  end
  puts "Creating a Berksfile-test"
  sh 'cp Berksfile Berksfile-test'
  puts "Creating new repo based on Berksfile-test..."
  FileUtils.rm_rf(cookbookpath)
  testBerksfile = Berkshelf::Berksfile.from_file("Berksfile-test")
  testBerksfile.vendor(cookbookpath)
end

desc "Update a chef-provisioning test environment"
task :update do
  if File.exist? "Berksfile-test"
    testBerksfile = Berkshelf::Berksfile.from_file("Berksfile-test")
    cookbookpath = File.join(File.dirname(__FILE__),
                             "provision",
                             "repo",
                             "cookbooks")
    FileUtils.rm_rf(cookbookpath)
    testBerksfile = Berkshelf::Berksfile.from_file("Berksfile-test")
    testBerksfile.vendor(cookbookpath)
  else
    puts "Run rake generate first and modify Berksfile-test"
  end
end

desc "Provision a vagrant VM and run tests against it"
task :test => ["provision:vagrant"] do
  sh 'rspec spec/infrataster/single_spec.rb'
end

desc "Provision a cluster of vagrant VMs and run tests against it"
task :test_cluster => ["provisioncluster:vagrant"] do
  sh 'rspec spec/infrataster/cluster_spec.rb'
end

namespace :provision do
  desc "Use chef-provisioning to deploy a test environment under vagrant"
  task :vagrant do
    repopath = File.join(File.dirname(__FILE__),
                         "provision",
                         "repo")
    if File.exist? repopath
      sh 'chef-client -z provision/vagrant.rb provision/single.rb -c provision/client.rb'
    else
      puts "#{repopath} does not exist (run rake generate maybe?)"
      exit 1
    end
  end

  desc "Destroy an test environment created by chef-provisioning"
  task :destroy do
    sh 'chef-client -z provision/destroy.rb -c provision/client.rb'
  end
end

namespace :provisioncluster do
  desc "Use chef-provisioning to deploy a test cluster under vagrant"
  task :vagrant do
    repopath = File.join(File.dirname(__FILE__),
                         "provision",
                         "repo")
    if File.exist? repopath
      sh 'chef-client -z provision/vagrant.rb provision/cluster.rb -c provision/client.rb'
    else
      puts "#{repopath} does not exist (run rake generate maybe?)"
      exit 1
    end
  end

  desc "Destroy an test environment created by chef-provisioning"
  task :destroy do
    sh 'chef-client -z provision/destroy.rb -c provision/client.rb'
  end
end
