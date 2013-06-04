# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "quantal64"
    config.vm.box_url = "https://github.com/downloads/roderik/VagrantQuantal64Box/quantal64.box"
    
    config.vm.network :forwarded_port, guest: 80, host: 9001
    config.vm.network :forwarded_port, guest: 6081, host: 9002
    
    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network :private_network, ip: "192.168.33.10"
    
    config.vm.synced_folder "www", "/var/www", :nfs => true
    
    # Enable provisioning with chef solo, specifying a cookbooks path, roles
    # path, and data_bags path (all relative to this Vagrantfile), and adding
    # some recipes and/or roles.
    config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = ["recipes/opscode", "recipes/cookbooks"]
        
        chef.add_recipe "build-essential"
        chef.add_recipe "ohai"
        chef.add_recipe "openssl"
        
        chef.add_recipe "nginx"
        chef.add_recipe "mysql"
        chef.add_recipe "mysql::server"
        chef.add_recipe "php"
        chef.add_recipe "php::module_mysql"
        chef.add_recipe "php::fpm"
        chef.add_recipe "php::xdebug"
        chef.add_recipe "php::phpmyadmin"
        chef.add_recipe "varnish"
        
        chef.json = {
            "mysql" => {
                "server_root_password" => "secret",
                "server_repl_password" => "secret",
                "server_debian_password" => "secret"
            },
            "varnish" => {
                "backend_port" => 80
            }
        }
    end
end
