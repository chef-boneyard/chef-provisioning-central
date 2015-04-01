machine_batch do
  machine 'web1' do
    recipe 'apt'
    recipe 'apache2'
  end
  machine 'db' do
    recipe 'apt'
    recipe 'postgresql'
  end
end
