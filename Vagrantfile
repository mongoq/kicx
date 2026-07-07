Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/noble64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 8192
    vb.cpus = 4
  end

  config.vm.synced_folder ".", "/workspace"

  host_codex_dir = File.expand_path("~/.codex")

  if Dir.exist?(host_codex_dir)
    config.vm.synced_folder host_codex_dir, "/home/vagrant/.codex"
  else
    puts "Host ~/.codex was not found. Codex will be installed inside the VM. Log in later with: codex login"
  end

  config.vm.provision "shell", path: "provision.sh"
end
