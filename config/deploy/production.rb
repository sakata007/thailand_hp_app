server "133.167.41.245", user: "deploy", roles: %w{app db web}

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa_hannah),
  port: 2222,
  forward_agent: true,
  auth_methods: %w(publickey)
}