#
# Cookbook:: .
# Recipe:: insta_java
#
# Copyright:: 2019, The Authors, All Rights Reserved.
apt_update 'ubuntu' do
    action :update
end

apt_package 'default-jdk' do
    action :install
end

