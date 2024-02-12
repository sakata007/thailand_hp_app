server "133.167.41.245", user: "deploy", roles: %w{app db web}

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa_hannah),
  forward_agent: true,
  auth_methods: %w(publickey)
}

upstream unicorn {
// shared内に変更
  server unix:/var/www/thailand_hp_app/shared/tmp/sockets/unicorn.sock;
}

server {
  listen 80;
  server_name 133.167.41.245;
// current内に変更
  root /var/www/thailand_hp_app/current/public;

  location ^~ /assets/ {
    gzip_static on;
    expires max;
    add_header Cache-Control public;
  }

  location @unicorn {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://unicorn;
  }

  try_files $uri/index.html $uri @unicorn;
  error_page 500 502 503 504 /500.html;
}