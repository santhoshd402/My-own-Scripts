#
# Cookbook:: .
# Recipe:: tom_service
#
# Copyright:: 2019, The Authors, All Rights Reserved.
cookbook_file '/etc/systemd/system/tomcat.service' do
    source 'tomcat.service'
    action :create
    notifies :run, 'bash[reload]', :immediately
end

bash 'reload' do
    code <<-EOH
    systemctl daemon-reload
    systemctl start tomcat
    systemctl enable tomcat
    EOH
    action :nothing
end
