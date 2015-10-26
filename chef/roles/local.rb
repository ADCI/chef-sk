name "local"
description "Local environemnt role"

default_attributes(
    "vsftpd" => {
        "allowed" => ["vagrant"],
        "chroot" => ["vagrant"],
        "config" => {
            "listen_address" => "0.0.0.0",
        }
    },

    "nginx-wrapper" => {
        "user" => "vagrant",
        "sites" => {
            "site" => {
                "server_name" => "site.local"
            }
        }
    }
)

run_list(
    "role[webserver]",
    "role[developer]",
    #"role[testing]",
    "recipe[vsftpd]",
    "recipe[nginx-wrapper]"
)