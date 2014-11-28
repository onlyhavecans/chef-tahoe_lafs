require 'serverspec'

set :backend, :exec
set :path, '/sbin:/usr/sbin:/usr/local/bin:$PATH'

puts "OS Family: #{os[:family]}"
puts "OS Release: #{os[:release]}"
