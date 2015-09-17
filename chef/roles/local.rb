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