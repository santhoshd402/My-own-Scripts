#
# Cookbook:: .
# Recipe:: config
#
# Copyright:: 2019, The Authors, All Rights Reserved.
template '/opt/tomcat/conf/tomcat-users.xml' do
    source 'deftmp.erb'
    action :create
end

cookbook_file '/opt/tomcat/webapps/manager/META-INF/context.xml' do
    source 'context.xml'
    action :create
end

cookbook_file '/opt/tomcat/webapps/host-manager/META-INF/context.xml' do
    source 'context.xml'
    action :create
end
