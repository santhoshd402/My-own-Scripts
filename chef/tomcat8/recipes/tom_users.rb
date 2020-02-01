#
# Cookbook:: .
# Recipe:: tom_users
#
# Copyright:: 2019, The Authors, All Rights Reserved.
directory '/opt/tomcat' do
    action :create
end

user 'tomcat' do
    home '/opt/tomcat'
    shell '/bin/false'
    action :create
end

group 'tomcat' do
    members 'tomcat'
    action :create
end
