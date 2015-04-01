class MyApp
  def initialize(run_context)
    @run_context = run_context
  end

  attr_reader :run_context

  def project_root
    Chef::Config.chef_repo_path
  end
  def project_name
    File.basename(project_root)
  end
  def chef_repo_path
    project_root
  end
  def dependencies_repo_path
    repo_path = File.join(project_root, 'dependencies')
    Dir.mkdir(repo_path) if !File.exist?(repo_path)
    if !File.exist?(File.join(repo_path, 'cookbooks'))
      system("berks install -b #{File.join(project_root, 'Berksfile')}")
      system("berks vendor #{File.join(repo_path, 'cookbooks')} -b #{File.join(project_root, 'Berksfile')}")
    end
    repo_path
  end
  def driver_repo_path
    driver_url = run_context.chef_provisioning.current_driver
    scheme = driver_url.split(':', 2)[0]
    repo_path = File.join(project_root, "#{scheme}_driver_repo")
    Dir.mkdir(repo_path) if !File.exist?(repo_path)
    repo_path
  end
end

module Chef::DSL::Recipe
  def my_app
    MyApp.new(run_context)
  end
end
