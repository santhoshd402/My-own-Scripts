#
# Cookbook:: .
# Recipe:: permissions
#
# Copyright:: 2019, The Authors, All Rights Reserved.
file '/home/ubuntu/hello.txt' do
    content 'hello'
    action :create
    notifies :run, 'bash[permissions]', :immediately
end

bash 'permissions' do
    code <<-EOH
    chgrp -R tomcat /opt/tomcat
    chmod -R g+r opt/tomcat/conf
    chmod g+x opt/tomcat/conf
    chown -R tomcat opt/tomcat/webapps/ opt/tomcat/work/ opt/tomcat/temp/ opt/tomcat/logs/
    EOH
    action :nothing
end
