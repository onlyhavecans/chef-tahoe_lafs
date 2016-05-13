# Description

Installs and configures `tahoe_lafs`, the Least-Authority File System and configures it to run using runit

# Requirements

## Platforms

Tested on:
* Ubuntu 14.04+
* CentOS 6+

## Cookbooks

* runit
* python
* build-essentials

# Recipes

## Default
* Creates the thaoe user
* Installs all the pre-requisites
* tahoe-lafs from pip into a virtualenv
* sets up the config from attributes.
* sets up tahoe serice in runit

# Usage
Set up attributes in a role or wrapper cookbook and include `recipe[tahoe_lafs]`

At minimum you should set set the following configs as needed;
* `node['tahoe']['conf']['node']['nickname']` - set the nickname in tahoe
* `node['tahoe']['conf']['client']['introducer.furl']` - connect to a cluster
* `node['tahoe']['conf']['client']['helper.furl']` - use a helper
* `node['tahoe']['conf']['storage']['enable']` - Use this machine's sotorage
* `node['tahoe']['conf']['client']['introducer.furl']` to connect to a cluster

# Attributes

* `node['tahoe']['home_dir']` - where the venv and config files will be stored
* `node['tahoe']['conf']` - a hash of sections and settings for tahoe.cfg (see below)


This recipe uses a hash to build the tahoe.cfg, allowing for maximum flexibility:

```
default["tahoe"] = {
  "conf" => {
    "node" => {
      "nickname"   => node["hostname"],
      "web.port"   => "tcp:3456:interface=127.0.0.1",
      "web.static" => "public_html",
    },
    "client" => {
      "introducer.furl" => "",
      "shares.needed"   => 3,
...
```

**All availible settings ARE NOT listed in `attributes/default.rb` just several needed defaults.**

You should refer to https://tahoe-lafs.org/trac/tahoe-lafs/browser/docs/configuration.rst to see all availible configurations

# License & Authors
* David 'tBunnyMan' Aronsohn
