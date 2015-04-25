# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "pokemonmegaman"
client_key               "#{current_dir}/pokemonmegaman.pem"
validation_client_name   "pokey-homeserv-validator"
validation_key           "#{current_dir}/pokey-homeserv-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/pokey-homeserv"
cookbook_path            ["#{current_dir}/../cookbooks"]
