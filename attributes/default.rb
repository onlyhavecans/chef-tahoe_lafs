default["tahoe"] = {
  "home_dir" => '/var/tahoe',
  "conf" => {
    "node" => {
      "nickname"   => node["hostname"],
      "web.port"   => "tcp:3456:interface=127.0.0.1",
      "web.static" => "public_html",
    },
    "client" => {
      "introducer.furl" => "",
      "shares.needed"   => 3,
      "shares.happy"    => 7,
      "shares.total"    => 10,
    },
    "storage" => {
      "enabled"        => false,
      "readonly"       => false,
      "reserved_space" => "5GB",
      "expire.enabled" => true,
      "expire.mode"    => "age"
    },
    "helper" => {
      "enabled" => true
    },
    "drop_upload" => {
      "enabled"         => false,
      "local.directory" => "~/drop_upload"
    },
  },
}
