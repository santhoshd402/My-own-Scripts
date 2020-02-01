#
# Cookbook:: .
# Recipe:: insta_tomcat
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#source: https://www.apache.org/dist/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz

remote_file '/tmp/apache-tomcat-8.5.45.tar.gz' do
    source 'https://www.apache.org/dist/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz'
    action :create
end

execute 'untar' do
    command 'tar xzvf /tmp/apache-tomcat-8.5.45.tar.gz -C /opt/tomcat --strip-components=1'
    action :run
end
