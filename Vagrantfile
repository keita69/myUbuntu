Vagrant.configure("2") do |config|
  config.vm.box = "chenhan/ubuntu-mate-desktop-18.10"
  # REQUIRE PLUGIN > vagrant plugin install vagrant-winnfsd
  # https://qiita.com/centipede/items/5b3cb4965618993cefec
  # config.vm.synced_folder ".\\vagrant_data", "/home/vagrant", type: "nfs", nfs_export: true, nfs_version: 3
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 8065, host: 8065
  # REQUIRE PLUGIN > vagrant plugin install vagrant-disksize 
  # https://qiita.com/yut_h1979/items/c84c490053877beee5c1
  config.disksize.size = '100GB'
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
  # https://akamist.com/blog/archives/520
    vb.customize ["modifyvm", :id, "--nictype1",  "virtio"]
    vb.customize ["modifyvm", :id, "--nictype2",  "virtio"]

  end

  config.vm.provision "install-docker", type: "shell", :path => "install-docker.sh"
  config.vm.provision "install-docker-compose", type: "shell", :path => "install-docker-compose.sh"
  config.vm.provision "install-mattermost-on-docker", type: "shell", :path => "install-mattermost-on-docker.sh"
end
