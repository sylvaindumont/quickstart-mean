VAGRANTFILE_API_VERSION = "2"

if !Vagrant::Util::Platform.windows?
  ENV["VAGRANT_DEFAULT_PROVIDER"] = "docker"
else
  ENV["VAGRANT_DETECTED_OS"] = ENV["VAGRANT_DETECTED_OS"].to_s + " cygwin"
end

Vagrant.configure(2) do |config|
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 5858, host: 5858
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 35729, host: 35729
  config.vm.define "ludaoo" do |a|
    a.vm.provider "docker" do |d|
      d.name = "ludaoo"
      d.ports = ["9000:9000", "35729:35729", "5858:5858", "8080:8080"]
      d.image = "weboaks/mean"
      d.create_args = ["-it", "weboaks/mean", "/bin/bash", "-c", "/usr/bin/mongod --smallfiles & /usr/sbin/sshd -D -o UseDNS=no -o UsePAM=no"]
      d.has_ssh = true
    end
  end
  config.vm.provider "virtualbox" do |vb, override|
    vb.memory = 2048
    vb.cpus = 3
    override.vm.box = "weboaks/mean"
    override.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: "node_modules/"
  end
  config.vm.provision "shell" do |s|
    s.inline = "nohup Xvfb :99 -ac -screen 0 1280x720x16 &"
  end
end
