#
# Cookbook:: .
# Recipe:: deployapp
#
# Copyright:: 2019, The Authors, All Rights Reserved.
remote_file '/opt/tomcat/webapps/gameoflife.war' do
    source 'https://g-life.s3.amazonaws.com/gameoflife.war'
    action :create
end

service 'tomcat' do
    action :start
end
