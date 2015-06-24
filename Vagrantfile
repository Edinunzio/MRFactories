# -*- mode: ruby -*-
# vi: set ft=ruby :


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  #config.vm.network 'forwarded_port', :guest => 7000, :host => 7000, :auto_correct => true
  #config.vm.network 'forwarded_port', :guest => 443, :host => 8081, :auto_correct => true
  config.vm.provision :ansible do |ansible| ansible.playbook = "ansible/playbook.yml"
  config.vm.network :forwarded_port, host: 1234, guest: 7000
  config.vm.network :private_network, ip: "192.168.101.11"

  config.vm.synced_folder '.', '/MR_factories', create: true
  #config.vm.synced_folder 'ansible', '/ansible'

  end



  #if ansible_installed?
    #config.vm.provision 'ansible' do |ansible|
      #ansible.playbook = 'ansible/playbook.yml'
      #ansible.sudo = true
      #ansible.groups = {
          #'application' => %w(MR_factories),
          #'vm' => %w(MR_factories),
          #'mysql' => %w(MR_factories),
          #'development:children' => %w(application vm mysql),
      #}
      #ansible.tags = ENV['TAGS']
      #ansible.raw_arguments = ENV['ANSIBLE_ARGS']
    #end
  #else
    #Dir['../shell/*.sh'].each do |script|
      #config.vm.provision 'shell', :path => script, :privileged => false, :args => ENV['ANSIBLE_ARGS']
    #end
  #end

end
