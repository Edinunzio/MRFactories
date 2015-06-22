# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

def require_plugins(plugins = {})
  needs_restart = false
  plugins.each do |plugin, version|
    next if Vagrant.has_plugin?(plugin)
    cmd =
        [
            'vagrant plugin install',
            plugin
        ]
    cmd << "--plugin-version #{version}" if version
    system(cmd.join(' ')) || exit!
    needs_restart = true
  end
  exit system('vagrant', *ARGV) if needs_restart
end

require_plugins \
  'vagrant-bindfs' => '0.3.2'

def ansible_installed?
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).any? do |p|
    exts.any? do |ext|
      full_path = File.join(p, "ansible-playbook#{ext}")
      File.executable?(full_path) && File.file?(full_path)
    end
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  config.vm.network 'forwarded_port', :guest => 80, :host => 7000, :auto_correct => true
  config.vm.network 'forwarded_port', :guest => 443, :host => 8081, :auto_correct => true
  config.vm.provision :ansible do |ansible| ansible.playbook = "ansible/playbook.yml"
  end

  if ansible_installed?
    config.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'ansible/playbook.yml'
      ansible.sudo = true
      ansible.groups = {
          'application' => %w(MR_factories),
          'vm' => %w(MR_factories),
          'mysql' => %w(MR_factories),
          'development:children' => %w(application vm mysql),
      }
      ansible.tags = ENV['TAGS']
      ansible.raw_arguments = ENV['ANSIBLE_ARGS']
    end
  else
    Dir['../shell/*.sh'].each do |script|
      config.vm.provision 'shell', :path => script, :privileged => false, :args => ENV['ANSIBLE_ARGS']
    end
  end

end
