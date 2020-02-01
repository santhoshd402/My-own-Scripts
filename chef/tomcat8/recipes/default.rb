#
# Cookbook:: tomcat8
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
include_recipe "tomcat8::insta_java"
include_recipe "tomcat8::tom_users"
include_recipe "tomcat8::insta_tomcat"
include_recipe "tomcat8::permissions"
include_recipe "tomcat8::tom_service"
include_recipe "tomcat8::config"
include_recipe "tomcat8::deployapp"
