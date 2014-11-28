name             'tahoe'
maintainer       'BitM'
maintainer_email 'WagThatTail@Me.com'
license          'all_rights'
description      'Installs/Configures tahoe'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu centos }.each do |os|
    supports os
end

depends 'runit'
depends 'python'
depends 'build-essential'
