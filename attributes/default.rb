default[:tahoe] = {
  :home_dir   => '/var/tahoe',
  :nickname   => node[:hostname],
  :introducer => "",
  :helper     => "",
  :stats      => "",
  :shares     => {
    :needed => 3,
    :happy  => 7,
    :total  => 10
  },
  :storage    => {
    :enabled        => false,
    :readonly       => false,
    :reserved_space => "5GB",
    :expire_enabled => true,
    :expire_mode    => "age"
  }
}
