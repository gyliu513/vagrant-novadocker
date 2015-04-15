Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
        numNodes = 3
        r = numNodes..1
        (r.first).downto(r.last).each do |i|
                node.vm.box = "ubuntu"
                node.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
                node.vm.provider "virtualbox" do |v|
                    v.name = "node#{i}"
                    v.customize ["modifyvm", :id, "--memory", "1536"]
                    if i == 2
                        v.customize ["modifyvm", :id, "--memory", "2048"]
                    end
                end
                if i < 10
                        node.vm.network :private_network, ip: "10.211.55.10#{i}"
                else
                        node.vm.network :private_network, ip: "10.211.55.1#{i}"
                end
                node.vm.hostname = "node#{i}"
                node.vm.provision "shell", path: "scripts/setup-ubuntu.sh"
        end
end
