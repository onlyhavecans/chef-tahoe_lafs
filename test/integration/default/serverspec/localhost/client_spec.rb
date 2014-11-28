require 'spec_helper'

describe command('tahoe --version') do
  its(:stdout) { should include 'allmydata-tahoe: 1.10.0' }
  its(:exit_status) { should eq 0 }
end

describe port('3456') do
  it { should be_listening }
end

