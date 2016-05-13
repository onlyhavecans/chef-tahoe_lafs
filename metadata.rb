name             'tahoe_lafs'
maintainer       'BitM'
maintainer_email 'WagThatTail@Me.com'
issues_url       'https://github.com/tbunnyman/chef-tahoe_lafs/issues'
source_url       'https://github.com/tbunnyman/chef-tahoe_lafs'
license          'all_rights'
description      'Installs/Configures tahoe-lafs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'

%w{ ubuntu centos }.each do |os|
    supports os
end

depends 'runit'
depends 'python'
depends 'build-essential'
