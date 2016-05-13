#
# Cookbook Name:: tahoe_lafs
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.


tahoe_dir  = node['tahoe']['home_dir'] || '/var/tahoe'
tahoe_venv = File.join(tahoe_dir, "venv")
tahoe_bin  = File.join(tahoe_venv, "bin", "tahoe")
tahoe_cfg  = File.join(tahoe_dir, "cfgs")

user 'tahoe' do
  supports :manage_home => true
  system   true
end

directory tahoe_dir do
  action :create
  user   'tahoe'
  group  'tahoe'
end

include_recipe 'python'

python_virtualenv tahoe_venv do
  owner 'tahoe'
  group 'tahoe'
  action :create
end

include_recipe 'build-essential'

reqs = []
case node['platform_family']
when 'rhel'
  reqs = %w( sqlite-devel libffi-devel python-crypto openssl-devel )
when 'debian'
  reqs = %w( libffi-dev )
end

reqs.each do |tahoe_requirement|
  package tahoe_requirement
end

%w( Twisted pyOpenSSL service_identity allmydata-tahoe ).each do |python_apps|
  python_pip python_apps do
    action     :install
    virtualenv tahoe_venv
  end
end

directory '/usr/local/bin' do
  action    :create
  recursive true
end

link '/usr/local/bin/tahoe' do
  to tahoe_bin
end

bash 'init_tahoe_cfgs' do
  user   'tahoe'
  code   "#{tahoe_bin} create-node #{tahoe_cfg}"
  not_if { File.directory?(tahoe_cfg) }
end

template File.join(tahoe_cfg, "tahoe.cfg") do
  source "tahoe.cfg.erb"
  owner "root"
  group "root"
  mode "0644"
end

include_recipe 'runit'

runit_service 'tahoe' do
  action         :enable
  owner          "tahoe"
  group          "tahoe"
  default_logger true
  options({
    :command => tahoe_bin,
    :basedir => tahoe_cfg
  }.merge(params))
end
