remote_file "#{Chef::Config[:file_cache_path]}/fahclient.rpm" do
  source "https://fah.stanford.edu/file-releases/public/release/fahclient/centos-5.3-64bit/v7.4/fahclient-7.4.4-1.x86_64.rpm"
  action :create_if_missing
end

rpm_package "fahclient" do
  action :install
  source "#{Chef::Config[:file_cache_path]}/fahclient.rpm"
end

file "/etc/fahclient/config.xml" do
  action :create
  data = data_bag_item('config','config')
  content "<config><user value=\"#{data["username"]}\"/><team value=\"#{data["team"]}\"/><passkey value=\"#{data["password"]}\"/></config>"
  notifies :restart,"service[FAHClient]",:immediately
end

service "FAHClient" do
  action:nothing
  supports:restart=> true
end
