package "php5-fpm" do
    action :install
end

template "/etc/nginx/php.conf" do
    source "php.conf.erb"
    action :create
end
